package org.example.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.Controller.Validacao;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class TelaLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redireciona para a página de login no navegador
        request.getRequestDispatcher("/login.html").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        if(Validacao.validarLogin(usuario, senha)) {
            String perfil = Validacao.getPerfil(usuario);

            HttpSession session = request.getSession();
            session.setAttribute("uauario", usuario);
            response.sendRedirect(request.getContextPath() + "/home");

            if (perfil.equals("ADMIN")){
                response.sendRedirect(request.getContextPath()+
                        "/admin");
            }
        } else {
            response.sendRedirect(request.getContextPath() +  "/home");
        }

    }
}