<?Php
require_once 'models/proveedor.php';
require_once 'models/producto.php';
require_once 'models/abastecer.php';

class abastecerController{
    //Muestra todos los productos para ABASTECER - 8producto
    public function index(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        $producto = new Producto;
        $producto->setOffset($offset);
        $producto->setLimite($limite);

        $prod = $producto->getAllab();
        
        //Saca la cantidad de lineas - 0
        $total = $producto->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/abastecer/gestionab.php';
    }

    //Muestra todos los productos para ABASTECER FILTRADO  - 9producto
    public function filtroindex(){
        if(isset($_POST)){
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            $producto = new producto();

            if(strlen(trim($linea)) == 0 && strlen(trim($marca)) == 0 && strlen(trim($nombre)) == 0){
                
                echo '<script>window.location="'.base_url.'abastecer/index"</script>';

            }else{

            $producto->setLinea($linea); 
            $producto->setMarca($marca);
            $producto->setNombre($nombre);

            $prod = $producto->getFillab();

            }

        }

        require_once  'views/abastecer/gestionab.php';
    }

    public function eligprovee(){
        $proveedor = new Proveedor();
        //Busca y muestra a todos los proveedores - 8proveedor
        $provee = $proveedor->getAllp();

        require_once 'views/abastecer/eligeprove.php';
    }

