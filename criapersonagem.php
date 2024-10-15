<?php
include("conectadb.php");

if ($_SERVER['REQUEST_METHOD'] == "POST"){

    
}



?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>CRIAÇÃO DE PERSONAGEM</title>
</head>

<body>
    <div class="container-global">

        <div class="formulario">
            <form class="inicio" action="inicio.php" method="post">
                <label>NOME PERSONAGEM</label>
                <br>
                <input type="text">
                <br>
                <label>SENHA</label>
                <br>
                <input type="password">
                <br>
                <input type="submit">
                <a href="exit.php"><button>Sair</button></a>
            </form>
        </div>
    </div>

</body>

</html>