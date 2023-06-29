
formulario.addEventListener('submit', (e) => {
	e.preventDefault();
    
    //Si pasa todas las validaciones, el formulario se envia al archivo formulario.php
    if(validaAlias() && validaRut() && validaEmail()){
        //Se obtienen todos los datos del formulario
        var nombre = document.getElementById('nombre').value;
        var alias = document.getElementById('alias').value;
        var rut = document.getElementById('rut').value;
        var email = document.getElementById('email').value;
        var region = $('#region option:selected').text();
        var comuna = $('#comuna option:selected').text();
        var candidato = $('#candidato option:selected').text();

        //Se crea una cadena para enviarla al archivo PHP
        var data = nombre + ";" + alias + ";" + rut + ";" + email + ";" + region + ";" + comuna + ";" + candidato;

        //Se utiliza AJAX para enviar la información al servidor
        $.ajax({
            url: "database/formulario.php",
            type: "POST",
            data: {
                data: data
            },
            success: function(response) {
                //Si la respuesta es 1, el rut ya hizo la votacion
                if(response == 1){
                    alert("Rut ya se encuentra registrado");
                }
                //Si la respuesta es 0, el rut no se encuentra registrado
                if(response == 0){
                    alert("Rut ingresado correctamente");
                }
                //Si la respuesta es 99, hubo un error desconocido en la ejecucion del insert
                if(response == 99){
                    alert("Ha ocurrido un error en el ingreso del voto");
                }    
            }
        });

    }
	
});

/*Funcion que valida con expresiones regulares que el alia tenga solo letras y numeros y que sea mayor a 5*/
function validaAlias(){
    var largo_alias = document.getElementById('alias').value.length;
    var alias = document.getElementById('alias').value;
    var exp_reg = /^([a-zA-Z0-9_-])*$/; //Expresion regular que valida que la cadena solo tenga letras y numeros

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

/* Funcion que valida el rut chileno, con formato 11111111-1 */
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

/*Funcion que valida el formato del email sea formato de correo electronico, por ejemplo, ejemplo@gmail.com
Esto se hizo con una expresion regular que valida el formato de un email */
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
