<?Php if(isset($cua)):?>

<h2>Venta N° <?=$cua->id?></h2>

<h3>Datos del Pago:</h3>
<table>
    <tr>
        <th>Monto Total</th>
        <th>Importe</th>
        <th>Resto</th>
    </tr>
    <tr>
        <td><?=$cua->total?></td>
        <td><?=$cua->importe?></td>
        <td><?=$cua->resto?></td>
    </tr>
</table>

<form action="<?=base_url?>cuaderno/pagocua" method="POST" enctype="multipart/form-data">
    
    <input type="hidden" value="<?=$cua->id?>" name="cuaderno"/>
    <input type="hidden" value="<?=$cua->total?>" name="total"/>

    <br>

    <div class="fila-1">
        <a href="<?=base_url?>cuaderno/detalle&id=<?=$cua->id?>" class="button extrae-colort">Regresar</a>
        
        <input type="submit" value="Pagar" class="button solide-colort" style="width:130px;">
    </div>
</form>

<?Php else:?>
    <?Php require_once 'views/cuaderno/registrosc.php'; ?>
<?Php endif;?>