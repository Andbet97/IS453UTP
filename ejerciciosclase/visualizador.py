import pygame, sys
from random import randint

class View(object):
    """Clase View, sirve para ver de forma grafica la solucion brindada
        por Minizinc al problema de los Cuadrados o Rectangulos"""

    def __init__(self):
        """Inicializa el objeto de la clase View"""
        self.width = int(input())
        self.height = int(input())
        self.solution = self.set_solution()
        self.colors = self.set_colors(len(self.solution)-1)
        self.draw()

    def set_solution(self):
        data = input()
        solution = []
        N = int(len(data)/4)
        for i in range(N):
            index = i*4
            solution.append((int(data[index]), int(data[index+1]),
                             int(data[index+2]), int(data[index+3])))
        return solution

    def set_colors(self, x):
        """Funcion que escoge x colores de forma aleatoria, donde x es la
            longitud de la solucion, es decir, el numero de
            cuadrados/rectangulos"""
        # Lista de colores
        colors = []
        for i in range(x):
            # Escoger de forma aleatoria un color RGB
            r,g,b = randint(100, 200), randint(100, 200), randint(100, 200)
            colors.append((r, g, b))
        return colors

    def scale(self, width, height):
        """Funcion para asegurar que los lados de la pantalla no superen 700"""
        Max = max(width, height)
        return 700/Max

    def draw(self):
        """Funcion que se encarga de la visualizacion de los cuadrados/
            rectangulos"""
        scale = self.scale(self.width, self.height)
        pygame.init()
        width = round(self.width*scale)
        height = round(self.height*scale)
        DISPLAY = pygame.display.set_mode((width, height),0,32)
        DISPLAY.fill((30,30,30))
        for i in range(len(self.solution)):
            x,y,w,h = self.solution[i]
            # Redondear el resultado de (x,y,h,w) por la escala
            x,y = round(x*scale), round(y*scale)
            h,w = round(h*scale), round(w*scale)
            if i == len(self.solution)-1:
                pygame.draw.rect(DISPLAY,(255,255,255),(x, y, w, h))
                continue
            r,g,b = self.colors[i]
            pygame.draw.rect(DISPLAY,(r,g,b),(x, y, w, h))
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
            pygame.display.update()

# Objeto del tipo View
D = View()
