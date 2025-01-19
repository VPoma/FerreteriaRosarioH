<?php

require_once 'models/ingreso.php';
require_once 'models/egreso.php';
require_once 'models/arqueo.php';

Class arqueoController{

    public function index(){
        require_once 'views/arqueo/parametroar.php';
    }
    
    public function arqueodiario(){
        if(isset($_POST)){
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            $turno = isset($_POST['turno']) ? $_POST['turno'] : false;
            $mic = isset($_POST['mic']) ? $_POST['mic'] : false;

            $montoinicial = $mic;

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

            $turnoarqueo = $turno;
    
            require_once 'views/arqueo/arqueoar.php';
        }
    }

    public function save(){
        if(isset($_POST)){
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $montoinicialcaja = isset($_POST['montoinicialcaja']) ? $_POST['montoinicialcaja'] : false;
            $totalingresoefectivo = isset($_POST['totalingresoefectivo']) ? $_POST['totalingresoefectivo'] : false;
            $totalingresotransfer = isset($_POST['totalingresotransfer']) ? $_POST['totalingresotransfer'] : false;
            $totalegresoefectivo = isset($_POST['totalegresoefectivo']) ? $_POST['totalegresoefectivo'] : false;
            $totalegresotransfer = isset($_POST['totalegresotransfer']) ? $_POST['totalegresotransfer'] : false;
            $totaldeuda = isset($_POST['totaldeuda']) ? $_POST['totaldeuda'] : false;
            $totalefectivo = isset($_POST['totalefectivo']) ? $_POST['totalefectivo'] : false;
            $totaltransfer = isset($_POST['totaltransfer']) ? $_POST['totaltransfer'] : false;
            $totalcaja = isset($_POST['totalcaja']) ? $_POST['totalcaja'] : false;
            $turno = isset($_POST['turno']) ? $_POST['turno'] : false;

            if($usuario){
                $arqueo = new Arqueo();
                $arqueo->setId_Usuario($usuario);
                $arqueo->setMontoinicialc($montoinicialcaja);
                $arqueo->setTotalingresoe($totalingresoefectivo);
                $arqueo->setTotalingresot($totalingresotransfer);
                $arqueo->setTotalegresoe($totalegresoefectivo);
                $arqueo->setTotalegresot($totalegresotransfer);
                $arqueo->setTotaldeuda($totaldeuda);
                $arqueo->setTotalefectivo($totalefectivo);
                $arqueo->setTotaltransfer($totaltransfer);
                $arqueo->setTotalcaja($totalcaja);
                $arqueo->setTurno($turno);

                //Guardar Registro Arqueo - 1arqueo
                $save = $arqueo->save();

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
        echo '<script>window.location="'.base_url.'arqueo/index"</script>';
    }

    public function gestion(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        $arqueo = new Arqueo();
        $arqueo->setOffset($offset);
        $arqueo->setLimite($limite);
        //Muestra todos los registros - 2arqueo
        $arqu = $arqueo->getAll();
    
        //Saca la cantidad de lineas - 0producto
        $total = $arqueo->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/arqueo/gestionar.php';
    }

    
}

?>