<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\CLIRequest;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;

//meregister model
use App\Models\MAdmin;
use App\Models\MFasilitashotel;
use App\Models\MFasilitaskamar;
use App\Models\MKamar;
use App\Models\MDetailkamar;
use App\Models\MReservasi;


/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */
class BaseController extends Controller
{
    /**
     * Instance of the main Request object.
     *
     * @var CLIRequest|IncomingRequest
     */
    protected $request;
    //membuat properti Admin
    protected $Admin;
    protected $Fasilitashotel;
    protected $Fasilitaskamar;
    protected $Kamar;
    protected $Detailkamar;
    protected $Reservasi;

    /**
     * 
     * 
     * An array of helpers to be loaded automatically upon
     * class instantiation. These helpers will be available
     * to all other controllers that extend BaseController.
     *
     * @var array
     */
    protected $helpers = ['fasilitaskamar'];

    /**
     * Constructor.
     */
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);

        // Preload any models, libraries, etc, here.

        // E.g.: $this->session = \Config\Services::session();
        $this->Admin = NEW MAdmin;
        $this->Fasilitashotel = NEW MFasilitashotel;
        $this->Fasilitaskamar = NEW MFasilitaskamar;
        $this->Kamar = NEW MKamar;
        $this->Detailkamar = NEW MDetailkamar;
        $this->Reservasi = NEW MReservasi;
    }
}
