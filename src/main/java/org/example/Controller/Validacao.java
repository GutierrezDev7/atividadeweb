package org.example.Controller;

import org.example.Model.UsuarioDAO;

public class Validacao {

    private final UsuarioDAO usuarioDAO;

    public Validacao(){
        usuarioDAO = new UsuarioDAO();
    }
    public static boolean validarLogin(String usuario, String senha){
        if(usuario==null||usuario.isBlank()){
            return false;
        }
        if(senha == null || senha.isBlank()){
            return false;
        }
        return UsuarioDAO.autenticar(usuario,senha);
    }

    public static String getPerfil(String usuario) {
        return null;
    }
}