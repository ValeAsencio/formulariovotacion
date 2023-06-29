
formulario.addEventListener('submit', (e) => {
	e.preventDefault();
    /*validaAlias();
    validaRut();
    validaEmail();*/

    if(validaAlias() && validaRut() && validaEmail()){
        var nombre = document.getElementById('nombre').value;
        var alias = document.getElementById('alias').value;
        var rut = document.getElementById('rut').value;
        var email = document.getElementById('email').value;
        var region = $('#region option:selected').text();
        var comuna = $('#comuna option:selected').text();
        var candidato = $('#candidato option:selected').text();

        var data = nombre + ";" + alias + ";" + rut + ";" + email + ";" + region + ";" + comuna + ";" + candidato;

        $.ajax({
            url: "database/formulario.php",
            type: "POST",
            data: {
                data: data
            },
            success: function(response) {
                if(response == 1){
                    alert("Rut ya se encuentra registrado");
                }

                if(response == 0){
                    alert("Rut ingresado correctamente");
                }

                if(response == 99){
                    alert("Ha ocurrido un error en el ingreso del voto");
                }    
            }
        });

    }
	
});

function validaAlias(){
    var largo_alias = document.getElementById('alias').value.length;
    var alias = document.getElementById('alias').value;
    var exp_reg = /^([a-zA-Z0-9_-])*$/;

    if (largo_alias < 6){
        alert("Alias debe tener más de cinco caracteres");
        return false;
    }
    if(!exp_reg.exec(alias)){
        alert("Alias solo debe contener letras y números");
        return false;
    }

    return true;
    
}

function validaRut(){
    var rut = document.getElementById('rut').value;

    if (rut.length > 0){

        rut = rut.replace(/[^\dkK]/g, ''); // Eliminar todos los caracteres excepto números y "k" en minúscula
    
        if (!/^\d{1,2}\d{3}\d{3}[\dkK]$/.exec(rut)) {
            alert("Formato RUT incorrecto"); // El formato del RUT es incorrecto
            return false;
        }

        // Separar el número y el dígito verificador
        var numero = rut.slice(0, -1);
        var dv = rut.slice(-1).toLowerCase();

        // Calcular el dígito verificador esperado
        var suma = 0;
        var factor = 2;
        for (var i = numero.length - 1; i >= 0; i--) {
            suma += factor * parseInt(numero.charAt(i));
            factor = factor % 7 === 0 ? 2 : factor + 1;
        }
        var dvEsperado = 11 - (suma % 11);
        if (dvEsperado === 10) {
            dvEsperado = 'k';
        } else if (dvEsperado === 11) {
            dvEsperado = '0';
        } else {
            dvEsperado = dvEsperado.toString();
        }

        if (dv === dvEsperado){
            return true;
        }
        else{
            alert("Rut no válido");
        }

    }
      
    
    
}

function validaEmail(){
    var email = document.getElementById('email').value;

    if (email.length > 0){
        var exp_reg = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(!exp_reg.exec(email)){
            alert("Formato email incorrecto");
        }

        return true;
    }
    
}



//desis -> pruebatecnica
