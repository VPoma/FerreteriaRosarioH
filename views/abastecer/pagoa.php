<?Php if(isset($abs)):?>

<h2>Venta N° <?=$abs->id?></h2>

<h3>Datos del Pago:</h3>
<table>
    <tr>
        <th>Monto Total</th>
        <th>Importe</th>
        <th>Resto</th>
    </tr>
    <tr>
        <td><?=$abs->total?></td>
        <td><?=$abs->importe?></td>
        <td><?=$abs->resto?></td>
    </tr>
</table>

<form action="<?=base_url?>abastecer/pagocua" method="POST" enctype="multipart/form-data">
    
    <input type="hidden" value="<?=$abs->id?>" name="abastecer"/>
    <input type="hidden" value="<?=$abs->total?>" name="total"/>

    <br>

    <div class="fila-1">
        <a href="<?=base_url?>abastecer/detalle&id=<?=$abs->id?>" class="button extrae-colort">Regresar</a>
        
        <input type="submit" value="Cancelar" class="button solide-colort" style="width:130px;">
    </div>
</form>

<?Php else:?>
    <?Php require_once 'views/abastecer/registrosa.php'; ?>
<?Php endif;?>