% Sistema experto para el diagnostico de enferdades de perros
%---------------------- Base de conocimiento --------

% Sintomas

es_sintoma_de(mal-olor-odios,otitis).



%-----------------------Recomendaciones---------------
es_recomendacion_para_tratar(banios-con-champu-especifico,otitis).
es_recomendacion_para_tratar(medicamentos-antibioticos ,otitis).
es_recomendacion_para_tratar(antiparasitario,otitis).
es_recomendacion_para_tratar(acudir-con-el-veterinario,otitis).


% Preguntas
pregunta(mal-olor-odios):- write('¿Tiene un mal olor en los odios?').

%-----------------------Motor de inferencia-----------
diagnostico_tratamiento(Sintoma, Tratamiento) :-
    es_sintoma_de(Sintoma, Enfermedad),
    es_recomendacion_para_tratar(Tratamiento, Enfermedad).

enfermedad_tratamiento(Enfermedad, Tratamiento) :-
    es_recomendacion_para_tratar(Tratamiento, Enfermedad).

preguntar(Sintoma) :-
    pregunta(Sintoma),
    nl,
    write('Responda: si. o no. '),
    nl,
    read(Respuesta),
    Respuesta = 'si', !.

escribir_tratamiento(Tratamiento):-
    write(Tratamiento),nl,fail.


%------------------------- Interfaz de Usuario--------
inicio:-
    write('Escribe el nombre de su mascota: '),
    read(Nombre),
    preguntar(Sintoma),
    nl,
    es_sintoma_de(Sintoma,Enfermedad),
    write('Su mascota '),
    write(Nombre),
    write(' , el nombre de la enfermedad que padece es: '),
    write(Enfermedad),
    nl,
    write('El tratamiento consiste en: '),
    nl,
    diagnostico_tratamiento(Sintoma,Tratamiento),
    escribir_tratamiento(Tratamiento).




    