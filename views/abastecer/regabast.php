<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($reg) && isset($prv) && is_object($prv)):?>
        <h1>Registro de Abastecimiento</h1>
        <?Php $url_action = base_url."abastecer/regabastecer";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="tienda">Tienda</label>
        <?Php $tiendas = utils::showTienda(); ?>
        <select name="tienda" id="">
            <?Php while($tie = $tiendas->fetch_object()): ?>
                <option value="<?=$tie->id?>">
                    <?=$tie->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <input type="hidden" value="<?=$_SESSION['identity']->id?>" name="usuario"/>
        <input type="hidden" value="<?=$prv->id?>" name="proveedor"/>

        <label class="frm"  for="documento">Ruc</label>
        <input type="text" value="<?=$prv->numruc?>" readonly/>

        <label class="frm"  for="cliente">Cliente</label>
        <input type="text" value="<?=$prv->nombrecom?>" readonly/>

        
        <?Php $stats = Utils::statsAñadir();?>
        <?Php $a = $stats['total']?>
        <?Php $total = number_format($a, 2)?>


        <label class="frm"  for="total">Total</label>
        <input type="text" value="<?=$total?>" readonly/>

        <label class="frm"  for="situacion">Situación</label>
        <select name="situacion" id="">
            <option value="POR COBRAR">Por Cobrar</option>
            <option value="A CUENTA">A cuenta</option>
            <option value="CANCELADO">Cancelado</option>
        </select>

        <label class="frm"  for="importe">Importe</label>
        <input type="number" step="any" name="importe" value="0.00" required/>

        <label class="frm"  for="descripcion">Descripción (Opcional)</label>
        <textarea id="caja4" name="descripcion">N/A</textarea>

        <!--<input type="submit" value="Confirmar Venta">-->

        <br>
        <div class="fila-2">
            <!--<a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort">
                Regresar
            </a>-->
            <input type="submit" value="Confirmar Venta" class="button solide-colort" style="width:200px;">
        </div>

        <br>
        <p><a href="<?=base_url?>abastecer/eligprovee" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>
    </form>

    <?Php else: ?>
        <h1>Logueese Primero!!!</h1>
        <p>Necesitas estar logueado en la WEB para poder realizar tu pedido</p>
<?Php endif;?>