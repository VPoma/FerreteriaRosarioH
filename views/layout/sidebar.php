<!-- BARRA LATERAL -->
<div id="content">
    <aside id="lateral">

        <div class="block_aside">

            <!--Prueba de Imagen-->

            <?Php if(!isset($_SESSION['identity'])): ?>
                <h3>Ferretería Rosario Huancan</h3>
                <div>
                    <a href="<?=base_url?>"><img style="height: 500px; width: 300px; border: 1px solid rgb(191, 39, 39);" src="<?=base_url?>assets/images/Lateral2.jpg"/></a>
                </div>
            <?Php else: ?>
                <h3><?=$_SESSION['identity']->nombre?> <?=$_SESSION['identity']->apellidos?></h3>

                <?Php if($_SESSION['identity']->imagen != null): ?>
                    <div>
                        <a href="<?=base_url?>usuario/logini"><img style="height: 100px; width: 100px; margin-left: 30%; border-radius: 40%;" src="<?=base_url?>uploads/images/<?=$_SESSION['identity']->imagen?>"/></a>
                    </div>

                    <br>
                    <div class="enlaces">
                        <li><a class="separa" href="<?=base_url?>usuario/logout">Cerrar Sesión</a></li>
                    </div>
                <?Php else: ?>
                    <div>
                        <a href="<?=base_url?>usuario/logini"><img style="height: 100px; width: 100px; margin-left: 30%;" src="<?=base_url?>assets/images/fotop.png"/></a>
                    </div>
                    <br>
                    <div class="enlaces">
                        <li><a class="separa" href="<?=base_url?>usuario/logout">Cerrar Sesión</a></li>
                    </div>
                <?Php endif; ?>

            <?Php endif; ?>
                    <br>
    <!--Logica para menu por -->
            <?Php if(isset($_GET['controller'])): ?>
                <?Php $nombre_controlador = $_GET['controller'].'controller'; ?>
                <h3>Carrito de Compras</h3>
                <?php $stats = Utils::statsCarrito();?>
                <li><a class="button separa" href="<?=base_url?>carrito/index">Ver Carrito (<?=$stats['count']?>)</a></li>

                    <!--Paneles Superiores-->

                    <?Php if($nombre_controlador == "productocontroller"): ?>
                        

                        <?Php if(isset($_SESSION['identity'])): ?>
                            <h3>Opciones de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>producto/index">Listado de Productos</a></li>

                            <br>
                        <?Php endif;?>
                            
                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>producto/gestion">Gestión de Productos (CANTIDAD)</a></li>
                            <li><a class="button separa" href="<?=base_url?>producto/registro">Registrar Producto</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "cuadernocontroller"): ?>
                        <h3>Panel Cuaderno</h3>
                        <li><a class="button separa" href="<?=base_url?>cuaderno/registroscuaderno">Registros de Venta</a></li>
                        <?Php if(isset($_SESSION['admin'])): ?>
                        <li><a class="button separa" href="<?=base_url?>cuaderno/anulados">Registros Anulados</a></li>
                        <?Php endif;?>
                        
                    <?Php elseif( $nombre_controlador == "clientecontroller"): ?>
                        <h3>Panel Cliente</h3>
                        <li><a class="button separa" href="<?=base_url?>cliente/registro">Registrar Cliente</a></li>
                        <li><a class="button separa" href="<?=base_url?>cliente/gestion">Gestión de Clientes</a></li>
                        <?Php if(isset($_SESSION['admin'])): ?>
                        <li><a class="button separa" href="<?=base_url?>tipodoc/gestion">Gestión Tipo de Documento</a></li>
                        <?Php endif;?>
                        
                    <?Php elseif( $nombre_controlador == "tipodoccontroller"): ?>
                        <h3>Panel Cliente</h3>
                        <li><a class="button separa" href="<?=base_url?>cliente/registro">Registrar Cliente</a></li>
                        <li><a class="button separa" href="<?=base_url?>cliente/gestion">Gestión de Clientes</a></li>
                        <li><a class="button separa" href="<?=base_url?>tipodoc/gestion">Gestión Tipo de Documento</a></li>

                    <?Php elseif( $nombre_controlador == "proveedorcontroller"): ?>
                        <h3>Panel Proveedor</h3>
                        <li><a class="button separa" href="<?=base_url?>proveedor/registro">Registrar Proveedor</a></li>
                        <li><a class="button separa" href="<?=base_url?>proveedor/gestion">Gestión de Proveedores</a></li>

                    <?Php elseif( $nombre_controlador == "usuariocontroller"):?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Usuario</h3>

                            <li><a class="button separa" href="<?=base_url?>usuario/registro">Registrar Usuario</a></li>
                            <li><a class="button separa" href="<?=base_url?>usuario/gestion">Gestión de Usuarios</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "abastecercontroller"):?>
                        <h3>Listado Abastecimiento</h3>
                        <?php $stats = Utils::statsAñadir();?>
                        <li><a class="button separa" href="<?=base_url?>añadir/index">Ver abastecimiento (<?=$stats['count']?>)</a></li>

                        <h3>Panel Abastecer</h3>
                        <li><a class="button separa" href="<?=base_url?>abastecer/index">Listado de Abastecimiento</a></li>
                        <li><a class="button separa" href="<?=base_url?>abastecer/registrosabastecer">Registros de Abastecimiento</a></li>
                        <?Php if(isset($_SESSION['admin'])): ?>
                        <li><a class="button separa" href="<?=base_url?>abastecer/anulados">Registros Anulados</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "carritocontroller"): ?>

                    <?Php elseif( $nombre_controlador == "añadircontroller"): ?>
                        <h3>Listado Abastecimiento</h3>
                        <?php $stats = Utils::statsAñadir();?>
                        <li><a class="button separa" href="<?=base_url?>añadir/index">Ver Listado (<?=$stats['count']?>)</a></li>

                    <!--Paneles Inferiores-->

                    <?Php elseif( $nombre_controlador == "ciudadcontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Ciudad</h3>

                            <li><a class="button separa" href="<?=base_url?>ciudad/registro">Registrar ciudad</a></li>
                            <li><a class="button separa" href="<?=base_url?>ciudad/gestion">Gestión de ciudad</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "tiendacontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Tienda</h3>

                            <li><a class="button separa" href="<?=base_url?>tienda/registro">Registrar Tienda</a></li>
                            <li><a class="button separa" href="<?=base_url?>tienda/gestion">Gestión de Tiendas</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "familiacontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Familia de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>familia/registro">Registrar Familia de Producto</a></li>
                            <li><a class="button separa" href="<?=base_url?>familia/gestion">Gestión de Familia de Producto</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "lineacontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Linea de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>linea/registro">Registrar Linea de Producto</a></li>
                            <li><a class="button separa" href="<?=base_url?>linea/gestion">Gestión de Linea de Producto</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "marcacontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Marca de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>marca/registro">Registrar Marca de Producto</a></li>
                            <li><a class="button separa" href="<?=base_url?>marca/gestion">Gestión de Marca de Producto</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "preciocontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Precio de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>precio/tabla">Tabla de Precios</a></li>
                            <li><a class="button separa" href="<?=base_url?>precio/registro">Actualizar Precio Fierro</a></li>
                            <li><a class="button separa" href="<?=base_url?>precio/gestion">Gestión de Precio Fierro</a></li>
                            <li><a class="button separa" href="<?=base_url?>descuento/gestion">Gestión Descuento</a></li
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "descuentocontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Descuento de Producto</h3>

                            <li><a class="button separa" href="<?=base_url?>precio/tabla">Tabla de Precios</a></li>
                            <li><a class="button separa" href="<?=base_url?>precio/registro">Actualizar Precio Fierro</a></li>
                            <li><a class="button separa" href="<?=base_url?>precio/gestion">Gestión de Precio Fierro</a></li>
                            <li><a class="button separa" href="<?=base_url?>descuento/gestion">Gestión Descuento</a></li
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "egresocontroller"): ?>

                            <h3>Panel Egresos</h3>

                            <li><a class="button separa" href="<?=base_url?>egreso/registro">Registrar Egreso de Caja Chica</a></li>
                            <li><a class="button separa" href="<?=base_url?>egreso/gestion">Gestión Egresos de Caja Chica</a></li>

                    <?Php elseif( $nombre_controlador == "ingresocontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Ingresos</h3>

                            <li><a class="button separa" href="<?=base_url?>ingreso/gestion">Gestión Ingresos de Caja Chica</a></li>
                        <?Php endif;?>

                    <?Php elseif( $nombre_controlador == "arqueocontroller"): ?>

                        <?Php if(isset($_SESSION['admin'])): ?>
                            <h3>Panel Arqueo</h3>

                            <li><a class="button separa" href="<?=base_url?>arqueo/index">Generar Arqueo de Caja Chica</a></li>
                        <?Php endif;?>
                        
                    <?Php else: ?>
                        <h1>Seguimos probando</h1>
                    <?Php endif;?>
            <?Php else: ?>
                <?Php show_error(); ?>
            <?Php endif;?>

        </div>

    </aside>
    <!-- CONTENIDO CENTRAL -->
    <div id="central">