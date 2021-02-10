library(qcc)
Y <- c(10,25,15,37,15,8,28,10,6)
names(Y) <- c("Falta de motivación por la asignatura",
              "Escasa base matemática para comprender los conceptos",
              "Horario del semestre",
              "Carga de trabajo del curso excesiva",
              "Laboratorios deficientes",
              "Prácticas muy laboriosas",
              "Poco tiempo para el trabajo de curso",
              "Explicaciones en clases teóricas no satisfactorias",
              "Otras causas")
pareto.chart(Y, ylab = "FRECUENCIA", main = "Motivo de suspenso
             o abandono")
pie(Y,labels = names(Y), edges = 200, radius = 1, col = NULL,
    main = "Motivo de suspenso o abandono")