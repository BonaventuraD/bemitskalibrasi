<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title><?=$this->meta_title;?></title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta name="description" content="<?=$this->meta_description;?>"/>
	<meta name="keywords" content="<?=$this->meta_keywords;?>"/>
	<meta http-equiv="Copyright" content="<?=get_setting('web_name');?>"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="language" content="english"/>
	<meta name="revisit-after" content="7"/>
	<meta name="webcrawlers" content="all"/>
	<meta name="rating" content="general"/>
	<meta name="spiders" content="all"/>
	<link rel="canonical" href="<?=site_url(uri_string());?>"/>

	<!-- favicon -->
    <link rel="favicon" href="<?= base_url(); ?>assets/img/icon.png">

	<!-- metasocial -->
	<?php $this->load->view('meta_social'); ?>

	<!-- stylesheet -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<link rel="stylesheet" href="<?=$this->CI->theme_asset('css/style.css');?>" />

	<!-- script -->
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
	<script src="https://cdn.jsdelivr.net/gh/stevenschobert/instafeed.js@2.0.0rc1/src/instafeed.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<!-- google analytics -->
	<?=google_analytics();?>





    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<?= base_url(); ?>assets/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="<?= base_url(); ?>assets/img/icon.png">
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>



    <!-- Template Main CSS File -->
    <link href="<?= base_url(); ?>newbiz/assets/css/style.css" rel="stylesheet">
