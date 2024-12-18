<?Php
/*
var_dump($_SESSION['añadir']);
die;
*/
?>

<h1>Listado de Abastecimiento</h1>

<?Php if(isset($_SESSION['añadir']) && count($_SESSION['añadir']) >= 1) :?>

    <div style="text-align: center;">
    <?Php $stats = Utils::statsAñadir();?>
    <?Php $a = $stats['total']?>
    <?Php $total = number_format($a, 2)?>
    <h3>Precio Total: S/. <?=$total?> </h3>
    </div>
    
    <table>
        <tr>
            <th><b>MARCA</b></th>
            <th><b>NOMBRE</b></th>
            <th><b>PRECIO</b></th>
            <th><b>UNIDADES</b></th>
            <th><b>ACCIÓN</b></th>
        </tr>
    <?Php 
        foreach($añadir as $indice => $element):
        $product = $element['producto'];
    ?>
        <tr>
            <td>
                <?=$product->marca?>
            </td>
            <td>
                <a href="<?=base_url?>producto/ver&id=<?=$product->id?>"><?=$product->nombre?> <?=$product->medida?></a>
            </td>
            <td>
                <form action="<?=base_url?>añadir/cantipreci&index=<?=$indice?>" method="POST" enctype="multipart/form-data">
                <div class="updown-unidades">
                    <input class="number" type=numberb step="0.01" name="preciof" value="<?=$element['precio']?>" required/>
                </div>
            </td>
            <td>
                <div class="updown-unidades">
                    <input class="numberC" type=number step=any name="unidades" value="<?=$element['unidades']?>" required/>
                    <a href="<?=base_url?>añadir/up&index=<?=$indice?>" method="POST" class="button">+</a>
                    <a href="<?=base_url?>añadir/down&index=<?=$indice?>" class="button">-</a>
                </div>
            </td>
            <td>
                <div class="updown-unidades">
                <input type="submit" value="Actualizar" class="buttonA">
                <a href="<?=base_url?>añadir/remove&index=<?=$indice?>" class="buttonB">Quitar</a>
                </div>
            </td>
            </form>
        </tr>
        <?Php endforeach; ?>
    </table>
<br><br>
<div class="fila-1">
    <a href="<?=base_url?>añadir/delete_all" class="button carro-vaciar">Vaciar Listado</a>
    <a href="<?=base_url?>abastecer/eligprovee" class="button carro-pedido">Abastecer</a>
</div>
<?Php else: ?>
    <script>window.location="<?=base_url?>abastecer/index"</script>
<?Php endif; ?>