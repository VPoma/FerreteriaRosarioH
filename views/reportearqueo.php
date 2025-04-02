<?Php

require '../vendor/autoload.php';
//require_once 'vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

    //Reporte en tamaño A4;
    $html2pdf = new Html2Pdf();

    ob_start();
    require_once 'reportearqueopdf.php';
    //require_once 'pruebapdf.php';
    $html = ob_get_clean();

    $html2pdf->writeHTML($html);

    $html2pdf->output('ComprobanteMSI.pdf');

?>


