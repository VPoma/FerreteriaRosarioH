<?Php if(isset($abs)):?>
    <h2>Ingreso de Productos por Abastecimiento N° <?=$abs?></h2>

    <textarea id="caja4" name="descripcion" disabled>
        Siendo las horas actuales de la fecha actual ¿Desea realizar el ingreso de productos a almacen?
    </textarea>
    <br>

    <form action="<?=base_url?>abastecer/ingreso" method="POST" enctype="multipart/form-data">
        
        <input type="hidden" value="<?=$abs?>" name="abastecer"/>

        <div class="fila-1">
            <a href="<?=base_url?>abastecer/detalle&id=<?=$abs?>" class="button extrae-colort">Regresar</a>    
            
            <input type="submit" value="Realizar Ingreso" class="button solide-colort" style="width:200px;">
        </div>
    </form>
<?Php else:?>
    <?Php require_once 'views/abastecer/registrosa.php'; ?>
<?Php endif;?>