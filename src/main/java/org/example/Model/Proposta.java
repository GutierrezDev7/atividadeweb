package org.example.Model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class Proposta {
    private static final Pattern EMAIL = Pattern.compile("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");

    private String nome = "";
    private String email = "";
    private String telefone = "";
    private int veiculoId;
    private String mensagem = "";

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome == null ? "" : nome.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? "" : email.trim();
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone == null ? "" : telefone.trim();
    }

    public int getVeiculoId() {
        return veiculoId;
    }

    public void setVeiculoId(int veiculoId) {
        this.veiculoId = veiculoId;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem == null ? "" : mensagem.trim();
    }

    public Map<String, String> validar() {
        Map<String, String> erros = new LinkedHashMap<>();
        if (nome.length() < 3) {
            erros.put("nome", "Informe seu nome completo.");
        }
        if (!EMAIL.matcher(email).matches()) {
            erros.put("email", "Informe um e-mail válido.");
        }
        String digitos = telefone.replaceAll("\\D", "");
        if (digitos.length() < 10) {
            erros.put("telefone", "Informe um telefone com DDD.");
        }
        if (Estoque.buscarPorId(veiculoId).isEmpty()) {
            erros.put("veiculo", "Escolha um veículo do estoque.");
        }
        if (mensagem.length() < 10) {
            erros.put("mensagem", "Conte em poucas linhas o que você precisa.");
        }
        return erros;
    }
}
