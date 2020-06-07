% Sistema experto para el diagnostico de enferdades de perros
%---------------------- Base de conocimiento --------

% Sintomas

es_sintoma_de(mal-olor-odios,otitis).
es_sintoma_de(estornudos-fiebre-diarrea,moquillo).
es_sintoma_de(mal-olor-ardor,sarna).
es_sintoma_de(picor-diarrea,parasitos-internos).
es_sintoma_de(conducta-suenio-agresivo,alzheimer).
es_sintoma_de(apetito-vomitos-debilidad,parvovirus).
es_sintoma_de(saliva-abdominal,gastritis).
es_sintoma_de(orina-ojos-unas,leishmaniosis).
es_sintoma_de(lagrimeo-ojos,conjuntivitis).
es_sintoma_de(caida-piel,garrapatas).
es_sintoma_de(tristesa-dolor,mastitis).
es_sintoma_de(tos-delgado,gusano-del-corazon).

%-----------------------Recomendaciones---------------
es_recomendacion_para_tratar(banios-con-champu-especifico,otitis).
es_recomendacion_para_tratar(medicamentos-antibioticos ,otitis).
es_recomendacion_para_tratar(antiparasitario,otitis).
es_recomendacion_para_tratar(acudir-con-el-veterinario,otitis).
es_recomendacion_para_tratar(vitamina-b,moquillo).
es_recomendacion_para_tratar(evitar-la-desidratacion,moquillo).
es_recomendacion_para_tratar(inyeccion,sarna).
es_recomendacion_para_tratar(champu-antiacaros,sarna).
es_recomendacion_para_tratar(antiflamatorios-y-analgesicos,sarna).
es_recomendacion_para_tratar(desparasitarlo,parasitos-internos).
es_recomendacion_para_tratar(acudir-con-el-veterinario,parasitos-internos).
es_recomendacion_para_tratar(no-tiene-cura-pero-se-puede-ralentizar-la-evolucion-de-la-enfermedad,alzheimer).
es_recomendacion_para_tratar(vitamina-e,alzheimer).
es_recomendacion_para_tratar(dieta-especial,alzheimer).
es_recomendacion_para_tratar(acudir-al-veterinario,parvovirus).
es_recomendacion_para_tratar(antibioticos,parvovirus).
es_recomendacion_para_tratar(postasio,parvovirus).
es_recomendacion_para_tratar(transfusiones-de-sangre,parvovirus).
es_recomendacion_para_tratar(dieta-especial,gastritis).
es_recomendacion_para_tratar(medicacion-por-el-veterinario,gastritis).
es_recomendacion_para_tratar(repelentes-para-mosquitos,leishmaniosis).
es_recomendacion_para_tratar(collar-antiparasitarios,leishmaniosis).
es_recomendacion_para_tratar(no-pasear-la-moscota-en-los-rios-o-zona-humedas,leishmaniosis).
es_recomendacion_para_tratar(limpiar-el-ojo-con-suero-fisiologico-y-gasas-esteriles,conjuntivitis).
es_recomendacion_para_tratar(antiflamatorios-esteroideos,conjuntivitis).
es_recomendacion_para_tratar(agua-oxigenada,garrapatas).
es_recomendacion_para_tratar(manzanilla,garrapatas).
es_recomendacion_para_tratar(antiparasitos,garrapatas).
es_recomendacion_para_tratar(elegir-un-buen-champu,garrapatas).
es_recomendacion_para_tratar(limpiar-las-mamas-de-la-perra-con-gasas-humedas,mastitis).
es_recomendacion_para_tratar(pipetas-con-antiparasitario,gusano-del-corazon).
es_recomendacion_para_tratar(realizar-un-estudio,gusano-del-corazon).
es_recomendacion_para_tratar(vacuna,gusano-del-corazon).




% Preguntas
pregunta(mal-olor-odios):- write('¿Tiene un mal olor en los odios?').
pregunta(estornudos-fiebre-diarrea):-write('¿Tiene estornudos, fiebre o diarra?').
pregunta(mal-olor-ardor):-write('¿Padese de mal olor, ardores constantes en la piel?').
pregunta(picor-diarrea):-write('¿Tiene picor anal, diarreas alternas o continuadas?').
pregunta(conducta-suenio-agresivo):-write('¿Cambios de conducta, cambios en los habitos de suenio,agresivo?').
pregunta(apetito-vomitos-debilidad):-write('¿Disminucion del apetito, vomitos muy severos, rapida deshidratacion, debilidad?').
pregunta(saliva-abdominal):-write('¿Produccion de saliva excesiva,dolor abdominal?').
pregunta(orina-ojos-unas):-write('¿Sangre en la orina, inflamacion de los ojos, crecimiento de las unas de forma anormal?').
pregunta(lagrimeo-ojos):-write('¿Lagrimeo continuo, enrojecimiento en los ojos?').
pregunta(caida-piel):-write('¿Caida de la piel?').
pregunta(tristesa-dolor):-write('¿Tristeza y apatia,dolor en los pezones?').
pregunta(tos-delgado):-write('¿Desmayos, tos, adelgazamiento?').








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
