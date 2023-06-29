<?php

function conexion(){

    //Conexion a la base de datos. Cambiar los datos de acuerdo al entorno donde se ejecutara la prueba

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

    //retorna la conexion
    return $conn;

}

?>
