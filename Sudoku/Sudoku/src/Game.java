
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author LORENA
 */
public class Game {

    private Casilla[][] board = new Casilla[9][9];
    private int white = 0;

    public Game(int[][] board) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                this.board[i][j] = new Casilla();
                this.board[i][j].setValor(board[i][j]);
                if (board[i][j] == 0) {
                    this.white += 1;
                    this.board[i][j].setColor("white");
                } else {
                    this.board[i][j].setColor("gray");
                }
            }
        }
    }

    private boolean comprubeRow(int row, int column) {

        int value = 0;

        for (int i = 0; i < 9; i++) {
            if (board[row][i].getValor() == board[row][column].getValor()) {
                value++;
            }
        }
        return (value == 1);
    }

    private boolean comprubeColumn(int row, int column) {

        int value = 0;

        for (int i = 0; i < 9; i++) {
            if (board[i][column].getValor() == board[row][column].getValor()) {
                value++;
            }
        }
        return (value == 1);
    }

    private boolean comprubeBox(int row, int column) {

        int value = 0;
        int x, y;

        x = 3 * (row / 3);
        y = 3 * (column / 3);

        for (int i = x; i < x + 3; i++) {
            for (int j = y; j < y + 3; j++) {
                if (board[i][j].getValor() == board[row][column].getValor()) {
                    value++;
                }
            }
        }
        return (value == 1);
    }

    private boolean comprube(int row, int column) {

        return (comprubeRow(row, column)
                && comprubeColumn(row, column)
                && comprubeBox(row, column));
    }

    public boolean findSolution() {

        int value = 0;

        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j].getColor().equals("white")) {
                    board[i][j].incrementValor();
                    if (board[i][j].getValor() > 9) {
                        board[i][j].resetValor();
                        j--;
                        if (j < 0) {
                            i--;
                            j = 8;
                        }
                        while (board[i][j].getColor().equals("gray")) {
                            j--;
                            if (j < 0) {
                                i--;
                                j = 8;
                            }
                            if (i < 0) {
                                i = 9;
                                j = 10;
                                value = 1;
                                break;
                            }
                        }
                        j--;
                        continue;
                    }
                    if (j == 9) {
                        continue;
                    }
                    if (!comprube(i, j)) {
                        j--;
                    }
                }
            }
        }
        return (value == 0);
    }

    public void printBoard() {
        
        for (int row = 0; row < 9; row++) {
            if (row % 3 == 0) {
                for (int i = 0; i <= 9; i++) {
                    System.out.print(" ─");
                }
                System.out.println();
            }
            for (int col = 0; col < 9; col++) {
                if (col % 3 == 0) {
                    System.out.print(" |");
                }
                System.out.print(" " + board[row][col].getValor());
            }
            System.out.print(" |");
            System.out.println();
        }
        for (int i = 0; i <= 9; i++) {
            System.out.print(" ─");
        }
        System.out.println();
    }

}
