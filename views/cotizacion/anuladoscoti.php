<h1>Registros de Cotizaciones - ANULADOS</h1>

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
        <th>N°</th>
        <th style="width: 200px;">CLIENTE</th>
        <th>DESCRIPCIÓN</th>
        <th>TOTAL</th>
        <th style="width: 100px;">FECHA</th>
        <th>ESTADO</th>
        <th style="width: 104px;">ACCIÓN</th>
    </tr>
    <?Php while($cu = $cuad->fetch_object()): ?>
    <tr>
        <td><?=$cu->id_cot?></td>
        <td><?=$cu->nombrecom?></td>
        <td><?=$cu->descripcion?></td>
        <td><?=$cu->total?></td>
        <td><?=$cu->fecha?></td>
        <td><?=$cu->estado?></td>
        <td>
            <a style="width: 85px;" href="<?=base_url?>cotizacion/detallecoti&id=<?=$cu->id?>" class="button solid-colort">Detalle</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>
<!--Paginador-->
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPaga)): ?>
            <?Php for($i=1; $i<=$totalPaga; $i++): ?>
                <a href="<?=base_url?>cotizacion/anuladoscoti&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>