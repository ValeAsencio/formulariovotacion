<?php

function conexion(){

    $servername = "localhost";
    $username = "desis";
    $password = "pruebatecnica";
    $database = "votacion";

    // Crear la conexión
    $conn = new mysqli($servername, $username, $password, $database);

    // Verificar la conexión
    if ($conn->connect_error) {
        die("Error en la conexión: " . $conn->connect_error);
    }

    return $conn;
    // Cerrar la conexión
    //$conn->close();

}

?>
