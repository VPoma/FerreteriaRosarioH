<?Php if(isset($elig)):?>
    <h1>Elija una Opción</h1>
    <?Php $url_action = base_url."marca/delete&id=".$id_cli;?>

<br>

<table  style="margin-left: 13%;">
    <tr>
        <th>
            <a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort" style="width:150px;" >Regresar</a>
        </th>
        <th>
            <a href="<?=base_url?>cotizacion/registrocoti&id=<?=$id_cli?>" class="button solide-colort" style="width:150px;" >Cotizar</a>
        </th>
        <th>
            <a href="<?=base_url?>cuaderno/registrocuad&id=<?=$id_cli?>" class="button solide-colort" style="width:150px;" >Nota de Venta</a>
        </th>
    </tr>
</table>

<?Php else:?>
    <h1>Registre o elija un Usuario</h1>
<?Php endif;?>