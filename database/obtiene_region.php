<?php

include("conexion.php");

$conn = conexion();

$sql_regiones = "SELECT numero,nombre FROM region";

$result = $conn->query($sql_regiones);
if ($result->num_rows > 0) {
    // Generar las opciones del select
    while ($row = $result->fetch_assoc()) {
        echo "<option value='" . $row['numero'] . "'>" . $row['nombre'] . "</option>";
    }
}

$conn->close();


?>