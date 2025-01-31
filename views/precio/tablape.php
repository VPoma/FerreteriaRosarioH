<h1>Tabla de Stock y Precios</h1>

<form action="<?=base_url?>precio/filtrotabla" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
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
                <input style="margin-left:5%; width:150px;" type="text"  name="nombre" class="fildt"/>
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

<table class="tablita">
    <tr>
        <th style="width: 20px;">ID</th>
        <th style="width: 40px;">FAMILIA</th>
        <th style="width: 40px;">LINEA</th>
        <th style="width: 40px;">MARCA</th>
        <th style="width: 40px;">PRODUCTO</th>
        <th style="width: 40px;">MEDIDA</th>
        <th style="width: 40px;">STOCK</th>
        <th style="width: 40px;">PRECIO</th>
        <th style="width: 40px;">PRECIO F</th>
        <?Php if(isset($_SESSION['admin'])): ?>
        <th style="width: 40px;">PRECIO C</th>
        <?Php endif;?>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($pr = $prec->fetch_object()): ?>
    <tr>
        <td><?=$pr->id?></td>
        <td><?=$pr->familia?></td>
        <td><?=$pr->linea?></td>
        <td><?=$pr->marca?></td>
        <td><?=$pr->nombre?></td>
        <td><?=$pr->medida?></td>
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
        <td><b><?=$cantidad?></b></td>
        <td><b><?=$pr->preciob?></b></td>
        <td><?=$pr->preciof?></td>
        <?Php if(isset($_SESSION['admin'])): ?>
        <td><?=$pr->precioc?></td>
        <?Php endif;?>
        <td>
            <?Php if(isset($_SESSION['admin'])): ?>
            <a href="<?=base_url?>precio/editar&id=<?=$pr->id?>" class="button solid-colort">Editar</a>
            <?Php endif;?>
            <a href="<?=base_url?>precio/historialstock&id=<?=$pr->id?>" class="button solid-colort">H. Stock</a>
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
                <a href="<?=base_url?>precio/tabla&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>