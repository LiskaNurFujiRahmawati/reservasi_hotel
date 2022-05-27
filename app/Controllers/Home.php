<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        // 1. Daftar kamar
        $data['listKamar']=$this->Kamar->distinct()->find();
        return view('beranda',$data);

    }
    

}
