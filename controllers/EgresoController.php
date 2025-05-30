<?Php

require_once 'models/egreso.php';

Class egresoController{
    public function index(){
        echo "<h1>Egresos de Caja Chica </h1>";
        date_default_timezone_set('America/Lima');
        echo date("H:i:s");
    }

    public function registro(){
        require_once 'views/egreso/registroe.php';
    }

    public function save(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : false;
            $tipopago = isset($_POST['tipopago']) ? $_POST['tipopago'] : false;
            $monto = isset($_POST['monto']) ? $_POST['monto'] : false;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;

            if($descripcion && $tipopago && $monto){
                $egreso = new Egreso;
                $egreso->setId_Tienda($tienda);
                $egreso->setId_Usuario($usuario);
                $egreso->setDescripcion($descripcion);
                $egreso->setTipopago($tipopago);
                $egreso->setMonto($monto);

                date_default_timezone_set('America/Lima');
                $horaturno = (int)date("H");

                if ($horaturno >= 7 && $horaturno < 13) {
                    $turno = "MAÑANA";
                } elseif ($horaturno >= 14 && $horaturno < 18) {
                    $turno = "TARDE";
                } else {
                    $turno = "NOCHE";
                }

                $egreso->setTurno($turno);

                if($fecha){
                    $egreso->setFecha($fecha);
                }
                
                
                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $egreso->setId($id);
                    //Editar registro de egreso - 4Egreso
                    $save = $egreso->edit();
                }else{
                    //Guardar Registro de Egresos - 1Egreso
                    $save = $egreso->save();
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
        echo '<script>window.location="'.base_url.'egreso/gestion"</script>';
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

        $egreso = new Egreso();
        $egreso->setOffset($offset);
        $egreso->setLimite($limite);

        //Muestra todos los registros de Egreso - 2Egreso
        $egre = $egreso->getAll();

        //Saca la cantidad de lineas - 3egreso
        $total = $egreso->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/egreso/gestione.php';
    }

    public function editar(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $egreso = new Egreso();
            $egreso->setId($id);
            
            //Busca un solo registro de egreso a travez de id - 3Egreso
            $egr = $egreso->getOne();

            require_once 'views/egreso/registroe.php';
        }else{
            echo '<script>window.location="'.base_url.'egreso/gestion"</script>';
        }
    }

    public function eliminar(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $egreso = new Egreso();
            $egreso->setId($id);
            
            //Busca un solo registro de egreso a travez de id - 3Egreso
            $egr = $egreso->getOne();

            require_once 'views/egreso/eliminare.php';
        }else{
            echo '<script>window.location="'.base_url.'egreso/gestion"</script>';
        }

    }

    public function delete(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $egreso = new Egreso();
            $egreso->setId($id);
            
            //Edita para ocultar un registro - 6cliente
            $delete = $egreso->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'egreso/gestion"</script>';
    }

}

?>