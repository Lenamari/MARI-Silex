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


    public function getAlbumInformation($id)
    {
        $prepare = $this->db->prepare('
            SELECT
                *
            FROM
                albums_songs
            LEFT JOIN
                albums
            ON
                albums_songs.id_albums = albums.id
            WHERE
                id_albums = :id
        ');
        $prepare->bindValue('id', $id);
        $prepare->execute();
        $songs = $prepare->fetch();

        // echo'<pre>';
        // print_r($songs);
        // echo '</pre>';
        // exit();


        return $songs;
    }



    public function getSongsbyAlbumId($id)
    {
        $prepare = $this->db->prepare('
            SELECT
                *
            FROM
                songs
            LEFT JOIN
                albums_songs
            ON
                songs.id = albums_songs.id_songs
            WHERE
                id_albums = :id

        ');
        $prepare->bindValue('id', $id);
        $prepare->execute();
        $songs = $prepare->fetchAll();

        // echo'<pre>';
        // print_r($songs);
        // echo '</pre>';
        // exit();


        return $songs;
    }

    public function getAllSongs()
    {
      $query = $this->db->query('
          SELECT
              *
          FROM
              songs
      ');

      $songs = $query->fetchAll();

      return $songs;
    }
}
