<h1>Registros de Venta - Cuaderno</h1>

<form action="<?=base_url?>cuaderno/filtrocuad" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:200px;">
                <label class="frm" style="margin-left:10%;" for="fecha">Fecha de Venta</label>
                <input style="margin-left:10%; width:180px;" type="date"  name="fecha" class="fildt"/>
            </th>
            <th>
                <div class="fila-2" style="margin-right: 13%; margin-top: 30px;">
                    <input type="submit" value="Buscar" class="button solid-colort">
                </div>
            </th>
        </tr>
    </table>
</form>
<br><br>

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
        <th>Doc</th>
        <th style="width: 200px;">CLIENTE</th>
        <th>TOTAL</th>
        <th>ESTADO</th>
        <th>SITUACIÓN</th>
        <th style="width: 100px;">FECHA</th>
        <th style="width: 104px;">ACCIÓN</th>
    </tr>
    <?Php while($cu = $cuad->fetch_object()): ?>
    <tr>
        <td><?=$cu->id?></td>
        <td><?=$cu->numdoc?></td>
        <td><?=$cu->nombrecom?></td>
        <td><?=$cu->total?></td>
        <td><?=$cu->estado?></td>
        <td><?=$cu->situacion?></td>
        <td><?=$cu->fecha?></td>
        <td>
            <a style="width: 85px;" href="<?=base_url?>cuaderno/detalle&id=<?=$cu->id?>" class="button solid-colort">Detalle</a>
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
                <a href="<?=base_url?>cuaderno/registroscuaderno&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>