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
            $monto = isset($_POST['monto']) ? $_POST['monto'] : false;

            if($tienda && $usuario && $descripcion && $monto){
                $egreso = new Egreso;
                $egreso->setId_Tienda($tienda);
                $egreso->setId_Usuario($usuario);
                $egreso->setDescripcion($descripcion);
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
                
                $save = $egreso->save();

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $egreso->setId($id);
                    //$save = $egreso->edit();
                }else{
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
        echo '<script>window.location="'.base_url.'egreso/registro"</script>';
    }
}

?>