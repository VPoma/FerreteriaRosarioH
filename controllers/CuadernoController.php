<?Php
require_once 'models/cliente.php';
require_once 'models/cuaderno.php';
require_once 'models/producto.php';
require_once 'models/ingreso.php';
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
            //Filtro de registros - 4cliente
            $cliente = new cliente();

            if(strlen(trim($numdoc)) == 0 && strlen(trim($nombrecom)) == 0){
                echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
            }else{

                $cliente->setNumdoc($numdoc);
                $cliente->setNombrecom($nombrecom);
                $clie = $cliente->getFiltro();
            }
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

        echo '<script>window.location="'.base_url.'cuaderno/eligecotcuad&id='.$cid.'"</script>';
    }

    public function eligecotcuad(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $elig = true;

            $id_cli = $id;

            require_once 'views/cuaderno/coticuad.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/eligcliente"</script>';
        }
    }

    public function registrocuad(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $reg = true;

            $cliente = new Cliente();
            $cliente->setId($id);
            //Muestra un solo registro en base a un id - 5cliente
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
            $tipopago = isset($_POST['tipopago']) ? $_POST['tipopago'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $cero = 00.00;

            if($tienda && $usuario && $cliente){
                //Guardar Cuaderno
                $cuaderno = new Cuaderno();

                //Busca el id del ultimo registro generado de Cuaderno - 36cuaderno
                $cuad = $cuaderno->getidcuadernoulty();
                $id_cuadulty = $cuad->id_cua;
                $id_cuad = floatval($id_cuadulty) + 1;

                $cuaderno->setId_cua($id_cuad);
                $cuaderno->setId_tienda($tienda);
                $cuaderno->setId_Usuario($usuario);
                $cuaderno->setId_Cliente($cliente);
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
                    echo '<script>window.location="'.base_url.'cuaderno/registrocuad&id='.$cliente.'"</script>';
                }
                $cuaderno->setdescripcion($descripcion);
                $cuaderno->setTotal($total);

                //Guardar Cuaderno - 1cuaderno
                $save = $cuaderno->save();

                //Busca el id del ultimo registro generado - 18cuaderno
                $cua = $cuaderno->getidcuadulty();
                $id_cuaderno = $cua->id;

                //Guardar Producto_Cuaderno
                //Guardar listado de productos de un comprador - 6cuaderno
                $save_pc = $cuaderno->save_pc($id_cuaderno);

                //Guarda en la tabla de Ingreso
                $ingreso = new Ingreso();
                $ingreso->setId_tienda($tienda);
                $ingreso->setId_usuario($usuario);
                $ingreso->setId_cliente($cliente);
                $ingreso->setId_cuaderno($id_cuaderno);
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

                if($save && $save_pc && $save_ingreso){
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
            $ncuad = isset($_POST['ncuad']) ? $_POST['ncuad'] : false;

            $cuaderno = new Cuaderno();

            if(strlen(trim($fecha)) == 0 && strlen(trim($ncuad)) == 0){
                echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';

            }else{

                $cuaderno->setFecha($fecha);
                $cuaderno->setId_cua($ncuad);

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
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/anularc.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function delete(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            if($cua->estado == "ENTREGADO AZAPAMPA"){

                $cuaderno = new Cuaderno();
                $cuaderno->setId($id);
                //Edita para olcutar registro - 10cuaderno
                $delete = $cuaderno->edit_oculta(); 

                $ingreso = new Ingreso();
                $ingreso->setId_cuaderno($id);
                //Editar A fin de Ocultar Ingreso Cuaderno - 16Ingreso
                $delete_ingreso = $ingreso->edit_oculta_ci();

                //Busca los datos para sumar la cantidad de stock - 14cuaderno
                $producto_cuaderno = new Cuaderno();
                $prodcua = $producto_cuaderno->getProdBycuad_resta($id);

                //Edita y suma la cantidad de productos  - 10producto
                $producto = new producto();
                while($pr = $prodcua->fetch_object()){
                    $producto->setId($pr->id);
                    $cantidadprod = $pr->cantidad;
                    $cantidadcuad = $pr->cantiresta;
                    $suma = $cantidadprod + $cantidadcuad;
                    $producto->setCantidad($suma);
                    //Edita y resta o suma la cantidad de productos  - 10producto
                    $update = $producto->salida();
                }

                if($delete && $delete_ingreso && $update){
                    $_SESSION['delete'] = 'complete';
                }else{
                    $_SESSION['delete'] = 'failed';
                }

            }else{

                $cuaderno = new Cuaderno();
                $cuaderno->setId($id);
                //Edita para olcutar registro- 10cuaderno
                $delete = $cuaderno->edit_oculta(); 

                $ingreso = new Ingreso();
                $ingreso->setId_cuaderno($id);
                $delete_ingreso = $ingreso->edit_oculta_ci();

                if($delete && $delete_ingreso){
                    $_SESSION['delete'] = 'complete';
                }else{
                    $_SESSION['delete'] = 'failed';
                }
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

            //$cua = $id;
            
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/entregac.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function entregaH(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            //$cua = $id;
            
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/entregaH.php';
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

    public function salidaH(){
        if(isset($_POST)){
            $id_cuaderno = isset($_POST['cuaderno']) ? $_POST['cuaderno'] : false;

            if($id_cuaderno){
                //Cambiar el estado a Entregado - 13cuaderno
                $cuaderno = New cuaderno();
                $cuaderno->setId($id_cuaderno);
                $save = $cuaderno->entregarH();

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

    public function pago(){
        
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            //Sacar Datos del Cuaderno
            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/pagoc.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }

    }

    public function pagocua(){
        if(isset($_POST)){
            $id_cuaderno = isset($_POST['cuaderno']) ? $_POST['cuaderno'] : false;
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $cliente = isset($_POST['cliente']) ? $_POST['cliente'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $importe_c = isset($_POST['importe_c']) ? $_POST['importe_c'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $tipopago = isset($_POST['tipopago']) ? $_POST['tipopago'] : false;
            $cero = 00.00;
            
            if($id_cuaderno){
                $cuaderno = New cuaderno();
                $cuaderno->setId($id_cuaderno);
                if($situacion == "A CUENTA" && 0 < $importe && $importe <= $total){
                    $importe_a = $importe_c + $importe;
                    if($importe_a < $total){
                        $cuaderno->setImporte($importe_a);
                        $resto = $total - ($importe + $importe_c);
                        $cuaderno->setResto($resto);
                        $cuaderno->setSituacion($situacion);
                    }elseif($importe_a == $total){
                        $cuaderno->setImporte($total);
                        $cuaderno->setResto($cero);
                        $cuaderno->setSituacion("CANCELADO");
                    }
                    else{
                        echo '<script>window.location="'.base_url.'cuaderno/pago&id='.$id_cuaderno.'"</script>';
                    }
                }elseif($situacion == "CANCELADO"){
                    $cuaderno->setImporte($total);
                    $cuaderno->setResto($cero);
                    $cuaderno->setSituacion($situacion);
                }else{
                    echo '<script>window.location="'.base_url.'cuaderno/pago&id='.$id_cuaderno.'"</script>';
                }
                //Cambia el estaddo de la situacion del pago - 15cuaderno
                $save = $cuaderno->pagar();

                //Guarda en la tabla de Ingreso
                $ingreso = new Ingreso();
                $ingreso->setId_tienda($tienda);
                $ingreso->setId_usuario($usuario);
                $ingreso->setId_cliente($cliente);
                $ingreso->setId_cuaderno($id_cuaderno);
                if($situacion == "A CUENTA" && 0 < $importe && $importe <= $total){
                    $importe_a = $importe_c + $importe;
                    if($importe_a < $total){
                        $ingreso->setIngresos($importe);
                        $resto = $total - ($importe + $importe_c);
                        $ingreso->setDeudas($resto);
                    }elseif($importe_a == $total){
                        $ingreso->setIngresos($importe);
                        $ingreso->setDeudas($cero);
                    }
                }elseif($situacion == "CANCELADO"){
                    $importecancel = $total - $importe_c;
                    $ingreso->setIngresos($importecancel);
                    $ingreso->setDeudas($cero);
                }
                $ingreso->setTipopago($tipopago);

                date_default_timezone_set('America/Lima');
                $horaturno = (int)date("H");

                if ($horaturno >= 7 && $horaturno < 13) {
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

    public function editacua(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $cuaderno = new Cuaderno();
            $cuaderno->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $cua = $cuaderno->getOne();

            require_once 'views/cuaderno/editacua.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }
    }

    public function updatecuaderno(){
        if(isset($_POST)){
            $id_cua = isset($_POST['id_cua']) ? $_POST['id_cua'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $situacion = isset($_POST['situacion']) ? $_POST['situacion'] : false;
            $total = isset($_POST['total']) ? $_POST['total'] : false;
            $importe = isset($_POST['importe']) ? $_POST['importe'] : false;
            $resto = isset($_POST['resto']) ? $_POST['resto'] : false;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            $fecha_sal = isset($_POST['fecha_sal']) ? $_POST['fecha_sal'] : false;

            if(!$fecha_sal){
                $cuaderno = new Cuaderno();
                $cuaderno->setId($id_cua);
                $cuaderno->setId_Usuario($usuario);
                $cuaderno->setdescripcion($descripcion);
                $cuaderno->setSituacion($situacion);
                $cuaderno->setTotal($total);
                $cuaderno->setImporte($importe);
                $cuaderno->setResto($resto);
                $cuaderno->setFecha($fecha);

                //Edita Datos del Cuaderno - 41cuaderno
                $save = $cuaderno->editacua();

                if($save){
                    $_SESSION['edit'] = "complete";
                }else{
                    $_SESSION['edit'] = "failed";
                }

            }elseif($fecha_sal){
                $cuaderno = new Cuaderno();
                $cuaderno->setId($id_cua);
                $cuaderno->setId_Usuario($usuario);
                $cuaderno->setdescripcion($descripcion);
                $cuaderno->setSituacion($situacion);
                $cuaderno->setTotal($total);
                $cuaderno->setImporte($importe);
                $cuaderno->setResto($resto);
                $cuaderno->setFecha($fecha);
                $cuaderno->setFecha_sal($fecha_sal);

                //Edita Datos del Cuaderno con fecha salida - 42cuaderno
                $save = $cuaderno->editacuafs();
                
                if($save){
                    $_SESSION['edit'] = "complete";
                }else{
                    $_SESSION['edit'] = "failed";
                }

            }else{
                $_SESSION['edit'] = "failed";
            }

        }else{
            $_SESSION['edit'] = "failed";
        }

        echo '<script>window.location="'.base_url.'cuaderno/detalle&id='.$id_cua.'"</script>';
    }

    public function Comprobante(){
        echo "<h1>Error 357: no se encuentra la información consignada</h1>";

        echo "<h2>Error 64: no existe conexion a base de datos alguna</h2>";

        echo "<h3>Error 709: error de ingreso</h3>";
    }

}


?>