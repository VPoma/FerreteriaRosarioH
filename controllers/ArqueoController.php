<?php

require_once 'models/ingreso.php';
require_once 'models/egreso.php';

Class arqueoController{

    public function index(){
        require_once 'views/arqueo/parametroar.php';
    }
    
    public function gestion(){
        if(isset($_POST)){
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            $turno = isset($_POST['turno']) ? $_POST['turno'] : false;

            $ingreso = new Ingreso();

            $ingreso->setFecha($fecha);
            $ingreso->setTurno($turno);
            //Muestra todos los registros de Ingreso para arqueo en base a fecha y turno - 4Ingreso
            $ingr =  $ingreso->getall_Ari();
            $in_calef = $ingreso->getall_Ari_in_ef();
            $in_caltr = $ingreso->getall_Ari_in_tr();
            $in_calde = $ingreso->getall_Ari_in_deu();
            
            $egreso = new Egreso();

            $egreso->setFecha($fecha);
            $egreso->setTurno($turno);
            $egre = $egreso->getall_Are();
            $eg_calef = $egreso->getall_Are_eg_ef();
            $eg_caltr = $egreso->getall_Are_eg_tr();
    
            require_once 'views/arqueo/gestionar.php';

        }
    }
}

?>