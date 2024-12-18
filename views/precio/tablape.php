<h1>Tabla de Precios Soles</h1>

<form action="<?=base_url?>precio/filtrotabla" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:250px;">
                <label class="frm" for="marca">Marca de Producto</label>
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
        <th style="width: 40px;">MARCA</th>
        <th style="width: 40px;">PRODUCTO</th>
        <th style="width: 40px;">MEDIDA</th>
        <th style="width: 40px;">PRECIO</th>
        <?Php if(isset($_SESSION['admin'])): ?>
        <th style="width: 40px;">PRECIO F</th>
        <th style="width: 40px;">PRECIO C</th>
        <th style="width: 40px;">ACCIONES</th>
        <?Php endif;?>
    </tr>
    <?Php while($pr = $prec->fetch_object()): ?>
    <tr>
        <td style="width: 20px;"><?=$pr->id?></td>
        <td style="width: 40px;"><?=$pr->marca?></td>
        <td style="width: 40px;"><?=$pr->nombre?></td>
        <td style="width: 40px;"><?=$pr->medida?></td>
        <td style="width: 40px;"><?=$pr->preciob?></td>
        <?Php if(isset($_SESSION['admin'])): ?>
        <td style="width: 40px;"><?=$pr->preciof?></td>
        <td style="width: 40px;"><?=$pr->precioc?></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>precio/editar&id=<?=$pr->id?>" class="button solid-colort">E. Precio</a>
        </td>
        <?Php endif;?>
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