<?php
/**
 * Manages database actions with tweets objects
 * @author Marilda Mancka
 *
 */
class Model_tweets extends Zend_Db_Table_Abstract {
	
	//name of the database table
	protected $_name = 'tweets';	
	
	/**
	 * Get tweet by id
	 *
	 */
	public function getTweetById($id) 
	{
	}
	
	
	/**
	  * Get tweets from the database
	  * @param $filters Array of filters to limit the Tweet results to be returned
	  * @param $sortField 
	  * @param $sortDir
	  * 
	  * @return Rowset
	  */
	public function getTweets($filters = array(), $sortField = null, $sortDir = null) {
		
		$select = $this->select ();
		
		$select	->setIntegrityCheck(false)
			->from($this, array("tweets.id", "tweets.id_str"
						, "(CASE WHEN tweets.retweeted_status_id_str is not null THEN tweets.retweeted_status_text else tweets.text end) as tweet_text"
						, "tweets.retweet_count", "tweets.favorite_count", "tweets.created_at"
						, "tweets.retweeted_status_id", "tweets.retweeted_status_id_str", "tweets.retweeted_status_text", "tweets.retweeted_status_created_at"
						, "tweets.lang"
						, "tweets.truncated"
						, "u.screen_name", "u.fullname","u.screen_name", "u.profile_image_url"
						, "retweeted_u.screen_name as retweeted_screen_name", "retweeted_u.fullname as retweeted_fullname", "retweeted_u.profile_image_url as retweeted_profile_image_url"
						))
			->join('users as u', 'u.id_str = tweets.posted_by_user', '')
			->joinleft('users as retweeted_u', 'retweeted_u.id_str = tweets.retweeted_status_user_id_str', '');
						
		if(!empty($filters['posted_by_user']))
			$select->where("tweets.posted_by_user = ?", $filters['posted_by_user']);
		
		if (null != $sortField)
		{
			if (null != $sortDir)
				$sortField = $sortField." ".$sortDir;
				
			$select->order ( $sortField );
		}
		
		$rows = $this->fetchAll($select);
		
		if($rows->count() > 0) {
			return $rows;
		}
		else{
			return null;
  		}
	
	}
	
	
	/**
	 * Insert collection of tweets in the database
	 * @param array $data Set of Tweets to be inserted/updated
	 * @param boolean $initialInsert If false only latest tweets added in the database
	 * @param unknown_type $lastTweetTime Last periodic update time
	 * 
	 * 
	 */
	public function insertTweets(array $data, $initialInsert=true, $lastTweetTime=null) {
	
		$query = "INSERT INTO tweets (id, id_str, text, source, retweet_count, favorite_count, created_at, posted_by_user, in_reply_to_tweet_id, lang, truncated, "; 
		$query .= " retweeted_status_id, retweeted_status_id_str, retweeted_status_text, retweeted_status_created_at, retweeted_status_user_id, retweeted_status_user_id_str) ";
		$query .= " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
	    $stmt = $this->getAdapter()->prepare($query);
	    
    	$twitter_users = array();
    	$twitter_users_ids = array();
    	
    	try {
    		//iterate through every tweet from the collection of tweets (called through the Twitter API)
	    	foreach($data as $tweet){
	    		//the user that posted/retweeted the tweet
	    		$user_data = array();
	    		$user_data = $tweet['user'];
				
	    		//store users id and additional data in arrays by removing dublicates
	    		if (!in_array($tweet['user']['id_str'], $twitter_users_ids)) {
	    			array_push($twitter_users_ids, $tweet['user']['id_str'] );
	    			array_push($twitter_users, $tweet['user'] ) ;
	    		}
	    		
	    		//store the data of the status the given tweets is retweeted from
	    		$retweeted_status_id = null;
	    		$retweeted_status_id_str = null;
	    		$retweeted_status_text = null;
	    		$retweeted_status_created_at = null;
	    		$retweeted_status_user_id = null;
	    		$retweeted_status_user_id_str = null;
	    		
	    		if (array_key_exists('retweeted_status', $tweet)){
		    		$retweeted_status_id = $tweet['retweeted_status']['id'];
		    		$retweeted_status_id_str = $tweet['retweeted_status']['id_str'];
		    		$retweeted_status_text = $tweet['retweeted_status']['text'];
		    		$retweeted_status_created_at = $tweet['retweeted_status']['created_at'];
		    		$retweeted_status_user_id = $tweet['retweeted_status']['user']['id'];
		    		$retweeted_status_user_id_str = $tweet['retweeted_status']['user']['id_str'];
		    		
		    		//add user data in of the original status in the same users array by removing dublicates
		    		if (!in_array($tweet['retweeted_status']['user']['id_str'], $twitter_users_ids)) {
		    			array_push($twitter_users_ids, $tweet['retweeted_status']['user']['id_str'] );
		    			array_push($twitter_users, $tweet['retweeted_status']['user']) ;
		    		}
	    		}
	    		
	    		$tweet_time = strtotime($tweet['created_at']);
	    		if ($initialInsert || (!$initialInsert && (($tweet_time > $lastTweetTime) || ($lastTweetTime == null)))){
		    		//insert tweets in the database
		    		$stmt->execute(array($tweet['id'], $tweet['id_str'], $tweet['text'], $tweet['source'], $tweet['retweet_count'], $tweet['favorite_count']
		    				, $tweet_time, $tweet['user']['id'], $tweet['in_reply_to_status_id'], $tweet['lang'], $tweet['truncated']
		    				, $retweeted_status_id, $retweeted_status_id_str, $retweeted_status_text, $retweeted_status_created_at
		    				, $retweeted_status_user_id, $retweeted_status_user_id_str));
	    		}
	     		
	    	}
	    	
	    	//add users related to the set of tweets inserted (no dublicates )
	    	$usersObj = new Model_users();
	    	$usersObj->insertUsers($twitter_users);
	    	return true;
    	
    	}
    	catch(Exception $e){
    		return $e->getMessage();
     	}
	}
	
	
	public function updateTweets() 
	{
		//no implementation
	}
	

	/**
	 * Get Last time tweets have been inserted in the database (last periodic update time)
	 * @param int $twitterID
	 * 
	 */
	public function getLastTweetUpdateTime($twitterID) {
	
		$select = $this->select ();
	
		$select	->setIntegrityCheck(false)
		->from($this, array("MAX(date_entered) as last_tweet_update_time"));
	
		if(!empty($twitterID))
			$select->where("tweets.posted_by_user = ?", $twitterID);
	
	
		$row = $this->fetchRow($select);
	
		if($row)
			return $row->last_tweet_update_time;
		else
			return null;
	}
}