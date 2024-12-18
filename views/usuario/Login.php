<?Php if(!isset($_SESSION['identity'])): ?>

    <h1>Bienvenido a Rosario</h1>

    <div class="tarjeta">

        <table class="tarjeta-login">
            <tr>
                <th class="tarjeta-login-f" style="width: 500px;">
                    <form action="<?=base_url?>usuario/login" method="post">


                        <label class="frm" for="usuariof">Usuario</label>
                        <input type="text" name="usuariof" />

                        <label class="frm" for="password">Password</label>
                        <input type="password" name="password" />

                        <input type="submit" value="Ingresar">
                    </form>
                </th>
                <th class="tarjeta-login-i" style="width: 300px;">
                    <img class="login-i" src="<?=base_url?>assets/images/LogoR.png" alt="">
                </th>

    <?Php else: ?>
                <div class="link3">
                    <h2>USUARIO: <?=$_SESSION['identity']->nombre?> <?=$_SESSION['identity']->apellidos?></h2>
                    <h3>DNI : <?=$_SESSION['identity']->dni?></h3>
                    <h3>USUARIO : <?=$_SESSION['identity']->usuariof?></h3>
                    <?Php if($_SESSION['identity']->imagen != null): ?>
                        <img class="tamaño_per" src="<?=base_url?>uploads/images/<?=$_SESSION['identity']->imagen?>"/>
                    <?Php else: ?>
                        <img class="tamaño_per" src="<?=base_url?>assets/images/fotop.png"/>
                    <?Php endif; ?>
                </div>
    <?Php endif; ?>
                    <br>
                    
                    <div class="link3">
                    <ul>
                        <?Php if (isset($_SESSION['identity'])): ?>
                            <li><a class="separa" href="<?=base_url?>usuario/editu&id=<?=$_SESSION['identity']->id?>">Editar Perfil</a></li>
                            <li><a class="separa" href="<?=base_url?>usuario/editp&id=<?=$_SESSION['identity']->id?>">Cambiar Password</a></li>
                        <?Php endif; ?>
                    </ul>
                    </div>
            </tr>
        </table>
    </div>