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
$app['config'] = $config;


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
    return $app['twig']->render('pages/albums.twig');
})
->bind('albums');

$app->get('/album/{number}', function($number) use ($app)
{
    return 'Page number: '.$number;
})
->assert(number, '[1-5]')
->bind('album');

$app->get('/titres', function() use ($app)
{
    return $app['twig']->render('pages/titles.twig');
})
->bind('titres');

$app
	->get('/album/{id}', function($id) use ($app)
	{
		$data = array();

		$albumsModel = new Site\Models\Albums($app['db']);
		$data['album'] = $albumsModel->getById($id);

		if(!$data['album'])
		{
			$app->abort(404);
		}

		$data['title'] = $data['album']->name;

	    return $app['twig']->render('pages/album.twig', $data);
	})
	->assert('id', '\d+')
	->bind('album');

// Run Silex
$app->run();
