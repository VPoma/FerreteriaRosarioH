<h1>Historial de Ingresos y Egresos del Produto N° <?=$pre->id?></h1>
<table>
    <tr>
        <th style="width: 15px;">CODIGO</th>
        <th style="width: 30px;">FAMILIA</th>
        <th style="width: 30px;">LINEA</th>
        <th style="width: 100px;">MARCA</th>
        <th style="width: 100px;">PRODUCTO</th>
        <th style="width: 30px;">MEDIDA</th>
        <th style="width: 15px;">STOCK</th>
    </tr>
    <tr>
        <td><?=$pre->codigo?></td>
        <td><?=$pre->familia?></td>
        <td><?=$pre->linea?></td>
        <td><?=$pre->marca?></td>
        <td><?=$pre->nombre?></td>
        <td><?=$pre->medida?></td>
        <?Php
        $unidades = $pre->cantidad;
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
    </tr>
</table>
<br>

<table class="tablita">
    <tr>
        <th style="width: 40px;">ID</th>
        <th style="width: 60px;">REGISTRO</th>
        <th style="width: 60px;">FECHA REGISTRO</th>
        <th style="width: 60px;">ESTADO</th>
        <th style="width: 60px;">FECHA ESTADO</th>
        <th style="width: 40px;">UNIDADES</th>
    </tr>
    <?Php while($p = $pca->fetch_object()): ?>
    <tr>
        <td><?=$p->id?></td>
        <?Php
        $fuente = $p->fuente;

        if($fuente == 'cuaderno'){
            $cuabs = 'REG. CUADERNO'; 
        }else{
            $cuabs = 'ABASTECIMIENTO';
        }
        
        ?>
        <td><?=$cuabs?></td>
        <td><?=$p->fechareg?></td>
        <?Php
        $fuente = $p->fuente;

        if($fuente == 'cuaderno'){
            $estado = 'SALIÓ'; 
        }else{
            $estado = 'INGRESÓ';
        }
        
        ?>
        <td><b><?=$estado?></b></td>
        <?Php
        if(isset($p->fecha)){
            $fecha = $p->fecha;
        }else{
            $fecha = 'AUN NÓ';
        }
        
        ?>
        <td><b><?=$fecha?></b></td>
        <?Php
        $unidades = $p->cantidad;
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
    </tr>
    <?Php endwhile; ?>
</table>
<br><br>

<form action="<?=base_url?>views/reportestock.php" method="GET">
    <input type="hidden" value="<?=$pre->id?>" name="id"/>
    <input type="submit" value="Imprimir" name="Imprimir" class="button solide-colort"/>
</form>

<div class="fila-2">
    <a href="<?=base_url?>precio/tabla" class="button extrae-colort">
        Regresar
    </a>
</div>