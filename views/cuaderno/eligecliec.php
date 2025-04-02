<h1>Selección de Cliente</h1>

<form action="<?=base_url?>cuaderno/filtrocliente" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th colspan="3">
                <p><b>Para continuar con la venta, seleccione un cliente:</b></p>
            </th>
        </tr>
        <tr>
            <th style="width:200px;">
                <label class="frm" style="margin-left:10%;" for="numdoc">N° Documento</label>
                <input style="margin-left:10%; width:180px;" type="number"  name="numdoc" class="fildt"/>
            </th>
            <th style="width:250px;">
                <label class="frm" style="margin-left:10%;" for="nombrecom">Cliente</label>
                <input style="margin-left:10%; width:300px;" type="text"  name="nombrecom" class="fildt"/>
            </th>
            <th>
                <div class="fila-2" style="margin-right: 13%; margin-top: 30px;">
                    <input type="submit" value="Buscar" class="button solid-colort">
                </div>
            </th>
        </tr>
    </table>
</form>

<br>

<form action="<?=base_url?>ticket/filtrotick" method="POST" enctype="multipart/form-data">
    <table class="tablita">
        <tr>
            <td><b>DOCUMENTO</b></td>
            <td><b>NÚMERO</b></td>
            <td><b>CLIENTE</b></td>
            <td><b>DIRECCIÓN</b></td>
            <td><b>CIUDAD</b></td>
            <td><b>CELULAR</b></td>
            <td style="width:16%;"><b>ACCIÓN</b></td>
        </tr>
        <?Php while($ci = $clie->fetch_object()): ?>
        <tr>
            <td><?=$ci->documento?></td>
            <td><?=$ci->numdoc?></td>
            <td><?=$ci->nombrecom?></td>
            <td><?=$ci->direccion?></td>
            <td><?=$ci->ciudad?></td>
            <td><?=$ci->numcel?></td>
            <td>
                <a href="<?=base_url?>cuaderno/eligecotcuad&id=<?=$ci->id?>" class="button solid-colort">Elegir</a>
            </td>
        </tr>
        <?Php endwhile; ?>
    </table>
</form>
<br>
<br>

<table style="width: 75%; text-align: left; border: none;">
    <tr>
        <th style="width:600px;">
            <p><b>De no encontrarse, Registre un Nuevo Cliente:</b></p>
        </th>
        <th>
        <a href="<?=base_url?>cuaderno/registrocliente" class="button solid-color">Nuevo Cliente</a>
        </th>
    </tr>
</table>

<br><br>

<a href="<?=base_url?>carrito/index" class="button extrae-colort" style="width: 300px; margin-left: 6%">Ver los Productos y el Monto Total</a>