<h1>Carrito de Venta</h1>

<?Php if(isset($_SESSION['carrito']) && count($_SESSION['carrito']) >= 1) :?>
    <table>
        <tr>
            <th><b>IMAGEN</b></th>
            <th><b>MARCA</b></th>
            <th><b>NOMBRE</b></th>
            <th><b>PRECIO</b></th>
            <th><b>UNIDADES</b></th>
            <th><b>ACCIÓN</b></th>
        </tr>
    <?Php 
        foreach($carrito as $indice => $elemento):
        $producto = $elemento['producto'];
    ?>
        <tr>
            <td>
                <?Php if($producto->imagen != null): ?>
                    <img src="<?=base_url?>uploads/images/<?=$producto->imagen?>" class="img_carrito" />
                <?Php else: ?>
                    <img src="<?=base_url?>assets/images/ferre.jpg" class="img_carrito" />
                <?Php endif; ?>
            </td>
            <td>
                <?=$producto->marca?>
            </td>
            <td>
                <a href="<?=base_url?>producto/ver&id=<?=$producto->id?>"><?=$producto->nombre?> <?=$producto->medida?></a>
            </td>
            <td>
                <form action="<?=base_url?>carrito/cantipreci&index=<?=$indice?>" method="POST" enctype="multipart/form-data">
                <div class="updown-unidades">
                    <input class="number" type=numberb step="0.01" name="preciob" value="<?=$elemento['precio']?>" required/>
                </div>
            </td>
            <td>
                <div class="updown-unidades">
                    <input class="numberC" type=number step=any name="unidades" value="<?=$elemento['unidades']?>" required/>
                    <a href="<?=base_url?>carrito/up&index=<?=$indice?>" method="POST" class="button">+</a>
                    <a href="<?=base_url?>carrito/down&index=<?=$indice?>" class="button">-</a>
                </div>
            </td>
            <td>
                <div class="updown-unidades">
                <input type="submit" value="Actualizar" class="buttonA">
                <a href="<?=base_url?>carrito/remove&index=<?=$indice?>" class="buttonB">Quitar</a>
                </div>
            </td>
            </form>
        </tr>
        <?Php endforeach; ?>
    </table>
<div class="fila-3">
    <?Php $stats = Utils::statsCarrito();?>
    <?Php $a = $stats['total']?>
    <?Php $total = number_format($a, 2)?>
    <h3>Precio Total: S/. <?=$total?> </h3>
</div>

<div class="fila-1">
    <a href="<?=base_url?>carrito/delete_all" class="button carro-vaciar">Vaciar Carrito</a>
    <a href="<?=base_url?>cuaderno/eligcliente" class="button carro-pedido"> Realizar Venta</a>
</div>



<?Php else: ?>
    <h2>El Carrito Está Vacio, añade algun producto</h2>
<?Php endif; ?>