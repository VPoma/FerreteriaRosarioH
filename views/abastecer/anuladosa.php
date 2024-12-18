<h1>Registro de Abastecimientos ANULADOS</h1>

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
    <?Php while($ab = $abast->fetch_object()): ?>
    <tr>
        <td><?=$ab->id?></td>
        <td><?=$ab->nombrecom?></td>
        <td><?=$ab->descripcion?></td>
        <td><?=$ab->total?></td>
        <td><?=$ab->fecha?></td>
        <td><?=$ab->estado?></td>
        <td>
            <a style="width: 85px;" href="<?=base_url?>abastecer/detalle&id=<?=$ab->id?>" class="button solid-colort">Detalle</a>
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
                <a href="<?=base_url?>abastecer/anulados&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>