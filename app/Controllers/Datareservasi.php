<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Datareservasi extends BaseController
{
    public function index()
    {
        return view ('Reservasi/Reservasi');
    }
}
