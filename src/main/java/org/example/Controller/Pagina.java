package org.example.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.Model.Estoque;

import java.io.IOException;

public final class Pagina {
    private Pagina() {
    }

    public static void preparar(HttpServletRequest request, String pagina, String titulo) {
        request.setAttribute("pagina", pagina);
        request.setAttribute("titulo", titulo);
        request.setAttribute("totalEstoque", Estoque.listarTodos().size());
        request.setAttribute("totalMarcas", Estoque.marcas().size());
        request.setAttribute("marcas", Estoque.marcas());
        request.setAttribute("destaqueId", Estoque.destaques().get(0).getId());
    }

    public static void mostrar(HttpServletRequest request, HttpServletResponse response, String view)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/" + view).forward(request, response);
    }
}
