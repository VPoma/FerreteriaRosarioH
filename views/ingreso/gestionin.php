<h1>Ingresos de Caja Chica</h1>

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
        <th style="width: 60px;">TIENDA</th>
        <th style="width: 100px;">DESCRIPCIÓN</th>
        <th style="width: 80px;">PERSONA</th>
        <th style="width: 60px;">TIPO DE PAGO</th>
        <th style="width: 40px;">INGRESOS</th>
        <th style="width: 40px;">DEUDAS</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 70px;">FECHA</th>
        <th style="width: 50px;">ACCIONES</th>
    </tr>
    <?Php while($in = $ingr->fetch_object()): ?>
    <tr>
        <td><?=$in->id?></td>
        <td><?=$in->tienda?></td>
        <?Php
        if(isset($in->cuaderno)){
            $descripcion = "CUADERNO $in->cuaderno";
        }else{
            $descripcion = $in->descripcion;
        }
        ?>
        <td><?=$descripcion?></td>
        <?Php
        if(isset($in->cliente)){
            $persona = "Cliente: $in->cliente";
        }else{
            $persona = "Usuario: $in->usuario";
        }
        ?>
        <td><?=$persona?></td>
        <td><?=$in->tipopago?></td>
        <td><?=$in->ingresos?></td>
        <td><?=$in->deudas?></td>
        <td><?=$in->turno?></td>
        <td><?=$in->fecha?></td>
        <?Php if (isset($in->cuaderno)): ?>
            <td>
                Sin Acción: Sujeto a Reg. Cuaderno
            </td>
        <?Php else: ?>
            <td>
                <a href="<?=base_url?>ingreso/editar&id=<?=$in->id?>" class="button solid-colort">Editar</a>
                <a href="<?=base_url?>ingreso/eliminar&id=<?=$in->id?>" class="button extra-colort">Eliminar</a>
            </td>
        <?Php endif; ?>
    </tr>
    <?Php endwhile; ?>
</table>
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPag)): ?>
            <?Php for($i=1; $i<=$totalPag; $i++): ?>
                <a href="<?=base_url?>ingreso/gestion&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>