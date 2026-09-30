package org.example.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.Model.Estoque;

import java.io.IOException;

@WebServlet("/estoque")
public class EstoqueServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoria = Estoque.normalizarCategoria(request.getParameter("categoria"));
        String marca = Estoque.normalizarMarca(request.getParameter("marca"));
        String titulo = "Estoque";
        if (!"todos".equals(categoria)) {
            titulo = "Estoque · " + categoria;
        }
        Pagina.preparar(request, "estoque", titulo);
        request.setAttribute("categoria", categoria);
        request.setAttribute("marca", marca);
        request.setAttribute("categorias", Estoque.categorias());
        request.setAttribute("carros", Estoque.filtrar(categoria, marca));
        Pagina.mostrar(request, response, "estoque.jsp");
    }
}
