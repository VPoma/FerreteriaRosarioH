<!DOCTYPE html>
<html lang="en">

<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Rosario</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="<?=base_url?>assets/css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="<?=base_url?>assets/css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="<?=base_url?>assets/css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="<?=base_url?>assets/images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="<?=base_url?>assets/css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- owl stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?=base_url?>assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<?=base_url?>assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <!--CDN JQUERY-->
    <script
        src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
    
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!-- body -->

<body class="main-layout ">
    <!-- loader  -->
<!--
    <div class="loader_bg">
        <div class="loader"><img src="<?=base_url?>assets/images/loading.gif" alt="#" /></div>
    </div>
-->
    <!-- end loader -->
    <!-- header -->
    <header>
        <!-- header inner -->
        <div class="header">

            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                        <div class="full">
                            <div class="center-desk">
                                <div class="logo">
                                    <a href="<?=base_url?>"><img src="<?=base_url?>assets/images/logo.png" alt="#" style="border-radius: 25px; margin-left: -15px; margin-top: -12px;"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                        <div class="menu-area">
                            <div class="limit-box">
                                <nav class="main-menu">
                                    <!--<ul class="menu-area-main">-->

                                    <?Php if (isset($_SESSION['admin'])): ?>
                                        <ul class="menu-area-main">
                                            <li class="active" style="width: 68px;"><a href="<?=base_url?>">INICIO</a> </li>
                                            <li style="width: 120px;"><a href="<?=base_url?>producto/index">PRODUCTOS</a></li>
                                            <li style="width: 76px;"><a href="<?=base_url?>precio/tabla">PRECIO</a></li>
                                            <li style="width: 108px;"><a href="<?=base_url?>cuaderno/registroscuaderno">CUADERNO</a></li>
                                            <li style="width: 90px;"><a href="<?=base_url?>cliente/gestion">CLIENTES</a> </li>
                                            <li style="width: 110px;"><a href="<?=base_url?>abastecer/index">ABASTECER</a> </li>
                                            <li style="width: 115px;"><a href="<?=base_url?>proveedor/gestion">PROVEEDOR</a> </li>
                                            <li><a href="<?=base_url?>usuario/logini"><?=$_SESSION['identity']->usuariof?></a> </li>
                                        </ul>
                                        <ul style="margin-left: -150px;" class="menu-area-main">
                                            <li style="width: 70px;"><a href="<?=base_url?>ciudad/gestion">CIUDAD</a></li>
                                            <li style="width: 70px;"><a href="<?=base_url?>tienda/gestion">TIENDA</a></li>
                                            <li style="width: 75px;"><a href="<?=base_url?>familia/gestion">FAMILIA</a> </li>
                                            <li style="width: 55px;"><a href="<?=base_url?>linea/gestion">LINEA</a> </li>
                                            <li style="width: 70px;"><a href="<?=base_url?>marca/gestion">MARCA</a> </li>
                                            <li style="width: 80px;"><a href="<?=base_url?>usuario/gestion">USUARIO</a></li>
                                            <li style="width: 90px;"><a href="<?=base_url?>egreso/registro">EGRESOS</a></li>
                                            <li style="width: 90px;"><a href="<?=base_url?>usuario/gestion">BUSUARIO</a></li>
                                        </ul>
                                    <?Php elseif (isset($_SESSION['identity'])): ?>
                                        <ul class="menu-area-main">
                                            <li class="active"><a href="<?=base_url?>">INICIO</a> </li>
                                            <li><a href="<?=base_url?>producto/index">PRODUCTOS</a></li>
                                            <li><a href="<?=base_url?>precio/tabla">PRECIO</a></li>
                                            <li><a href="<?=base_url?>cuaderno/registroscuaderno">CUADERNO</a></li>
                                            <li><a href="<?=base_url?>cliente/gestion">CLIENTES</a> </li>
                                            <li><a href="<?=base_url?>usuario/logini"><?=$_SESSION['identity']->usuariof?></a> </li>
                                        </ul>
                                    <?Php else: ?>
                                        <ul class="menu-area-main">
                                            <li class="active"><a href="<?=base_url?>">INICIO</a> </li>
                                            <li><a href="<?=base_url?>#rosario">ROSARIO</a></li>
                                            <li><a href="<?=base_url?>#productos">PRODUCTOS</a></li>
                                            <li><a href="<?=base_url?>#tiendas">TIENDAS</a> </li>
                                            <li><a href="<?=base_url?>#nosotros">NOSOTROS</a></li>
                                            <li><a href="<?=base_url?>usuario/logini">LOGIN</a> </li>
                                        </ul>
                                    <?Php endif; ?>

                                    <!--</ul>-->
                                </nav>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- end header inner -->
    </header>
    <!-- end header -->