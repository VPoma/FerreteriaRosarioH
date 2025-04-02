<?Php

require_once 'models/ingreso.php';

Class ingresoController{
    public function index(){
        echo "<h1>Ingresos de Caja Chica </h1>";
        date_default_timezone_set('America/Lima');
        echo date("H:i:s");
    }

    public function gestion(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 6;
        $offset = ($pag-1)*$limite;

        $ingreso = new Ingreso();
        $ingreso->setOffset($offset);
        $ingreso->setLimite($limite);

        //Muestra todos los registros de Egreso - 2Ingreso
        $ingr = $ingreso->getAll();

        //Saca la cantidad de lineas - Inegreso
        $total = $ingreso->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/ingreso/gestionin.php';
    }

    public function registro(){
        require_once 'views/ingreso/registroin.php';
    }

    public function savein(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $tipopago = isset($_POST['tipopago']) ? $_POST['tipopago'] : false;
            $monto = isset($_POST['monto']) ? $_POST['monto'] : false;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;

            if($tipopago && $monto){

                //Guarda en la tabla de Ingreso
                $ingreso = new Ingreso();
                $ingreso->setId_tienda($tienda);
                $ingreso->setId_usuario($usuario);
                $ingreso->setTipopago($tipopago);
                $ingreso->setIngresos($monto);

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
                $ingreso->setDescripcion($descripcion);
                if($fecha){
                    $ingreso->setFecha($fecha);
                }
                
                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $ingreso->setId($id);

                    //Editar registro de ingreso - 10Ingreso
                    $save = $ingreso->edit();
                }else{
                    //Guardar Registro de Ingresos - 1Ingreso
                    $save = $ingreso->savein();
                }
                
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
        echo '<script>window.location="'.base_url.'ingreso/gestion"</script>';
    }

    public function editar(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $ingreso = new Ingreso();
            $ingreso->setId($id);
            
             //Busca un solo registro de Ingreso a travez de id - 9Ingreso
            $ing = $ingreso->getOne();

            require_once 'views/ingreso/registroin.php';
        }else{
            echo '<script>window.location="'.base_url.'ingreso/gestion"</script>';
        }
    }

    public function eliminar(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $ingreso = new Ingreso();
            $ingreso->setId($id);
            
             //Busca un solo registro de Ingreso a travez de id - 9Ingreso
            $ing = $ingreso->getOne();

            require_once 'views/ingreso/eliminain.php';
        }else{
            echo '<script>window.location="'.base_url.'ingreso/gestion"</script>';
        }

    }

    public function delete(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $ingreso = new Ingreso();
            $ingreso->setId($id);
            
            ///Editar A fin de Ocultar - 11Ingreso
            $delete = $ingreso->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'ingreso/gestion"</script>';
    }

    public function editaingr(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $ingreso = new Ingreso();
            $ingreso->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $ingr = $ingreso->getOne();

            require_once 'views/cuaderno/editacua.php';
        }else{
            echo '<script>window.location="'.base_url.'cuaderno/registroscuaderno"</script>';
        }
    }

}

?>