<?php

if (isset($_POST['data'])) {

    include("conexion.php");

    $conn = conexion();

    $id_region = $_POST['data'];

  
    $sql_comuna = "SELECT nombre,id FROM comuna WHERE id_region = ?";
    $stmt = $conn->prepare($sql_comuna);
    $stmt->bind_param("s", $id_region);
    $stmt->execute();

    $result = $stmt->get_result();
    $comunas="";
    $comunas.="<option value=''>Selecciona una opción</option>";
    if ($result->num_rows > 0) {
        // Generar las opciones del select
        while ($row = $result->fetch_assoc()) {
            
            $comunas.="<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
        }
        echo $comunas;
    }

    $conn->close();
  } 
  else {
    echo "No se recibió ningún parámetro";
  }

?>