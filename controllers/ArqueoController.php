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

            $ingreso = new Ingreso();

            $ingreso->setFecha($fecha);
            $ingreso->setTurno($turno);
            //Muestra todos los registros de Ingreso para arqueo en base a fecha y turno - 4Ingreso
            $ingr =  $ingreso->getall_Ari();
            //Muestra el monto de los registros en efectivo de Ingreso para Arqueo - 5Ingreso
            $in_calef = $ingreso->getall_Ari_in_ef();
            //Muestra el monto de los registros en transferencia de Ingreso para Arqueo - 6Ingres
            $in_caltr = $ingreso->getall_Ari_in_tr();
            //Muestra el monto de los registros en deuda de Ingreso para Arqueo - 7Ingreso
            $in_calde = $ingreso->getall_Ari_in_deu();
            
            $egreso = new Egreso();

            $egreso->setFecha($fecha);
            $egreso->setTurno($turno);
            //Muestra registros de Egreso para Arqueo - 7Egreso
            $egre = $egreso->getall_Are();
            //Muestra el monto de los registros en efectivo de Egreso para Arqueo - 8Egreso
            $eg_calef = $egreso->getall_Are_eg_ef();
            //Muestra el monto de los registros en transferencia de Egreso para Arqueo - 9Egreso
            $eg_caltr = $egreso->getall_Are_eg_tr();

            $fechaarqueo = $fecha;
            $turnoarqueo = $turno;
    
            require_once 'views/arqueo/arqueoar.php';
        }
    }

    public function save(){
        if(isset($_POST)){
            $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
            $totalingresoefectivo = isset($_POST['totalingresoefectivo']) ? $_POST['totalingresoefectivo'] : false;
            $totalingresotransfer = isset($_POST['totalingresotransfer']) ? $_POST['totalingresotransfer'] : false;
            $totalegresoefectivo = isset($_POST['totalegresoefectivo']) ? $_POST['totalegresoefectivo'] : false;
            $totalegresotransfer = isset($_POST['totalegresotransfer']) ? $_POST['totalegresotransfer'] : false;
            $totaldeuda = isset($_POST['totaldeuda']) ? $_POST['totaldeuda'] : false;
            $totalefectivo = isset($_POST['totalefectivo']) ? $_POST['totalefectivo'] : false;
            $totaltransfer = isset($_POST['totaltransfer']) ? $_POST['totaltransfer'] : false;
            $fechaar = isset($_POST['fechaar']) ? $_POST['fechaar'] : false;
            $turno = isset($_POST['turno']) ? $_POST['turno'] : false;

            if($usuario){
                $arqueo = new Arqueo();
                $arqueo->setId_Usuario($usuario);
                $arqueo->setTotalingresoe($totalingresoefectivo);
                $arqueo->setTotalingresot($totalingresotransfer);
                $arqueo->setTotalegresoe($totalegresoefectivo);
                $arqueo->setTotalegresot($totalegresotransfer);
                $arqueo->setTotaldeuda($totaldeuda);
                $arqueo->setTotalefectivo($totalefectivo);
                $arqueo->setTotaltransfer($totaltransfer);
                $arqueo->setFechaar($fechaar);
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
        echo '<script>window.location="'.base_url.'arqueo/gestion"</script>';
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
    
        //Muestra la cantidad de todos los registros - 3arqueo
        $total = $arqueo->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/arqueo/gestionar.php';
    }

    public function detalle(){
        if(isset($_POST)){
            $id = isset($_POST['id']) ? $_POST['id'] : false;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            $turno = isset($_POST['turno']) ? $_POST['turno'] : false;

            //Sacar Datos del Cuaderno
            $arqueo = new Arqueo();
            $arqueo->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $arq = $arqueo->getOne();

            //Rellenando los Ingresos
            $ingreso = new Ingreso();
            $ingreso->setFecha($fecha);
            $ingreso->setTurno($turno);
            //Muestra todos los registros de Ingreso para arqueo en base a fecha y turno - 4Ingreso
            $ingr =  $ingreso->getall_Ari();

            //Rellenando los Egresos
            $egreso = new Egreso();
            $egreso->setFecha($fecha);
            $egreso->setTurno($turno);
            //Muestra registros de Egreso para Arqueo - 7Egreso
            $egre = $egreso->getall_Are();

            require_once 'views/arqueo/detallear.php';
        }else{
            echo '<script>window.location="'.base_url.'arqueo/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $arqueo = new Arqueo();
            $arqueo->setId($id);
            //Busca un solo registro a travez de id - 9cuaderno
            $arq = $arqueo->getOne();

            require_once 'views/arqueo/anularar.php';
        }else{
            echo '<script>window.location="'.base_url.'arqueo/gestion"</script>';
        }

    }

    public function delete(){
        //Edita para olcutar registro- 10cuaderno
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $arqueo = new Arqueo();
            $arqueo->setId($id);
            $delete = $arqueo->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'arqueo/gestion"</script>';
    }

    
}

?>