library(dagitty)

dag <- dagitty("dag {
  Age -> KPS
  Age -> cure_chance
  Age -> Tx_intensity
  Age -> dis
  cure_chance -> KPS
  KPS -> cure_chance
  KPS -> Tx_intensity
  cure_chance -> Tx_intensity
  Tx_intensity -> cure_chance
  dis -> Tx_intensity
  dis -> KPS
  dis -> cure_chance
  Age -> death
  KPS -> death
  Tx_intensity -> death
  dis -> death
               }")

plot(graphLayout( dag ))

library(ggdag)
tidy_dag <- tidy_dagitty(dag)
ggdag(tidy_dag) +
  theme_dag()

