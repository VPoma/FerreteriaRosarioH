        <!-- footer -->
        </div>
    </div>
        <footer>
            <div id="contact" class="footer">
                <div class="container">
                    <div class="row pdn-top-30">
                        <div class="col-md-12 ">
                            <div class="footer-box">
                                <div class="headinga">
                                    <h3>Ubicanos</h3>
                                    <span>Avenida Panamericana 123 - Huancan</span>
                                    <p>+51 987654321 | +51 912345678
                                        <br>Rosario@gmail.com</p>
                                </div>
                                <ul class="location_icon">
                                    <li> <a href="https://web.facebook.com/profile.php?id=61555824634201" target="_blank"><i class="fa fa-facebook-f"></i></a></li>
                                    <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li> <a href="#"><i class="fa fa-instagram"></i></a></li>

                                </ul>
                                <div class="menu-bottom">
                                    <ul class="link">
                                        <li> <a href="#">Inicio</a></li>
                                        <li> <a href="#rosario">ROSARIO</a></li>
                                        <li> <a href="#productos">PRODUCTOS</a></li>
                                        <li> <a href="#tiendas">TIENDAS</a></li>
                                        <li> <a href="#nosotros">NOSOTROS</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <div class="container">
                        <p>© 2024 Todos los derechos Reservados. Desarrollado Por <a href="https://html.design/">-Poma Corporation-</a></p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end footer -->
        <!-- Javascript files-->
        <script src="<?=base_url?>assets/js/jquery.min.js"></script>
        <script src="<?=base_url?>assets/js/popper.min.js"></script>
        <script src="<?=base_url?>assets/js/bootstrap.bundle.min.js"></script>
        <script src="<?=base_url?>assets/js/jquery-3.0.0.min.js"></script>
        <script src="<?=base_url?>assets/js/plugin.js"></script>
        <!-- sidebar -->
        <script src="<?=base_url?>assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="<?=base_url?>assets/js/custom.js"></script>
        <!-- javascript -->
        <script src="<?=base_url?>assets/js/owl.carousel.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
        <script src="<?=base_url?>assets/js/scripts.js"></script>
        <script>
            $(document).ready(function() {
                $(".fancybox").fancybox({
                    openEffect: "none",
                    closeEffect: "none"
                });

                $(".zoom").hover(function() {

                    $(this).addClass('transition');
                }, function() {

                    $(this).removeClass('transition');
                });
            });
        </script>
    </body>

</html>