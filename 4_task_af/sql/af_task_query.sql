SELECT *, StudyYear*0.15+AverageGrade as Coefficient
FROM `{{ params.AF_TASK_INPUT_TABLE }}` table
WHERE table.RecordTime > DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL -1 HOUR)