<?Php
require_once 'models/cliente.php';
require_once 'models/cuaderno.php';
require_once 'models/producto.php';

Class cuadernoController{

    public function index(){
        require_once 'views/prueba.php';
    }

    public function eligcliente(){
        //Saca todos los clientes para el controlador cuaderno - 7cliente
        $cliente = new Cliente();
        $clie = $cliente->getAllc();

        require_once 'views/cuaderno/eligecliec.php';
    }

    public function filtrocliente(){
        if(isset($_POST)){
            $numdoc = isset($_POST['numdoc']) ? $_POST['numdoc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;

            $cliente = new cliente();
            $cliente->setNumdoc($numdoc);
            $cliente->setNombrecom($nombrecom);
            $clie = $cliente->getFiltro();
        }

        require_once 'views/cuaderno/eligecliec.php';
    }

    public function registrocliente(){
        require_once 'views/cuaderno/registracliec.php';
    }

    public function savecliente(){
        if(isset($_POST)){
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $tipodoc = isset($_POST['tipodoc']) ? $_POST['tipodoc'] : false;
            $numdoc = isset($_POST['numdoc']) ? $_POST['numdoc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $numcel = isset($_POST['numcel']) ? $_POST['numcel'] : false;

            if($ciudad && $tipodoc && $numdoc && $nombrecom && $direccion && $numcel){
                $cliente = new Cliente;
                $cliente->setId_ciudad($ciudad);
                $cliente->setId_tipodoc($tipodoc);
                $cliente->setNumdoc($numdoc);
                $cliente->setNombrecom($nombrecom);
                $cliente->setDireccion($direccion);
                $cliente->setNumcel($numcel);

                $save = $cliente->save();

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

        $cliente->setNumdoc($numdoc);
        //Busqueda despues de crear para registro de Cuaderno - 8cliente
        $clien = $cliente->getclienregcuad();
        $cid=$clien->id;

        echo '<script>window.location="'.base_url.'cuaderno/registrocuad&id='.$cid.'"</script>';
    }

    public function registrocuad(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $reg = true;

            $cliente = new Cliente();
            $cliente->setId($id);
            $cli = $cliente->getOne();

            require_once 'views/cuaderno/regcuadc.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
        }
    }

    public function regcuaderno(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $cliente = isset($_POST['cliente']) ? $_POST['cliente'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $cero = 00.00;
            $stats = utils::statsCarrito();
            $total = $stats['total'];

            //Guardar Cuaderno - 1cuaderno
            if($tienda && $usuario && $cliente && $total){
                $cuaderno = new Cuaderno();
                $cuaderno->setId_tienda($tienda);
                $cuaderno->setId_Usuario($usuario);
                $cuaderno->setId_Cliente($cliente);
                $cuaderno->setSituacion($situacion);
                if($situacion == "POR COBRAR"){
                    $cuaderno->setImporte($cero);
                    $resto = $total;
                    $cuaderno->setResto($resto);
                }elseif($situacion == "A CUENTA"){
                    $cuaderno->setImporte($importe);
                    /*
                    if($importe < $total){
                        $cuaderno->setImporte($importe);
                    }else{
                        $cuaderno->setImporte($total);
                    }
                    */
                    $resto = $total - $importe;
                    $cuaderno->setResto($resto);
                }elseif($situacion == "CANCELADO"){
                    $cuaderno->setImporte($total);
                    $resto = 00.00;
                    $cuaderno->setResto($resto);
                }
                $cuaderno->setdescripcion($descripcion);
                $cuaderno->setTotal($total);

                //Guardar Cuaderno
                $save = $cuaderno->save();

                //Guardar Producto_Cuaderno
                //Guardar listado de productos de un comprador - 6cuaderno
                $save_pc = $cuaderno->save_pc();

                if($save && $save_pc){
                    $_SESSION['pedido'] = "complete";
                }else{
                    $_SESSION['pedido'] = "failed";
                }

            }else{
                $_SESSION['pedido'] = "failed";
            }
        }else{
            $_SESSION['pedido'] = "failed";
        }

        echo '<script>window.location="'.base_url.'cuaderno/vrealizada"</script>';
        unset($_SESSION['carrito']);

    }

    public function vrealizada(){
        if(isset($_SESSION['identity'])){
            $identity = $_SESSION['identity'];
            $cuaderno = new Cuaderno();
            $cuaderno->setId_Usuario($identity->id);
            //Busca en base a un usuario - 2cuaderno
            $cua = $cuaderno->getOneByUser();
            
            $producto_cuaderno = new Cuaderno();
            //Busca los productos del listado del cuaderno - 3cuaderno
            $prodcua = $producto_cuaderno->getProductosBycuaderno($cua->id);

        }
        require_once 'views/cuaderno/ventarealizada.php';
    }

    public function registroscuaderno(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        $cuaderno = new Cuaderno();
        $cuaderno->setOffset($offset);
        $cuaderno->setLimite($limite);

        if(isset($_SESSION['admin'])){
        //sacar los pedidos totales

        //Busca todos los resultados de cuaderno - 4cuaderno
        $cuad = $cuaderno->getAllcuad();

        //busca todo los registros - 16cuaderno
        $total = $cuaderno->getAlltotal();
        }else{
        //Sacar los pedidos del usuario
        $usuario = $_SESSION['identity']->id;
        $cuaderno->setId_Usuario($usuario);

        //Busca y saca los pedidos de los usuarios - 5cuaderno
        $cuad = $cuaderno->getAllByUser();
        
        //busca todo los registros de un usuario - 17cuaderno
        $total = $cuaderno->getAlltotalu();
        }

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;
        require_once 'views/cuaderno/registrosc.php';
    }

    public function filtrocuad(){
        $usuario = $_SESSION['identity']->id;

        if(isset($_POST)){
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;

            $cuaderno = new Cuaderno();

            if(strlen(trim($fecha)) == 0){
                echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';

            }else{

                $cuaderno->setFecha($fecha);

                if(isset($_SESSION['admin'])){
                    //sacar los pedidos totales
                    //Busca un registro de cuaderno en base al filtro, busca todos - 7cuaderno
                    $cuad = $cuaderno->getfillcuad();
                }else{    
                    //Sacar los pedidos del usuario
                    //Busca un registro de cuaderno en base al filtro, busca solo de usuario - 8cuaderno
                    $cuaderno->setId_Usuario($usuario);
                    $cuad = $cuaderno->getfillcuadus();
                }

            }
        }
        require_once 'views/cuaderno/registrosc.php';
    }

    public function detalle(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            
            //Sacar Datos del Cuaderno
            //Busca un solo registro a travez de id - 9cuaderno
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOne();

            //Sacar Productos del Cuaderno
            //Busca los productos del listado del cuaderno - 3cuaderno
            $producto_cuaderno = new Cuaderno();
            $prodcua = $producto_cuaderno->getProductosBycuaderno($id);

            require_once 'views/cuaderno/detallec.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/anularc.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function delete(){
        //Edita para olcutar registro- 10cuaderno
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $delete = $cuaderno->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
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
        
        $cuaderno = new Cuaderno();
        $cuaderno->setOffset($offset);
        $cuaderno->setLimite($limite);

        //Busca todos los registros anulados - 11cuaderno
        $cuad = $cuaderno->getAllByUserA();

        //Saca la cantidad total de registros anulados - 12cuaderno
        $total = $cuaderno->getAlltotalA();
        
        $totalPa = ceil($total/$limite);
        $totalPaga = $totalPa;

        require_once 'views/cuaderno/anuladosc.php';
    }

    public function entrega(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $cua = $id;
            /*
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOne();*/

            require_once 'views/cuaderno/entregac.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function salida(){
        if(isset($_POST)){
            $id_cuaderno = isset($_POST['cuaderno']) ? $_POST['cuaderno'] : false;

            if($id_cuaderno){
                //Cambiar el estado a Entregado - 13cuaderno
                $cuaderno = New cuaderno();
                $cuaderno->setId($id_cuaderno);
                $save = $cuaderno->entregar();

                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

                //Busca los datos para restar la cantodad de stock - 14cuaderno
                $producto_cuaderno = new Cuaderno();
                $prodcua = $producto_cuaderno->getProdBycuad_resta($id_cuaderno);

                //Edita y resta la cantidad de productos  - 10producto
                $producto = new producto();
                while($pr = $prodcua->fetch_object()){
                    $producto->setId($pr->id);
                    $cantidadprod = $pr->cantidad;
                    $cantidadcuad = $pr->cantiresta;
                    $resta = $cantidadprod - $cantidadcuad;
                    $producto->setCantidad($resta);
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
        
        echo '<script>window.location="'.base_url.'cuaderno/detalle&id='.$id_cuaderno.'"</script>';
    }

    public function pago(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            //Sacar Datos del Cuaderno
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/pagoc.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function pagocua(){
        if(isset($_POST)){
            $id_cuaderno = isset($_POST['cuaderno']) ? $_POST['cuaderno'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $situacion = "CANCELADO";

            //Cambia el estaddo de la situacion del pago - 15cuaderno
            if($id_cuaderno){
                $cuaderno = New cuaderno();
                $cuaderno->setId($id_cuaderno);
                $cuaderno->setSituacion($situacion);
                $importe = $total;
                $cuaderno->setImporte($importe);
                $resto = 0.00;
                $cuaderno->setResto($resto);
                $save = $cuaderno->pagar();

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
        
        echo '<script>window.location="'.base_url.'cuaderno/detalle&id='.$id_cuaderno.'"</script>';
    }

}


?>