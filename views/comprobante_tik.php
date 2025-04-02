<?Php

require '../vendor/autoload.php';
//require_once 'vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

    //$html2pdf = new Html2Pdf('P', array(75, 130), 'es', 'true', 'UTF-8', array(3, 2, 2, 2));
    $html2pdf = new Html2Pdf('P', 'A4', 'es', 'true', 'UTF-8', array(0, 0, 0, 2));

    ob_start();
    require_once 'comprobantepdf_tik.php';
    $html = ob_get_clean();

    $html2pdf->writeHTML($html);

    $html2pdf->output('ComprobanteMSI.pdf');

?>


