import pygame, sys
from random import randint

class View(object):
    """Clase View, sirve para ver de forma grafica la solucion brindada
        por Minizinc al problema de los Cuadrados o Rectangulos"""

    def __init__(self, width, height, solution):
        """Inicializa el objeto de la clase View"""
        self.colors = self.set_colors(len(solution))
        self.draw(width, height, solution, self.colors)

    def set_colors(self, x):
        """Funcion que escoge x colores de forma aleatoria, donde x es la
            longitud de la solucion, es decir, el numero de
            cuadrados/rectangulos"""
        # Lista de colores
        colors = []
        for i in range(x):
            # Escoger de forma aleatoria un color RGB
            r,g,b = randint(0, 200), randint(0, 200), randint(0, 200)
            colors.append((r, g, b))
        return colors

    def scale(self, width, height):
        """Funcion para asegurar que los lados de la pantalla no superen 700"""
        Max = max(width, height)
        return 700/Max

    def draw(self, width, height, solution, colors):
        """Funcion que se encarga de la visualizacion de los cuadrados/
            rectangulos"""
        scale = self.scale(width, height)
        pygame.init()
        DISPLAY = pygame.display.set_mode((int(width*scale),int(height*scale)),0,32)
        DISPLAY.fill((255,255,255))
        for i in range(len(solution)):
            x,y,w,h = solution[i]
            r,g,b = colors[i]
            # Redondear el resultado de (x,y,h,w) por la escala
            x,y = round(x*scale), round(y*scale)
            h,w = round(h*scale), round(w*scale)
            pygame.draw.rect(DISPLAY,(r,g,b),(x, y, w, h))
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
            pygame.display.update()


# Datos a ver
width=15
height=27
solution= [(0,5,1,1), (0,16,2,2), (2,16,3,3), (1,5,4,4), (0,0,5,5), (0,10,6,6),
 (0,19,7,7), (7,19,8,8), (6,10,9,9), (5,0,10,10)]
# Objeto del tipo View
D = View(width, height, solution)
