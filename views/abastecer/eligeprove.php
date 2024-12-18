<h1>Selección de Proveedor</h1>

<form action="<?=base_url?>abastecer/filtroprovee" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th colspan="3">
                <p><b>Para poder abastecer la tienda, seleccione un proveedor:</b></p>
            </th>
        </tr>
        <tr>
            <th style="width:200px;">
                <label class="frm" style="margin-left:10%;" for="ruc">N° RUC</label>
                <input style="margin-left:10%; width:180px;" type="number"  name="ruc" class="fildt"/>
            </th>
            <th style="width:250px;">
                <label class="frm" style="margin-left:10%;" for="nombrecom">Proveedor</label>
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
            <td><b>RUC</b></td>
            <td><b>CLIENTE</b></td>
            <td><b>DIRECCIÓN</b></td>
            <td><b>CIUDAD</b></td>
            <td><b>CELULAR</b></td>
            <td style="width:16%;"><b>ACCIÓN</b></td>
        </tr>
        <?Php while($prv = $provee->fetch_object()): ?>
        <tr>
            <td><?=$prv->numruc?></td>
            <td><?=$prv->nombrecom?></td>
            <td><?=$prv->direccion?></td>
            <td><?=$prv->ciudad?></td>
            <td><?=$prv->numcel?></td>
            <td>
                <a href="<?=base_url?>abastecer/registroabs&id=<?=$prv->id?>" class="button solid-colort">Elegir</a>
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
            <p><b>De no encontrarse, Registre un Nuevo Proveedor:</b></p>
        </th>
        <th>
        <a href="<?=base_url?>abastecer/registroprovee" class="button solid-color" style="width: 172px; margin-left: 6%">Nuevo Proveedor</a>
        </th>
    </tr>
</table>

<br><br>

<a href="<?=base_url?>añadir/index" class="button extrae-colort" style="width: 300px; margin-left: 6%">Volver al Listado de Abastecimiento</a>