//Funciones AJAX


$(document).ready(function() {

    /*Aquí se cargan todas las regiones en el formulario, obteniendo la informacion desde la base de datos
    usando AJAX utilizando obtiene_region.php*/
    $.ajax({
        url: "database/obtiene_region.php",
        type: "GET",
        success: function(response) {
            $("#region").append(response);
        }
    });

    /*Al hacer click en una region, con el evento change, captura la region y con el id va a la base de datos
    a obtener la comuna asociada*/
    $("#region").change(function(){
        var region = $("#region").val();
        $.ajax({
            url: "database/obtiene_comuna.php",
            type: "POST",
            data: {
                data: region
            },
            success: function(response) {
                $("#comuna").html(response);
    
            }
        });
    })
    /*Al hacer click en una comuna, con el evento change, captura la comuna y con el id va a la base de datos
    a obtener el candidato asociado*/
    $("#comuna").change(function(){
        var comuna = $("#comuna").val();
        $.ajax({
            url: "database/obtiene_candidato.php",
            type: "POST",
            data: {
                data: comuna
            },
            success: function(response) {
                $("#candidato").html(response);
    
            }
        });
    })


});