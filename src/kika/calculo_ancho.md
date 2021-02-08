# Calculo de ancho de pistas

A los consumos típicos se le sumo un 10% por las dudas

| Net                   | Corriente | Ancho [mm]  |
| --------------------- | --------- | ----------- |
| Alimentación L293D    | 1.3A      | 0.4 -> 0.6  |
| Alimentación 2 L293D  | 2.6A      | 1 -> 1      |
| 8v                    | 3A        | 1.3 -> 1.3  |
| 5v                    | 0.4A      | 0.08 -> 0.6 |

Nota: con un ancho de pista de 0.6mm, pueden circular 1.65A, por lo que todas
las pistas no mencionadas llevan este ancho dado que tienen consumo del orden
de los mA.