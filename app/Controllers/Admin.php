<?php

namespace App\Controllers;
use App\Controllers\BaseController;

class Admin extends BaseController
{
    public function index()
    {
        return view('admin/login');
    }

    public function login()
    {
       
        //1. menampung username dan password
        $usernya     = $this->request->getPost('txtUser');
        $passwordnya = md5($this->request->getPost('txtPass'));
        
        //aray
        $syarat=[
            'username'=>$usernya,
            'password'=>$passwordnya
        ];
        //mencari user berdasarkan syarat diatas
        $queryUser = $this->Admin->where($syarat)->find();

        //sql = select *from tbl_user where username =? and passwordnya=?
        //membuktikan  apakah user ada atau tidak
        //var_dump($queryUser);
        
        if(count($queryUser)==1){
            //membuat session
            $dataSession=[
            'user'=>$queryUser[0]['username'],
            'nama'=>$queryUser[0]['namauser'],
            'level'=>$queryUser[0]['leveluser'],
            'sudahkahLogin'=>true
            ];
            session()->set($dataSession);
        return redirect()->to(site_url('/dashboard'));
            echo'sukses login';
        }else{

            //mengembalikan ke halaman login
            return redirect()->to(site_url('/login'))->with('info','Gagal Login');
        }
    }
        public function Logout(){
            session()->destory();
            return redirect()->to(site_url('/login'));
        }
}