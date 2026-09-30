package org.example.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.Model.Carro;
import org.example.Model.Estoque;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/veiculo")
public class VeiculoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Optional<Carro> carro = lerCarro(request.getParameter("id"));
        Pagina.preparar(request, "estoque", carro.map(Carro::getNome).orElse("Veículo não encontrado"));
        if (carro.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            Pagina.mostrar(request, response, "detalhe.jsp");
            return;
        }
        request.setAttribute("carro", carro.get());
        request.setAttribute("relacionados", Estoque.relacionados(carro.get(), 3));
        Pagina.mostrar(request, response, "detalhe.jsp");
    }

    private Optional<Carro> lerCarro(String id) {
        if (id == null || id.isBlank()) {
            return Optional.empty();
        }
        try {
            return Estoque.buscarPorId(Integer.parseInt(id));
        } catch (NumberFormatException ex) {
            return Optional.empty();
        }
    }
}