    public function filtroprovee(){
        if(isset($_POST)){
            $numruc = isset($_POST['ruc']) ? $_POST['ruc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;

            $proveedor = new Proveedor();

            if(strlen(trim($numruc)) == 0 && strlen(trim($nombrecom)) == 0){
                echo '<script>window.location="'.base_url.'abastecer/eligprovee"</script>';
            }else{

                $proveedor->setNumruc($numruc);
                $proveedor->setNombrecom($nombrecom);
                $provee = $proveedor->getFiltro();
            }
        }

        require_once 'views/abastecer/eligeprove.php';
    }

    public function registroprovee(){
        require_once 'views/abastecer/registraprovee.php';
    }

    public function saveprovee(){
        if(isset($_POST)){
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $ruc = isset($_POST['ruc']) ? $_POST['ruc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $numcel = isset($_POST['numcel']) ? $_POST['numcel'] : false;

            if($ciudad && $ruc && $nombrecom && $direccion && $numcel){
                $proveedor = new Proveedor;
                $proveedor->setId_ciudad($ciudad);
                $proveedor->setNumruc($ruc);
                $proveedor->setNombrecom($nombrecom);
                $proveedor->setDireccion($direccion);
                $proveedor->setNumcel($numcel);

                $save = $proveedor->save();

                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

            }else{
                $_SESSION['register'] = "failed";
            }
        }else{
            $_SESSION['register'] = "failed";
        }

        $proveedor->setNumruc($ruc);
        //Busqueda despues de crear para registro de abastecimiento - 9proveedor
        $prove = $proveedor->getprovregabs();
        $prv=$prove->id;

        echo '<script>window.location="'.base_url.'abastecer/registroabs&id='.$prv.'"</script>';
    }

    public function registroabs(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $reg = true;

            $proveedor = new Proveedor;
            $proveedor->setId($id);
            $prv = $proveedor->getOne();

            require_once 'views/abastecer/regabast.php';
        }else{
            echo '<script>window.location="'.base_url.'abastecer/eligprovee"</script>';
        }
    }

    public function regabastecer(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $proveedor = isset($_POST['proveedor']) ? $_POST['proveedor'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $cero = 00.00;
            $stats = utils::statsAñadir();
            $total = $stats['total'];

            if($tienda && $usuario && $proveedor){
                $abastecer = new Abastecer();
                $abastecer->setId_tienda($tienda);
                $abastecer->setId_Usuario($usuario);
                $abastecer->setId_proveedor($proveedor);
                if($situacion == "POR COBRAR"){
                    $abastecer->setImporte($cero);
                    $resto = $total;
                    $abastecer->setResto($resto);
                    $abastecer->setSituacion($situacion);
                }elseif($situacion == "A CUENTA" && 0 < $importe && $importe < $total){
                    $abastecer->setImporte($importe);
                    $resto = $total - $importe;
                    $abastecer->setResto($resto);
                    $abastecer->setSituacion($situacion);
                }elseif($situacion == "CANCELADO"){
                    $abastecer->setImporte($total);
                    $abastecer->setResto($cero);
                    $abastecer->setSituacion($situacion);
                }else{
                    //echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
                    echo '<script>window.location="'.base_url.'cuaderno/registroabs&id='.$proveedor.'"</script>';
                }
                $abastecer->setDescripcion($descripcion);
                $abastecer->setTotal($total);
                //Guardar Registro de Abastecimiento - 1abastece
                $save = $abastecer->save();

                //Guardar listado de Abastecimiento de un proveedor - 2abastece
                $save_pa = $abastecer->save_pa();

                if($save && $save_pa){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }
                
            }else{
                $_SESSION['register'] = "failed";
            }
        }else{
            $_SESSION['register'] = "failed";
        }

        echo '<script>window.location="'.base_url.'abastecer/registrosabastecer"</script>';
        unset($_SESSION['añadir']);

    }

    public function registrosabastecer(){

        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        $abastecer = new Abastecer();
        $abastecer->setOffset($offset);
        $abastecer->setLimite($limite);

        if(isset($_SESSION['admin'])){
        //Muestra todos los registros de abastecimiento - 3abastece
        $abast = $abastecer->getAllabas();

        //Muestra el total de registros de abastecer - 4abastece
        $total = $abastecer->getAlltotal();
        }else{
        //Sacar los pedidos del usuario
        $usuario = $_SESSION['identity']->id;
        $abastecer->setId_Usuario($usuario);
        
        //Muestra el total de registros segun usuario - 5abastece
        $abast = $abastecer->getAllByUser();
        
        //Muestra el total de registros de abastecer segun usuario  - 6abastece
        $total = $abastecer->getAlltotalu();
        }

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;
        require_once 'views/abastecer/registrosa.php';
    }

    public function filtroabas(){
        $usuario = $_SESSION['identity']->id;

        if(isset($_POST)){
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;

            $abastecer = new Abastecer();

            if(strlen(trim($fecha)) == 0){
                echo '<script>window.location="'.base_url.'abastecer/registrosabastecer"</script>';

            }else{

                $abastecer->setFecha($fecha);

                if(isset($_SESSION['admin'])){
                    //sacar los pedidos totales
                    //Filtra la busqueda de abastecimiento - 9abastecer
                    $abast = $abastecer->getfillabas();
                }else{    
                    //Sacar los pedidos del usuario
                    //Filtra la busqueda de abastecimiento por usuario - 10abastecer
                    $abastecer->setId_Usuario($usuario);
                    $abast = $abastecer->getfillabasus();
                }

            }
        }
        require_once 'views/abastecer/registrosa.php';
    }

    public function detalle(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            
            $abastecer = new Abastecer();
            $abastecer->setId($id);
            //Saca datos del registro de cuaderno en base a un id - 11abastecer
            $abs = $abastecer->getOne();

            //Sacar Productos del Cuaderno - 12abastecer
            $producto_abastecer= new Abastecer();
            $prodabs = $producto_abastecer->getProductosByabastecer($id);

            require_once 'views/abastecer/detallea.php';
        }else{
            echo '<script>window.location="'.base_url.'abastecer/registrosabastecer"</script>';
        }

    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $abastecer = new Abastecer();
            $abastecer->setId($id);
            $abs = $abastecer->getOne();

            require_once 'views/abastecer/anulara.php';
        }else{
            echo '<script>window.location="'.base_url.'abastecer/registrosabastecer"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $abastecer = new Abastecer();
            $abastecer->setId($id);
            //Edita para olcutar registro - 13abastecer
            $delete = $abastecer->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'abastecer/registrosabastecer"</script>';
    }

