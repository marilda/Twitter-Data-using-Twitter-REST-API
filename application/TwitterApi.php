<?php

/**
 * Twitter Api Class 
 * Get twitter data through the Twitter REST Api
 */
class TwitterApi
{
    /**
     * @var string
     */
    private $oauth_access_token;

    /**
     * @var string
     */
    private $oauth_access_token_secret;

    /**
     * @var string
     */
    private $consumer_key;

    /**
     * @var string
     */
    private $consumer_secret;

    /**
     * @var string
     */
    private $getfield;

    /**
     * @var mixed
     */
    protected $oauth;

    /**
     * @var string
     */
    public $url;

    /**
     * @var string
     */
    public $requestMethod;

    /**
     * Create the API access object. Requires an array of settings::
     * Set authentication data: oauth access token, oauth access token secret, consumer key, consumer secret
     * Requires the cURL library
     *
     * @param array $settings
     */
    public function __construct($settings)
    {
		if (!in_array('curl', get_loaded_extensions())) 
        {
            throw new Exception('You need to install cURL!');
        }
        
        if (!isset($settings['oauth_access_token'])
            || !isset($settings['oauth_access_token_secret'])
            || !isset($settings['consumer_key'])
            || !isset($settings['consumer_secret']))
        {
            throw new Exception('Incorrect parameters!');
        }

        $this->oauth_access_token = $settings['oauth_access_token'];
        $this->oauth_access_token_secret = $settings['oauth_access_token_secret'];
        $this->consumer_key = $settings['consumer_key'];
        $this->consumer_secret = $settings['consumer_secret'];
    }

    
    /**
     * Set get parameters string, example: '?screen_name=eKomi'
     * Used to query the Twitter Search API
     * @param string $string Get key and value pairs as string
     */
    public function setGetfield($string)
    {
       
        $getfields = preg_replace('/^\?/', '', explode('&', $string));
        $params = array();

        foreach ($getfields as $field)
        {
            if ($field !== '')
            {
                list($key, $value) = explode('=', $field);
                $params[$key] = $value;
            }
        }

        $this->getfield = '?' . http_build_query($params);
        
        return $this;
    }
    
    /**
     * Returns get parameters used in the query 
     * 
     * @return string $this->getfields
     */
    public function getGetfield()
    {
        return $this->getfield;
    }
    
    
    /**
     * Build the Oauth object using params set in construct and other
     * 
     * @param string $url The API url. Example: https://api.twitter.com/1.1/search/tweets.json
     * @param string $requestMethod Either POST or GET
     * 
     */
    public function buildOauth($url, $requestMethod)
    {
        if (!in_array(strtolower($requestMethod), array('post', 'get')))
        {
            throw new Exception('Request method must be either POST or GET');
        }
        
        $consumer_key              = $this->consumer_key;
        $consumer_secret           = $this->consumer_secret;
        $oauth_access_token        = $this->oauth_access_token;
        $oauth_access_token_secret = $this->oauth_access_token_secret;
        
        $oauth = array(
            'oauth_consumer_key' => $consumer_key,
            'oauth_nonce' => time(),
            'oauth_signature_method' => 'HMAC-SHA1',
            'oauth_token' => $oauth_access_token,
            'oauth_timestamp' => time(),
            'oauth_version' => '1.0'
        );
        
        $getfield = $this->getGetfield();
        
        if (!is_null($getfield))
        {
            $getfields = str_replace('?', '', explode('&', $getfield));

            foreach ($getfields as $g)
            {
                $split = explode('=', $g);

                /** In case a null is passed through **/
                if (isset($split[1]))
                {
                    $oauth[$split[0]] = urldecode($split[1]);
                }
            }
        }
        
        $base_info = $this->buildBaseString($url, $requestMethod, $oauth);
        $composite_key = rawurlencode($consumer_secret) . '&' . rawurlencode($oauth_access_token_secret);
        $oauth_signature = base64_encode(hash_hmac('sha1', $base_info, $composite_key, true));
        $oauth['oauth_signature'] = $oauth_signature;
        
        $this->url = $url;
        $this->requestMethod = $requestMethod;
        $this->oauth = $oauth;
        
        return $this;
        
    }
    
    /**
     * Retrieve the data through cURL
     * 
     * @param boolean $return  If true, returns json data. 
     * @param array   $curlOptions Additional Curl options for this request
     *
     * @throws \Exception
     * 
     * @return string json
     */
    public function performRequest($return = true, $curlOptions = array())
    {
        if (!is_bool($return))
        {
            throw new Exception('performRequest parameter must be true or false');
        }

        $header =  array($this->buildAuthorizationHeader($this->oauth), 'Expect:');

        $getfield = $this->getGetfield();
        $options = array(
            CURLOPT_HTTPHEADER => $header,
            CURLOPT_HEADER => false,
            CURLOPT_URL => $this->url,
            CURLOPT_RETURNTRANSFER => true,
        	CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_TIMEOUT => 10,
        ) + $curlOptions;


        if ($getfield !== '')
        {
        	$options[CURLOPT_URL] .= $getfield;
        }


        $feed = curl_init();
        curl_setopt_array($feed, $options);
        $json = curl_exec($feed);

        if (($error = curl_error($feed)) !== '')
        {
            curl_close($feed);

            throw new \Exception($error);
        }

        curl_close($feed);

        return $json;
    }
    
