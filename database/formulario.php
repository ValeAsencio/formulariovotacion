<?php

//Script que lee los datos enviados desde el formulario

//Verifica que se envien datos desde el formulario

if (isset($_POST['data'])) {

    include("conexion.php");
    $conn = conexion();

    $datos = $_POST['data'];

    $arreglo_datos = explode(";", $datos);

    //Se lee cada campo del formulario

    $nombre = $arreglo_datos[0];
    $alias = $arreglo_datos[1];
    $rut = $arreglo_datos[2];
    $email = $arreglo_datos[3];
    $region = $arreglo_datos[4];
    $comuna = $arreglo_datos[5];
    $candidato = $arreglo_datos[6];

    $respuesta = "";

    //Consulta para verificar si el rut existe o no

    $sql = "SELECT rut FROM votante where rut = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $rut);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) { //candidato ya existe
        $respuesta = 1;
    }
    else{
        //Se inicia la transacción para insertar el nuevo votante
        $conn->begin_transaction();
        try{
            $sql_insert = "INSERT INTO votacion.votante (nombre, alias, rut, email, region, comuna, candidato) VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt_insert = $conn->prepare($sql_insert);
            $stmt_insert->bind_param("sssssss", $nombre,$alias,$rut,$email,$region,$comuna,$candidato);
            $stmt_insert->execute();
            $conn->commit();
            $stmt_insert->close();
            $conn->close();

            $respuesta = 0;

        }
        //Si ocurre un error, se hace rollback
        catch(Exception $e){
            $conn->rollback();
            $respuesta = 99;
        }
    }

    //Se envía la respuesta a AJAX
    echo $respuesta;
                
    
} 
else {
    echo "No se recibió ningún parámetro";
}

?>