
import java.util.Scanner;

public class Sudoku {
    
    private Scanner teclado;
    private int[][] mat;

    private void matrix() {
        mat = new int[9][9];
        for (int i = 1; i <= 9; i++) {
            for (int j = 1; j <= 9; j++) {
                System.out.print("Ingrese " + i + " " + j + ": ");
                teclado = new Scanner(System.in);
                mat[i-1][j-1] = teclado.nextInt();
            }
        }
    }

    public static void main(String[] args) {

        Sudoku newgame = new Sudoku();
        newgame.matrix();

        Game sudoku = new Game(newgame.mat);
        if (sudoku.findSolution()) {
            sudoku.printBoard();
        } else {
            System.out.println("No hay solucion.");
        }
    }
}
