<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class DashboardUser extends BaseController
{
    public function index()
    {
        return view ('Admin/Dashboard');
    }
}
