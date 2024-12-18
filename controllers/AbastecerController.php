<?Php
require_once 'models/proveedor.php';
require_once 'models/producto.php';
require_once 'models/abastecer.php';

class abastecerController{
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

        $total = $producto->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/abastecer/gestionab.php';
    }

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
        $provee = $proveedor->getAllp();

        require_once 'views/abastecer/eligeprove.php';
    }

    public function filtroprovee(){
        if(isset($_POST)){
            $numruc = isset($_POST['ruc']) ? $_POST['ruc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;

            $proveedor = new Proveedor();
            $proveedor->setNumruc($numruc);
            $proveedor->setNombrecom($nombrecom);
            $provee = $proveedor->getFiltro();
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
            $stats = utils::statsAñadir();
            $total = $stats['total'];

            if($tienda && $usuario && $proveedor && $total){
                $abastecer = new Abastecer();
                $abastecer->setId_tienda($tienda);
                $abastecer->setId_Usuario($usuario);
                $abastecer->setId_proveedor($proveedor);
                $abastecer->setSituacion($situacion);
                $abastecer->setDescripcion($descripcion);
                $abastecer->setTotal($total);
                $abastecer->setImporte($importe);
                $resto = $total - $importe;
                $abastecer->setResto($resto);
                //Guardar Cuaderno
                $save = $abastecer->save();

                /*
                var_dump($abastecer);
                die;
                */
                //Guardar Producto_Cuaderno
                $save_pa = $abastecer->save_pa();

                if($save && $save_pa){
                    $_SESSION['abastece'] = "complete";
                }else{
                    $_SESSION['abastece'] = "failed";
                }
                
            }else{
                $_SESSION['abastece'] = "failed";
            }
        }else{
            $_SESSION['abastece'] = "failed";
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
        //sacar los pedidos totales
        $abast = $abastecer->getAllabas();

        $total = $abastecer->getAlltotal();
        }else{
        //Sacar los pedidos del usuario
        $usuario = $_SESSION['identity']->id;
        $abastecer->setId_Usuario($usuario);

        $abast = $abastecer->getAllByUser();
        
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
                    $abast = $abastecer->getfillabas();
                }else{    
                    //Sacar los pedidos del usuario
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
            
            //Sacar Datos del Cuaderno
            $abastecer = new Abastecer();
            $abastecer->setId($id);
            $abs = $abastecer->getOne();

            //Sacar Productos del Cuaderno
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
        
        $abast = $abastecer->getAllByUserA();

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
            $situacion = "CANCELADO";

            if($id_abastecer){
                $abastecer = New Abastecer();
                $abastecer->setId($id_abastecer);
                $abastecer->setSituacion($situacion);
                $importe = $total;
                $abastecer->setImporte($importe);
                $resto = 0.00;
                $abastecer->setResto($resto);
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
                $save = $abastecer->recibir();

                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }


                $producto_abastecer = new Abastecer();
                $prodabs = $producto_abastecer->getProdByabs_suma($id_abastecer);

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