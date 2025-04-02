<?Php
require_once 'models/cliente.php';
require_once 'models/cuaderno.php';
require_once 'models/producto.php';
require_once 'models/ingreso.php';

class estadisticosController{

    public function index(){
        require_once 'views/estadisticos/repestadies.php';
    }

    public function repest(){
        if(isset($_POST)){
            $fecha1 = isset($_POST['fecha1']) ? $_POST['fecha1'] : false;
            $fecha2 = isset($_POST['fecha2']) ? $_POST['fecha2'] : false;
            $rango = isset($_POST['rango']) ? $_POST['rango'] : false;
            $grafico = isset($_POST['grafico']) ? $_POST['grafico'] : false;
            $selec = isset($_POST['selec']) ? $_POST['selec'] : false;


            $r = $rango;
            $f1 = $fecha1;
            $f2 = $fecha2;
            $graf = $grafico;

            require_once 'views/estadisticos/'.$selec.'.php';
        }else{
            echo '<script>window.location="'.base_url.'estadisticos/index"</script>';
        }
    }

    public function clientes(){

        require_once 'views/estadisticos/clienteses.php';
    }

    public function productos(){

        require_once 'views/estadisticos/productoses.php';
    }

}

?>