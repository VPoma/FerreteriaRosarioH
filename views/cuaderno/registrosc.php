<h1>Registros de Nota de Venta - Cuaderno</h1>

<form action="<?=base_url?>cuaderno/filtrocuad" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:120px;">
                <label class="frm" style="margin-left:5%;" for="ncuad">N° Cuaderno</label>
                <input style="margin-left:5%; width:100px;" type="text"  name="ncuad" class="fildt"/>
            </th>
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
        <th style="width: 25px;">N°</th>
        <th style="width: 150px;">FECHA</th>
        <th style="width: 60px;">Doc</th>
        <th style="width: 200px;">CLIENTE</th>
        <th style="width: 60px;">TOTAL</th>
        <th style="width: 90px;">SITUACIÓN</th>
        <th style="width: 60px;">RESTO</th>
        <th style="width: 90px;">ESTADO</th>
        <th style="width: 130px;">OBSERVACIÓN</th>
        <?Php if (isset($_SESSION['admin'])): ?>
            <th style="width: 130px;">USUARIO</th>
        <?Php endif; ?>
        <th style="width: 110px;">ACCIÓN</th>
    </tr>
    <?Php while($cu = $cuad->fetch_object()): ?>
    <tr>
        <td style="width: 25px;"><?=$cu->id_cua?></td>
        <td style="width: 150px;"><?=$cu->fecha?></td>
        <td style="width: 60px;"><?=$cu->numdoc?></td>
        <td style="width: 200px;"><?=$cu->nombrecom?></td>
        <td style="width: 60px;"><?=$cu->total?></td>
        <td style="width: 90px;"><?=$cu->situacion?></td>
        <td style="width: 60px;"><?=$cu->resto?></td>
        <td style="width: 90px;"><?=$cu->estado?></td>
        <td style="width: 130px;"><?=$cu->descripcion?></td>
        <?Php if (isset($_SESSION['admin'])): ?>
            <td style="width: 130px;"><?=$cu->usuariof?></td>
        <?Php endif; ?>
        <td style="width: 110px;">
            <a style="width: 85px; margin-left: 2px;" href="<?=base_url?>cuaderno/detalle&id=<?=$cu->id?>" class="button solid-colort">Detalle</a>
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