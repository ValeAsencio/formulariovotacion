$(document).ready(function() {
    $.ajax({
        url: "database/obtiene_region.php",
        type: "GET",
        success: function(response) {
            $("#region").append(response);
        }
    });

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