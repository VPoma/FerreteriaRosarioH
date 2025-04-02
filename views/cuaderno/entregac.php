<?Php
    date_default_timezone_set("America/Lima");
    $fecha = date('h:i:s a m-d-Y', time());
    //$DateAndTime = date('m-d-Y h:i:s a', time());  
?>
<?Php if(isset($cua)):?>
    <h2>Entrega de Productos de la Nota de venta N° <?=$cua->id_cua?> - Tienda Azapampa</h2>

    <textarea id="caja4" name="descripcion" disabled>
        Siendo <?=$fecha?> ¿Desea realizar la Entrega de los productos ya antes detallados?
    </textarea>
    <br>

    <form action="<?=base_url?>cuaderno/salida" method="POST" enctype="multipart/form-data">
        
        <input type="hidden" value="<?=$cua->id?>" name="cuaderno"/>

        <div class="fila-1">
            <a href="<?=base_url?>cuaderno/detalle&id=<?=$cua->id?>" class="button extrae-colort">Regresar</a>    
            
            <input type="submit" value="Realizar Entrega" class="button solide-colort" style="width:200px;">
        </div>
    </form>
<?Php else:?>
    <?Php require_once 'views/cuaderno/registrosc.php'; ?>
<?Php endif;?>