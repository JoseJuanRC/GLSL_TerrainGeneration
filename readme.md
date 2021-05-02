# Terrain generation

Este proyecto tiene como objetivo utilizar el ruido de Perlin para generar terreno.

## Características

- Se utiliza un ruido de [perlin](https://es.wikipedia.org/wiki/Ruido_Perlin) para representar la forma del terreno
- Según la altura que se consiga con el ruido se aplica un color del terreno diferente.

## Decisiones

##### Terreno

- Se genera el terreno en el momento de ejecución
    - El terreno tiene un tamaño de 2.000
    - Generamos un vertice del terreno cada 10 unidades de distancia.

##### Movimiento
- Aplicamos el movimiento desde el shader. Aplicamos un desplazamiento del ruido que calculamos.

##### Controles

- Click izquierdo:
    - Zoom in 
- Click derecho:
    - Zoom out 
- Flechas:
    - Movimiento
    

##### Colores
- Se utilizan 6 colores distintos:
    - Agua profunda
    - Agua normal
    - Hierba
    - Montaña
    - Rocas
    - Nieve
- Entre algunos colores se irá interpolando para hacer el cambio entre colores más realista. Las interpolaciones que se han tratado son:
    - Distinta tonalidad en el agua.
    - Desde la hierba a la montaña.
    - Desde la montaña a la roca.
    - Desde la roca a la nieve.
## Gif resultado

![](example.gif)

## Base

Para realizar esta implementación se ha tenido en cuenta, entre otras fuentes, la implementación de ruido con gradiente (o Perlin) que existe en la herramienta Unity (más concretamente dentro de la función de Shader Graph).

- [Gradient Noise](https://docs.unity3d.com/Packages/com.unity.shadergraph@6.9/manual/Gradient-Noise-Node.html)

## Herramientas utilizadas
- [Processing](https://processing.org/)
- [Editor del shader](https://thebookofshaders.com/edit.php)
- [Editor readme.md](https://dillinger.io/)

Realizado por [José Juan Reyes Cabrera](https://github.com/JoseJuanRC)
