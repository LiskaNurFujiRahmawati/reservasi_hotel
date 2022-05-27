<!-- memanggil isi file dasboard.php di folder view/admin -->

<?=$this->extend('admin/dashboard');?>
<!-- area putih halaman dasboard -->

<?=$this->section('konten');?>
<h2><?=$JudulHalaman;?></h2>
<?=$IntroText;?>

<form method="POST" action="<?=site_url('/tambah-fasilitas-hotel');?>"enctype="multipart/form-data">

<div class="form-group">
    <label class="font-weight-bold">Nama Fasilitas</label>
    <input type="text" name="txtNamaFasilitas" class="form-control"/>
</div>

<div class="form-group">
    <label class="font-weight-bold">Deskripsi Fasilitas</label>
    <input type="text" name="txtDeskripsiFasilitas" class="form-control"/>
</div>

<div class="form-group">
    <label class="font-weight-bold">Foto Fasilitas</label>
    <input type="file" name="txtFotoFasilitas" class="form-control"/>
</div>

<div class="form-group">
    <button class="btn btn-primary">Simpan Data</button> 
</div>

</form>
<?=$this->endsection();?>