    /**
     * Generates the base string used by cURL
     * 
     * @param string $baseURI
     * @param string $method
     * @param array  $params
     * 
     * @return string Built base string
     */
    private function buildBaseString($baseURI, $method, $params) 
    {
        $return = array();
        ksort($params);
        
        foreach($params as $key => $value)
        {
            $return[] = rawurlencode($key) . '=' . rawurlencode($value);
        }
        
        return $method . "&" . rawurlencode($baseURI) . '&' . rawurlencode(implode('&', $return)); 
    }
    
    /**
     * Generates the authorization header used by cURL
     * 
     * @param array $oauth Array of oauth data generated by buildOauth()
     * 
     * @return string $return Header used by cURL for request
     */    
    private function buildAuthorizationHeader(array $oauth)
    {
        $return = 'Authorization: OAuth ';
        $values = array();
        
        foreach($oauth as $key => $value)
        {
            if (in_array($key, array('oauth_consumer_key', 'oauth_nonce', 'oauth_signature',
                'oauth_signature_method', 'oauth_timestamp', 'oauth_token', 'oauth_version'))) {
                $values[] = "$key=\"" . rawurlencode($value) . "\"";
            }
        }
        
        $return .= implode(', ', $values);
        return $return;
    }

    /**
     * Helper method to perform our request
     *
     * @param string $url
     * @param string $method
     * @param string $data
     * @param array  $curlOptions
     *
     * @throws \Exception
     *
     * @return string The json response from the server
     */
    public function request($url, $method = 'get', $data = null, $curlOptions = array())
    {
        if (strtolower($method) === 'get')
        {
            $this->setGetfield($data);
        }
        
        return $this->buildOauth($url, $method)->performRequest(true, $curlOptions);
    }
    
    
    /**
     * Method that returns a given number of tweets for a given twitter ID
     * @param int $twitterID
     * @param int $tweetsNo
     * 
     * @return array 
     */
    public function fetchTweets($twitterID, $tweetsNo = 20)
    {
    	$url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
    	$getfield = "?user_id=$twitterID&count=$tweetsNo";
    	$requestMethod = 'GET';
    	 
    	$response = $this->setGetfield($getfield)
	    	->buildOauth($url, $requestMethod)
	    	->performRequest();
    	 
    	$tweets = json_decode($response, true);
		return $tweets;
    }
    
    /**
     * PHP Task - I(b)
     * Retrieve set of tweets related to a given twitter ID and store the results in the database
     * Used for the initial insertion (when 0 entries in the database)
     * @param int $twitterID
     */
    public function saveTweets($twitterID)
    {
    	//fetch twitter data
    	$tweets = $this->fetchTweets($twitterID, 30);

    	//store twitter data in the database
    	//create a Tweets object (Model/Database Object)
    	$tweetsObj = new Model_tweets();
    	$result = $tweetsObj->insertTweets($tweets);
    	
    	if ($result===true)
    		return "Tweets added successfully!";
    	else 
    		return $result;

    }
    
    
    /**
     * PHP Task - III
     * Updates the twitter data periodically
     * Only new tweets are inserted in the database 
     * Assumption: Previous Twitter data are considered to be the same. 
     * Additional logic needs to be applies otherwise 1. Delete and insert all 2. Update changed data in previous ones
     * @param int $twitterID
     * 
     */
    public function updateTweets($twitterID)
    {
 		//update time in seconds
    	$updateTime = "1800";
    	
    	//get time of the last registered tweet
    	$tweetsObj = new Model_tweets();
    	$last_tweet_update_time = $tweetsObj->getLastTweetUpdateTime($twitterID);
    	
    	$current_time = date("Y-m-d h:i:s", time());
    	//perform periodic update only every half an hour
    	if ($current_time > ($last_tweet_update_time + $updateTime)) {
			
    		//get current updated tweets
    		$tweets = $this->fetchTweets($twitterID, 30);
    		//insert in the database only newly created tweets
    		$result = $tweetsObj->insertTweets($tweets, false, $last_tweet_update_time);
    		if ($result===true)
    			return "Tweets updated successfully!";
    		else
    			return $result;
    	}
    	else {
    		return "Not the time to update yet!";
    	}
    }
     
}
