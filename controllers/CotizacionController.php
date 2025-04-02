<?Php
require_once 'models/cliente.php';
require_once 'models/cuaderno.php';
require_once 'models/producto.php';
require_once 'models/ingreso.php';

Class cotizacionController{

    public function registrocoti(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $reg = true;

            $cliente = new Cliente();
            $cliente->setId($id);
            //Muestra un solo registro en base a un id - 5cliente
            $cli = $cliente->getOne();

            require_once 'views/cotizacion/regcotic.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
        }
    }

    public function regcotizacion(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $cliente = isset($_POST['cliente']) ? $_POST['cliente'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;


            if($tienda && $usuario && $cliente && $total){
                //Guardar Cuaderno
                $cuaderno = new Cuaderno();

                //Busca el id del ultimo registro generado de Cotizaciones - 27cuaderno
                $coti = $cuaderno->getidcotiulty();
                $id_cotulty = $coti->id_cot;
                $id_cot = floatval($id_cotulty) + 1;

                $cuaderno->setId_cot($id_cot);
                $cuaderno->setId_tienda($tienda);
                $cuaderno->setId_Usuario($usuario);
                $cuaderno->setId_Cliente($cliente);
                $cuaderno->setTotal($total);

                //Registro de Cotización - 19cuaderno
                $save = $cuaderno->savecotiza();

                //Busca el id del ultimo registro cotización generado - 18cuaderno
                $cua = $cuaderno->getidcuadulty();
                $id_cuaderno = $cua->id;

                //Guardar Producto_Cuaderno
                //Guardar listado de productos de un comprador - 6cuaderno
                $save_pc = $cuaderno->save_pc($id_cuaderno);

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

        echo '<script>window.location="'.base_url.'cotizacion/crealizada"</script>';
        unset($_SESSION['carrito']);

    }

    public function crealizada(){
        if(isset($_SESSION['identity'])){
            $identity = $_SESSION['identity'];
            $cuaderno = new Cuaderno();
            $cuaderno->setId_Usuario($identity->id);
            //Busca en base a un usuario - 40cuaderno
            $cua = $cuaderno->getOneByUsercotiza();
            
            $producto_cuaderno = new Cuaderno();
            //Busca los productos del listado del cuaderno - 3cuaderno
            $prodcua = $producto_cuaderno->getProductosBycuaderno($cua->id);

        }
        require_once 'views/cotizacion/cotizrealizada.php';
    }

    public function regiscotizacion(){
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

        //Busca todos los resultados de cotización - 20cuaderno
        $cuad = $cuaderno->getAllcoti();

        //busca todo los registros de cotización - 22cuaderno
        $total = $cuaderno->getAlltotalcot();
        }else{
        //Sacar los pedidos del usuario
        $usuario = $_SESSION['identity']->id;
        $cuaderno->setId_Usuario($usuario);

        //Busca y saca los pedidos de cotización - 21cuaderno
        $cuad = $cuaderno->getAllByUserC();
        
        //busca todo los registros de cotización - 23cuaderno
        $total = $cuaderno->getAlltotalucot();
        }

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;
        require_once 'views/cotizacion/registroscoti.php';
    }

    public function filtrocoti(){
        $usuario = $_SESSION['identity']->id;

        if(isset($_POST)){
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            $ncot = isset($_POST['ncot']) ? $_POST['ncot'] : false;

            $cuaderno = new Cuaderno();

            if(strlen(trim($fecha)) == 0 && strlen(trim($ncot)) == 0){
                echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';

            }else{

                $cuaderno->setFecha($fecha);
                $cuaderno->setId_cot($ncot);

                if(isset($_SESSION['admin'])){
                    //sacar los pedidos totales
                    //Busca un registro de cotización en base al filtro, busca todos - 24cuaderno
                    $cuad = $cuaderno->getfillcoti();
                }else{    
                    //Sacar los pedidos del usuario
                    //Busca un registro de cotización en base al filtro, busca solo de usuario - 25cuaderno
                    $cuaderno->setId_Usuario($usuario);
                    $cuad = $cuaderno->getfillcotius();
                }

            }
        }
        require_once 'views/cotizacion/registroscoti.php';
    }

    public function detallecoti(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            
            //Sacar Datos del Cuaderno
            //Busca un solo registro a travez de id - 9cuaderno
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOneCoti();

            //Sacar Productos del Cuaderno
            //Busca los productos del listado del cuaderno - 3cuaderno
            $producto_cuaderno = new Cuaderno();
            $prodcua = $producto_cuaderno->getProductosBycuaderno($id);

            require_once 'views/cotizacion/detallecoti.php';
        }else{
            echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';
        }

    }

    public function eliminarcoti(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $cua = $cuaderno->getOne();

            require_once 'views/cotizacion/anularcot.php';
        }else{
            echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';
        }

    }

    public function deletecoti(){
        //Edita para olcutar registro- 10cuaderno
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            $delete = $cuaderno->edit_oculta_coti();
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';
    }

    public function anuladoscoti(){
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
        $cuad = $cuaderno->getAllByUserAcoti();

        //Saca la cantidad total de registros anulados - 12cuaderno
        $total = $cuaderno->getAlltotalAcoti();
        
        $totalPa = ceil($total/$limite);
        $totalPaga = $totalPa;

        require_once 'views/cotizacion/anuladoscoti.php';
    }

    public function editarcoti(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $cuaderno= new Cuaderno();
            $cuaderno->setId_cot($id);
            //Busca la cotización a partir de id_cotización - 33cuaderno
            $cua = $cuaderno->getOneCotiza();

            require_once 'views/cotizacion/editacoti.php';
        }else{
            echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';
        }
    }

    public function editcoti(){
        if(isset($_POST)){
            $id = isset($_POST['id']) ? $_POST['id'] : false;
            $id_cot = isset($_POST['id_cot']) ? $_POST['id'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;

            if($id){
                $cuaderno = new Cuaderno();
                $cuaderno->setId($id);
                //Oculta los productos de cotización - 34cuaderno
                $elimina = $cuaderno->edit_oculta_cotiprod();

                $cuaderno->setTotal($total);
                //Cambia el monto de la Cotización - 35cuaderno
                $etotal = $cuaderno->edit_monto_coti();

                //Guardar listado de productos de un comprador - 6cuaderno
                $save_pc = $cuaderno->save_pc($id);

                if($elimina && $etotal && $save_pc){
                    $_SESSION['pedido'] = "complete";
                }else{
                    $_SESSION['pedido'] = 'failed';
                }
            }else{
                $_SESSION['pedido'] = 'failed';
            }
        }else{
            $_SESSION['pedido'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion"</script>';
        unset($_SESSION['carrito']);
        unset($_SESSION['cotiza']);
    }

    public function nnventa(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $cuaderno= new Cuaderno();
            $cuaderno->setId($id);
            //Busca la cotización a partir de id - 37cuaderno
            $cua = $cuaderno->getOneCotizaid();

            require_once 'views/cotizacion/cotinventa.php';
        }else{
            echo '<script>window.location="'.base_url.'cotizacion/regiscotizacion</script>';
        }
    }

    public function cotianventa(){
        if(isset($_POST)){
            //Datos para registro de Cuaderno
            $id = isset($_POST['id']) ? $_POST['id'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $cero = 00.00;
            //Datos para regstro de Ingreso
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $cliente = isset($_POST['cliente']) ? $_POST['cliente'] : false;
            $tipopago = isset($_POST['tipopago']) ? $_POST['tipopago'] : false;

            
            if($id && $total && $situacion){
                $cuaderno = new Cuaderno();

                //Busca el id del ultimo registro generado de Cuaderno - 36cuaderno
                $cuad = $cuaderno->getidcuadernoulty();
                $id_cuadulty = $cuad->id_cua;
                $id_cuad = floatval($id_cuadulty) + 1;

                $cuaderno->setId_cua($id_cuad);
                if($situacion == "POR COBRAR"){
                    $cuaderno->setImporte($cero);
                    $resto = $total;
                    $cuaderno->setResto($resto);
                    $cuaderno->setSituacion($situacion);
                }elseif($situacion == "A CUENTA" && 0 < $importe && $importe < $total){
                    $cuaderno->setImporte($importe);
                    $resto = $total - $importe;
                    $cuaderno->setResto($resto);
                    $cuaderno->setSituacion($situacion);
                }elseif($situacion == "CANCELADO"){
                    $cuaderno->setImporte($total);
                    $cuaderno->setResto($cero);
                    $cuaderno->setSituacion($situacion);
                }else{
                    //echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
                    echo '<script>window.location="'.base_url.'cotizacion/cotianventa1&id='.$id.'"</script>';
                }
                $cuaderno->setDescripcion($descripcion);

                $cuaderno->setId($id);
                //Guarda la Nota de Venta - 38cuaderno
                $save = $cuaderno->savecotinventa();

                //Guarda en la tabla de Ingreso
                $ingreso = new Ingreso();
                $ingreso->setId_tienda($tienda);
                $ingreso->setId_usuario($usuario);
                $ingreso->setId_cliente($cliente);
                $ingreso->setId_cuaderno($id);
                if($situacion == "POR COBRAR"){
                    $ingreso->setIngresos($cero);
                    $resto = $total;
                    $ingreso->setDeudas($resto);
                }elseif($situacion == "A CUENTA"){
                    $ingreso->setIngresos($importe);
                    $resto = $total - $importe;
                    $ingreso->setDeudas($resto);
                }elseif($situacion == "CANCELADO"){
                    $ingreso->setIngresos($total);
                    $resto = 00.00;
                    $ingreso->setDeudas($resto);
                }
                $ingreso->setTipopago($tipopago);

                date_default_timezone_set('America/Lima');
                $horaturno = (int)date("H");

                if ($horaturno >= 7 && $horaturno < 14) {
                    $turno = "MAÑANA";
                } elseif ($horaturno >= 14 && $horaturno < 18) {
                    $turno = "TARDE";
                } else {
                    $turno = "NOCHE";
                }
                $ingreso->setTurno($turno);
                
                //Guardar Registro de Ingresos - 1Ingreso
                $save_ingreso = $ingreso->save();

                if($save && $save_ingreso){
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
    
}
?>