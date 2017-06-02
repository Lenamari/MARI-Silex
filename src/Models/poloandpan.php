<?php

namespace Site\Models;

class Albums
{
    public $db;

    public function __construct($db)
      {
          $this->db = $db;
      }

      public function getAll()
  	{
  		$query = $this->db->query('SELECT * FROM albums');
  		$albums = $query->fetchAll();

  		return $albums ;
  	}

    	public function getById($id)
    	{
    		$prepare = $this->db->prepare('
    			SELECT * FROM albums WHERE id = :id LIMIT 1
    		');
    		$prepare->bindValue('id', $id);
    		$prepare->execute();
    		$album = $prepare->fetch();

  		// if($pokemon)
  		// {
  		// 	$pokemon->types = $this->_getTypesByPokemonId($pokemon->id);
  		// }
      //
  		// return $pokemon;
  	}
}
