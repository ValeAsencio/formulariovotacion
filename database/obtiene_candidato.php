<?php

//Verifica que se envien datos desde el formulario
if (isset($_POST['data'])) {

    //Se abre la conexion a la base de datos
    include("conexion.php");

    $conn = conexion();

    $candidato = $_POST['data'];

    //Consulta para obtener a los candidatos de acuerdo a la comuna

    $sql_candidato = "SELECT id,nombre FROM candidato where comuna_id = ?";
    $stmt = $conn->prepare($sql_candidato);
    $stmt->bind_param("s", $candidato);
    $stmt->execute();

    $result = $stmt->get_result();
    $candidato="";
    $candidato.="<option value=''>Selecciona una opción</option>";
    if ($result->num_rows > 0) {
        // Generar las opciones del select
        while ($row = $result->fetch_assoc()) {
            //Se arma un elemento html para mostrar el candidato en el lado del cliente
            $candidato.="<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
        }
        echo $candidato;
    }

    $conn->close();
} 
else {
    echo "No se recibió ningún parámetro";
}

?>