# PongGame
Autor: Yone Hernández León

### Descripción de la aplicación
La aplicación consiste en una recreación del juego clásico *Pong* programado íntegramente usando *Processing 3*. El juego consiste en hacer rebotar una bola al jugador contrario utilizando una pala que se mueve verticalmente, intentando evitar que dicha bola sobrepase al jugador. El primero en llegar a 7 puntos es el ganador del juego.

### Caracteristicas de la aplicación
Para la realización de esta aplicación fueron solicitadas algunas características básicas propias del juego original. Estas propiedades son las siguientes:
- Gestión de las colisiones de la bola (tanto con los muros como con los jugadores).
- Movimiento simultaneo de dos jugadores mediante control por teclado.
- Control de la puntuación de ambos jugadores.
- Aleatorización del movimiento inicial de la pelota.
- Reproducción de sonidos al ocurrir colisiones con paredes y jugadores, y al anotar puntos.
  
Adicionalmente, se añadieron nuevas características aportadas por el estudiante con el fin de añadir funciónes estéticas a la aplicación. Estas características son:
- Elección de entre 9 sets de sonido distintos para el juego.
- Elección de entre 9 paletas de colores distintas con las que mostrar el juego.

### Decisiones adoptadas para la solución propuesta
Al ser la aplicación un proyecto más bien sencillo, no se hizo uso de la programación con clases y objetos. Primero se programó el diseño del campo, la bola y los jugadores, y se comprobó el correcto muestreo de estos. Acto seguido, se configuraron los movimientos de jugadores y bola, y las colisiones de esta. El desarrollo continuó con el correcto funcionamiento de todo lo relacionado con la jugabilidad en sí (manejo correcto de las puntuaciones, modificación de velocidades adecuadas mediante prueba y error, reproducción correcta de los sonidos, etcétera). Para finalizar se programaron las funciones adicionales de sonido y paletas de colores, así como se dieron los ultimos retoques para arreglar fallos y optimizar código.

### Resuldato de la aplicación
![Animación 1](https://github.com/YoneHernandezLeon/PongGame/blob/main/Pong/pong_animation_1.gif?raw=true)
>Demostración de partida de Pong 1

![Animación 2](https://github.com/YoneHernandezLeon/PongGame/blob/main/Pong/pong_animation_2.gif?raw=true)
>Demostración de partida de Pong 2

![Animación Paletas de colores](https://github.com/YoneHernandezLeon/PongGame/blob/main/Pong/pong_palletes.gif?raw=true)
>Demostración de todas las paletas de colores

### Errores conocidos
Aún siendo esta aplicación completamente funcional, existen algunos errores mínimos que merecen ser mencionados. Estos son los siguientes:
- Debido a como funciona el movimiento en el lenguaje *processing* y debido al aumento de la velocidad de la bola cada vez que colisiona con un jugador, existe la posibilidad en la que la bola vaya tan rapido que atraviese una pared o a un jugador.
- Debido a como están programadas las colisiones con los jugadores, cabe la posibilidad de que la bola quede atrapada dentro del jugador rebotando varias veces dentro, lo que provoca un aumento de la velocidad muy alto y la posibilidad de que la bola rebote al lado contrario del deseado.
  
 Ambos errores ocurren en situaciones demasiado especificas y son algo complicado de replicar, por lo que no interfieren en gran medida en el funcionamiento del proyecto.

### Referencias
##### Sonidos:
- www.zapsplat.com
- Creados originalmente
##### Fuente de letra:
- https://www.dafont.com/es/vcr-osd-mono.font
##### Lenguaje de programación:
- https://processing.org/reference/