</head>
<body>
<header class="sticky-top shadow">
<nav class="warnabgnav navbar navbar-expand-lg navbar-custom ">
            <div class="container-fluid">
                <a class="navbar-brand" href="<?php echo site_url('') ?>">
                    <img src="<?= base_url(); ?>assets/img/logounjukasa.png" alt="Kabinet Unjuk Asa" height="45" class="d-inline-block align-text-top">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#hambergernavbar" aria-controls="hambergernavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse fontnavbar fw-bold" id="hambergernavbar">
                    <!-- Buat ganti warna di navbar Collapse di dalam css bootstrap -->
                    <ul class="ms-auto navbar-nav  mb-2 mb-lg-0">
                        <li class="nav-item px-2">
                            <a class="nav-link active" aria-current="page" href="<?php echo site_url('') ?>">Beranda</a>
                        </li>
                        <li class="nav-item dropdown px-2">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Profil
                            </a>
                            <ul class="dropdown-menu warnabgnav fontnavbar" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/kabinet') ?>">Unjuk Asa </a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/kominrel') ?>">Kominrel</a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/inpus') ?>">Intra Kampus</a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/akarinovasi') ?>">Akar Inovasi</a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/kemahasiswaan') ?>">Kemahasiswaan</a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('profil/gersospol') ?>">Gersospol</a></li>

                            </ul>

                        </li>
                        <li class="nav-item dropdown px-2">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Rilis
                            </a>
                            <ul class="dropdown-menu warnabgnav fontnavbar" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="<?php echo site_url('category/dari-km-its-untuk-indonesia') ?>">Dari KM ITS untuk Indonesia </a></li>
                                <li><a class="dropdown-item" href="<?php echo site_url('category/kabar-dari-bem-its') ?>">Kabar dari BEM ITS</a></li>
                            </ul>
                        </li>
                        <li class="nav-item px-2">
                            <a class="nav-link" href="<?php echo site_url('kalender') ?>">Kalender</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>
	<section>
		<div class="row">
			<?php $this->CI->_layout($this->CI->__content_view); ?>
		</div>
	</section>

    <footer class="text-center text-white slide4Homebg">
    <div class="position-relative d-none d-lg-block">
        <div class="position-absolute top-0 start-0">
            <img src="<?= base_url(); ?>assets/img/ornament/img/ornamenfooterataskiri.png" class="img-fluid " alt="...">
        </div>
    </div>


    <div class="container py-5">
        <div class="row">

            <div class="col-lg-7 col-md-15 col-sm-9 ms-5">
                <div class="col d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                    <div class="ps-5 col-8 fw-normal text-start">
                        <p class="fs-4">Sekretariat BEM ITS:</p>
                        <p class="fs-6">SCC ITS, Keputih Sukolilo Kota SBY,<br>Keputih, Mulyorejo, Surabaya City, East Java<br>60115</p>
                    </div>
                    <iframe class="ms-5 d-flex rounded  w-75 h-auto" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.6244300710227!2d112.79141761396924!3d-7.283502273602015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd7fa1344f5802f%3A0x110c1b2a70e34295!2sSekretariat%20BEM%20ITS!5e0!3m2!1sen!2sid!4v1632029136219!5m2!1sen!2sid" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
            <div class="col-lg-3 col-md-12 col-sm-12 ms-n5">
                <div>
                    <div class="col ps-4 fw-normal text-start d-none d-sm-none d-md-block d-lg-block d-xl-block d-xxl-block">
                        <p class="fs-6">Email:<br>bem@its.ac.id</p>
                        <p class="fs-6">Get in touch with us:</p>
                    </div>
                    <div class="col-sm-12 d-flex justify-content-start">

                        <a class="btn btn-link btn-floating btn-lg text-dark float-start px-4 fw-bolder " target="_blank" href="https://liff.line.me/1645278921-kWRPP32q/?accountId=hbj1464h" role="button" data-mdb-ripple-color="dark"><i style="color: #fcfae6;" class="fab fa-line"></i></a>

                        <!-- Twitter -->
                        <a class="btn btn-link btn-floating btn-lg text-dark float-start px-4 fw-bolder " target="_blank" href="https://twitter.com/bem_its" role="button" data-mdb-ripple-color="dark"><i style="color: #fcfae6;" class="fab fa-twitter"></i></a>

                        <!-- Yt -->
                        <a class="btn btn-link btn-floating btn-lg text-dark float-start px-4 fw-bolder " target="_blank" href="https://www.youtube.com/c/BEMITS" role="button" data-mdb-ripple-color="dark"><i style="color: #fcfae6;" class="fab fa-youtube-square"></i></a>

                        <!-- Instagram -->
                        <a class="btn btn-link btn-floating btn-lg text-dark float-start px-4 fw-bolder " target="_blank" href="https://www.instagram.com/bem_its/" role="button" data-mdb-ripple-color="dark"><i style="color: #fcfae6;" class="fab fa-instagram"></i></a>

                        <!-- Linkedin -->
                        <a class="btn btn-link btn-floating btn-lg text-dark float-start px-4 fw-bolder " target="_blank" href="https://www.linkedin.com/company/bem-its" role="button" data-mdb-ripple-color="dark"><i style="color: #fcfae6;" class="fab fa-linkedin"></i></a>
                    </div>
                    <!-- Line -->

                    <!-- Section: Social media -->
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Copyright -->
    <div class="col alignt-self-center text-center text-dark p-3 warnabgnav">
        <div class="col">
            <img class="img-fluid" src="<?= base_url(); ?>assets/img/footerMerkITS.png" alt="">
        </div>
        <div class="col fontnavbar">
            ©2021-From Medsi for KM ITS
        </div>
    </div>
    <!-- Copyright -->

    <a class="float-button" target="_blank" href="<?= base_url();?>home/aspirasikmits">
        <i class="fas fa-bullhorn" aria-hidden="true"></i>
        <span>Aspirasi KM ITS<span>
    </a>

    <div class="position-relative d-none d-lg-block" style="margin-right: -15px;">
        <div class="position-absolute bottom-0 end-0">
            <img src="<?= base_url(); ?>assets/img/ornament/img/ornamenbawahkananfooter.png" class="img-fluid " alt="...">
        </div>
    </div>
</footer>
	
	<!-- script -->
	<script src="<?=content_url('plugins/popper/popper.js');?>"></script>
	<script src="<?=content_url('plugins/bootstrap/js/bootstrap.min.js');?>"></script>
	<script src="<?=content_url('plugins/sticky/jquery.sticky.js');?>"></script>
	<script src="<?=content_url('plugins/prism/prism.js');?>"></script>
	<script src="<?=content_url('plugins/photoswipe/photoswipe.min.js');?>"></script>
	<script src="<?=content_url('plugins/photoswipe/photoswipe-ui-default.min.js');?>"></script>
	<?php if (get_setting('recaptcha')=="Y"): ?>
	<script src='https://www.google.com/recaptcha/api.js'></script>
	<?php endif ?>
	<script src="<?=$this->CI->theme_asset('js/javascript.js');?>"></script>
</body>
</html>