<?Php if(isset($cua)):?>
    <h2>Entrega de Productos de la venta N° <?=$cua?></h2>

    <textarea id="caja4" name="descripcion" disabled>
        Siendo las horas actuales de la fecha actual ¿Desea realizar la Entrega de los productos ya antes detallados?
    </textarea>
    <br>

    <form action="<?=base_url?>cuaderno/salida" method="POST" enctype="multipart/form-data">
        
        <input type="hidden" value="<?=$cua?>" name="cuaderno"/>

        <div class="fila-1">
            <a href="<?=base_url?>cuaderno/detalle&id=<?=$cua?>" class="button extrae-colort">Regresar</a>    
            
            <input type="submit" value="Realizar Entrega" class="button solide-colort" style="width:200px;">
        </div>
    </form>
<?Php else:?>
    <?Php require_once 'views/cuaderno/registrosc.php'; ?>
<?Php endif;?>