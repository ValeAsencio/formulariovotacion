<?php

//Verifica que se envien datos desde el formulario

if (isset($_POST['data'])) {

    //Se abre la conexion a la base de datos
    include("conexion.php");

    $conn = conexion();

    $id_region = $_POST['data'];

    //Consulta para obtener la comuna dependiendo de la region
  
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
            //Se arma un elemento html para mostrar el candidato en el lado del cliente
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