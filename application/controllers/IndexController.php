<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }
    

    /**
     * Index 
     * Show list of tweets 
     * Possibility to retweet, reply
     * PHP Task: IV
     */
    public function indexAction()
    {
		$args  = array();
		//Twitter ID/Accound and Option to get the twitter data for
		$args['twitter_user_id'] = 19068239;//eKomi Twitter ID
    	$tweetsObj = new Model_tweets();
    	$tweets = $tweetsObj->getTweets($args, "tweets.id", "DESC");
 
    	//pass set of tweets to the view (index.phtml)
    	$this->view->tweets = $tweets;

    }
    
    
    /**
     * Call this action to perform a periodic update
     * PHP Task: III
     */
    public function cronAction()
    {
    	//Twitter ID/Accound and Option to perform the update for
    	$twitterID = 19068239; //eKomi Twitter ID
    	$twitterOpts = array(
    			'oauth_access_token' => "3259954913-8GhSfnMkQ3ZJQz2LfCJLtd7Rhe6a5kkLUTjqoHI",
    			'oauth_access_token_secret' => "cJyFmFOnZFzKYTCzMOfb6oZgXXvkskAo1c5hFw5s8d9hX",
    			'consumer_key' => "gi1gM8gRB1AejPImXw4j3irXm",
    			'consumer_secret' => "ekHK2pWW5wgRLxv5y04sQF8FgQ5nVkbGcyrvqDMUkXRgdKpjWX"
    	);
    	 
    	// Perform the request
    	require_once APPLICATION_PATH ."/TwitterApi.php";
    
    	//create a TwitterApi Instance
    	$twitter = new TwitterApi($twitterOpts);
    	
    	//call saveTweets Method to perform an initial insert of twitter data
    	//when there are no records in the database for the given twitter ID
    	//$result = $twitter->saveTweets($twitterID);
    	
    	//call updateTweets Method to perform a periodic update
    	$result =  $twitter->updateTweets($twitterID);
		$this->view->result = $result;
    
    }
}
