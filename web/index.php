<?php

// Require dependendies
$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->addPsr4('Site\\', __DIR__.'/../src/');

// Config
$config = array();
switch($_SERVER['HTTP_HOST'])
{
	case 'localhost':
	case 'localhost:8888':
		$config['debug'] = false;
		$config['db_host'] = 'localhost';
		$config['db_name'] = 'polopan';
		$config['db_user'] = 'root';
		$config['db_pass'] = 'root';
		break;
}

// Init Silex
$app = new Silex\Application();
$app['debug'] = true;
// $app['config'] = $config;


// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));

$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
			'db.options' => array (
					'driver'    => 'pdo_mysql',
					'host'      => 'localhost',
					'dbname'    => 'polopan',
					'user'      => 'root',
					'password'  => 'root',
					'charset'   => 'utf8'
			),
	));

$app['db']->setFetchMode(PDO::FETCH_OBJ);


// Route
$app->get('/', function() use ($app)
{
    return $app['twig']->render('pages/home.twig');
})
->bind('home');



$app->get('/albums', function() use ($app)
{
			$data = array();

			$albumsModel = new Site\Models\Albums($app['db']);
			$data['albums'] = $albumsModel->getAll();

			return $app['twig']->render('pages/albums.twig', $data);
})
->bind('albums');



$app->get('/titres', function() use ($app)
{
    $data = array();

    $albumsModel = new Site\Models\Albums($app['db']);
    $data['songs'] = $albumsModel->getAllSongs();
    return $app['twig']->render('pages/titles.twig',$data);
})
->bind('titres');



$app
	->get('/album/{id}', function($id) use ($app)
	{
		$data = array();

		$albumsModel = new Site\Models\Albums($app['db']);
		$data['album'] = $albumsModel->getAlbumInformation($id);
		$data['songs'] = $albumsModel->getSongsbyAlbumId($id);

		if(!$data['album'])
		{
			$app->abort(404);
		}

	    return $app['twig']->render('pages/album.twig', $data);
	})
	->assert('id', '[1-5]')
	->bind('album');


// Run Silex
$app->run();
