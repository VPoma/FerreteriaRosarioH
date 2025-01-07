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

        //Muestra todos los registros de Egreso - 2Egreso
        $ingr = $ingreso->getAll();

        //Saca la cantidad de lineas - 3egreso
        $total = $ingreso->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/ingreso/gestionin.php';
    }
}

?>