<h1>Listado de Productos a Abastecer</h1>

<?Php if(isset($_SESSION['register']) && $_SESSION['register'] == 'complete'): ?>
    <strong class="alert_green">Registro ingresado/modificado Correctamente</strong>
<?Php elseif(isset($_SESSION['register']) && $_SESSION['register'] != 'complete'): ?>
    <strong class="alert_red">Error: Introduce bien los datos</strong>
<?Php endif; ?>
<?Php Utils::deleteSession('register');?>

<?Php if(isset($_SESSION['delete']) && $_SESSION['delete'] == 'complete'): ?>
    <strong class="alert_green">Registro Eliminado correctamente</strong>
<?Php elseif(isset($_SESSION['delete']) && $_SESSION['delete'] != 'complete'): ?>
    <strong class="alert_red">Error: Registro No Eliminado</strong>
<?Php endif; ?>
<?Php Utils::deleteSession('delete');?>


<form action="<?=base_url?>abastecer/filtroindex" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:120px;">
                <label class="frm" style="margin-left:5%;" for="codigo">Codigo</label>
                <input style="margin-left:5%; width:70px;" type="text"  name="codigo" class="fildt"/>
            </th>
            <th style="width:200px;">
            <label class="frm" for="familia">Familia</label>
                <?Php $familias = utils::showFamilia(); ?>
                <select name="familia" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($fam = $familias->fetch_object()): ?>
                        <option value="<?=$fam->nombre?>">
                            <?=$fam->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" for="linea">Linea</label>
                <?Php $lineas = utils::showLinea(); ?>
                <select name="linea" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($lin = $lineas->fetch_object()): ?>
                        <option value="<?=$lin->nombre?>">
                            <?=$lin->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" for="marca">Marca</label>
                <?Php $marcas = utils::showMarca(); ?>
                <select name="marca" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($mar = $marcas->fetch_object()): ?>
                        <option value="<?=$mar->nombre?>">
                            <?=$mar->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" style="margin-left:5%;" for="nombre">Producto</label>
                <input style="margin-left:5%; width:180px;" type="text"  name="nombre" class="fildt"/>
            </th>
            <th style="width:200px;">
                <label class="frm" style="margin-left:5%;" for="nombre">Medida</label>
                <input style="margin-left:5%; width:120px;" type="text"  name="medida" class="fildt"/>
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

<table class="tablita">
    <tr>
        <th style="width: 40px;">ID</th>
        <th style="width: 40px;">CODIGO</th>
        <th style="width: 40px;">FAMILIA</th>
        <th style="width: 90px;">LINEA</th>
        <th style="width: 90px;">MARCA</th>
        <th style="width: 70px;">NOMBRE</th>
        <th style="width: 70px;">MEDIDA</th>
        <th style="width: 40px;">CANTIDAD</th>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($pr = $prod->fetch_object()): ?>
    <tr>
        <td style="width: 40px;"><?=$pr->id?></td>
        <td style="width: 40px;"><?=$pr->codigo?></td>
        <td style="width: 90px;"><?=$pr->familia?></td>
        <td style="width: 90px;"><?=$pr->linea?></td>
        <td style="width: 70px;"><?=$pr->marca?></td>
        <td style="width: 70px;"><?=$pr->nombre?></td>
        <td style="width: 70px;"><?=$pr->medida?></td>
        <?Php
        $unidades = $pr->cantidad;
        // Verifica si el número tiene decimales
        if (floor($unidades) == $unidades){
            // Si no tiene decimales, muestra el número sin decimales
            $cantidad = number_format($unidades, 0);
        }else{
            // Si tiene decimales, muestra el número con dos decimales
            $cantidad = number_format($unidades, 2);
        }
        ?>
        <td style="width: 70px;"><b><?=$cantidad?></b></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>añadir/add&id=<?=$pr->id?>" class="button solid-colort">Añadir</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPag)): ?>
            <?Php for($i=1; $i<=$totalPag; $i++): ?>
                <a href="<?=base_url?>abastecer/index&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>