package org.example.Model;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    private static final String URL = "jdbc:postgresql://localhost:5432/Nome_da_base";
    private static final String USUARIO = "usuario";
    private static final String SENHA = "senha";

    public static Connection conectar()
            throws SQLException{
        return DriverManager.getConnection(
                URL,USUARIO,SENHA);

       }

}