    public function anulados(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;
        
        $abastecer = new Abastecer();
        $abastecer->setOffset($offset);
        $abastecer->setLimite($limite);
        
        //Muestra el total de registros anulados segun usuario - 7abastece
        $abast = $abastecer->getAllByUserA();

        //Muestra el total de registros de abastecer anulados segun usuario  - 8abastece
        $total = $abastecer->getAlltotalA();
        
        $totalPa = ceil($total/$limite);
        $totalPaga = $totalPa;

        require_once 'views/abastecer/anuladosa.php';
    }

    public function pago(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            //Sacar Datos del Cuaderno
            $abastecer = new Abastecer();
            $abastecer->setId($id);
            $abs = $abastecer->getOne();

            require_once 'views/abastecer/pagoa.php';
        }else{
            echo '<script>window.location="'.base_url.'abastecer/registrosabastece"</script>';
        }

    }

    public function pagocua(){
        if(isset($_POST)){
            $id_abastecer = isset($_POST['abastecer']) ? $_POST['abastecer'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $importe_c = isset($_POST['importe_c']) ? $_POST['importe_c'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $cero = 00.00;

            if($id_abastecer){
                $abastecer = New Abastecer();
                $abastecer->setId($id_abastecer);
                if($situacion == "A CUENTA" && 0 < $importe && $importe <= $total){
                    $importe_a = $importe_c + $importe;
                    if($importe_a < $total){
                        $abastecer->setImporte($importe_a);
                        $resto = $total - ($importe + $importe_c);
                        $abastecer->setResto($resto);
                        $abastecer->setSituacion($situacion);
                    }elseif($importe_a == $total){
                        $abastecer->setImporte($total);
                        $abastecer->setResto($cero);
                        $abastecer->setSituacion("CANCELADO");
                    }
                    else{
                        echo '<script>window.location="'.base_url.'abastecer/pago&id='.$id_abastecer.'"</script>';
                    }
                }elseif($situacion == "CANCELADO"){
                    $abastecer->setImporte($total);
                    $abastecer->setResto($cero);
                    $abastecer->setSituacion($situacion);
                }else{
                    echo '<script>window.location="'.base_url.'abastecer/pago&id='.$id_abastecer.'"</script>';
                }
                //Cambia la situacion del pago por abastecer - 14abastecer
                $save = $abastecer->pagar();

                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

            }else{
                $_SESSION['register'] = "failed";
            }
            
        }else{
            $_SESSION['register'] = "failed";
        }
        
        echo '<script>window.location="'.base_url.'abastecer/detalle&id='.$id_abastecer.'"</script>';
    }

    public function entrega(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $abs = $id;

            require_once 'views/abastecer/recibea.php';
        }else{
            echo '<script>window.location="'.base_url.'abastecer/registrosabastece"</script>';
        }

    }

    public function ingreso(){
        if(isset($_POST)){
            $id_abastecer = isset($_POST['abastecer']) ? $_POST['abastecer'] : false;

            if($id_abastecer){
                $abastecer = New Abastecer();
                $abastecer->setId($id_abastecer);
                //cambia el estado de ingreso de productos abastecer - 15abastecer
                $save = $abastecer->recibir();

                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

                //Recibe cantidad de productos a stock - 16abastecer
                $producto_abastecer = new Abastecer();
                $prodabs = $producto_abastecer->getProdByabs_suma($id_abastecer);

                //Edita y resta la cantidad de productos  - 10
                $producto = new producto();
                while($pr = $prodabs->fetch_object()){
                    $producto->setId($pr->id);
                    $cantidadprod = $pr->cantidad;
                    $cantidadabas = $pr->cantisuma;
                    $suma = $cantidadprod + $cantidadabas;
                    $producto->setCantidad($suma);
                    $update = $producto->salida();
                }

                if($update){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }
            }else{
                $_SESSION['register'] = "failed";
            }
            
        }else{
            $_SESSION['register'] = "failed";
        }
        
        echo '<script>window.location="'.base_url.'abastecer/detalle&id='.$id_abastecer.'"</script>';
    }

}


?>