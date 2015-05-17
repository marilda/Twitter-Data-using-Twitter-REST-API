<?php
/**
 * Manages database actions with tweet users objects
 * @author Marilda Mancka
 *
 */
class Model_users extends Zend_Db_Table_Abstract {
	
	//name of the database table
	protected $_name = 'users';	
	
	
	/**
	 * Get user by id
	 *
	 */
	public function getUserById($id) 
	{
		//no implementation
	}
	
	
	/**
	 * Insert users data
	 * @param array $data 
	 */
	public function insertUsers(array $data) {
	
		//create query
		$query = "INSERT INTO users (id, id_str, screen_name, fullname, description, location, statuses_count, followers_count, friends_count, favourites_count, url, ";
		$query .= " profile_image_url, created_at, lang) ";
		$query .= " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
		$stmt = $this->getAdapter()->prepare($query);

		//execute query for multiple insert
		foreach($data as $user){
			$stmt->execute(array($user['id'], $user['id_str'], $user['screen_name'], $user['name'], $user['description'], $user['location']
					, $user['statuses_count'], $user['followers_count'], $user['friends_count'], $user['favourites_count'], $user['url']
					, $user['profile_image_url'], $user['created_at'], $user['lang']));
		}
	
	}
	
	
	/**
	 * Update Twitter User/Account data
	 *
	 */
	public function updateUser()
	{
		//no implementation
	}
	
	
	/**
	  * Get list of Users
	  * 
	  */
	public function getUsers() {
		//no implementation
	}
	
}