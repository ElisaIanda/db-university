-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name`= "Corso di Laurea in Economia";


-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
-- Neuroscienze
SELECT *
FROM `degrees`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`department_id` = 7
	AND `degrees`.`level` = "magistrale";


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM `course_teacher` 
INNER JOIN `teachers` 
    ON `teachers`.`id` = `course_teacher`.`teacher_id` 
INNER JOIN `courses` 
    ON `courses`.`id` = `course_teacher`.`course_id` 
WHERE `teachers`.`id` = 44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome
SELECT *
FROM `students`
INNER JOIN `degrees` 
    ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments` 
    ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`,
    `students`.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di
-- Matematica (54)
FROM `teachers`
INNER JOIN `course_teacher`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`id` = 5;


-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.