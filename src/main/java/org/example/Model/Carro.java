package org.example.Model;

import java.text.NumberFormat;
import java.util.Locale;

public class Carro {
    private final int id;
    private final String marca;
    private final String modelo;
    private final String versao;
    private final int ano;
    private final double preco;
    private final int quilometragem;
    private final String cambio;
    private final String combustivel;
    private final String cor;
    private final String categoria;
    private final int potencia;
    private final int portas;
    private final String descricao;
    private final boolean destaque;
    private final String tom;

    public Carro(int id, String marca, String modelo, String versao, int ano,
                 double preco, int quilometragem, String cambio, String combustivel,
                 String cor, String categoria, int potencia, int portas,
                 String descricao, boolean destaque, String tom) {
        this.id = id;
        this.marca = marca;
        this.modelo = modelo;
        this.versao = versao;
        this.ano = ano;
        this.preco = preco;
        this.quilometragem = quilometragem;
        this.cambio = cambio;
        this.combustivel = combustivel;
        this.cor = cor;
        this.categoria = categoria;
        this.potencia = potencia;
        this.portas = portas;
        this.descricao = descricao;
        this.destaque = destaque;
        this.tom = tom;
    }

    public int getId() {
        return id;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public String getVersao() {
        return versao;
    }

    public String getNome() {
        return modelo + " " + versao;
    }

    public int getAno() {
        return ano;
    }

    public double getPreco() {
        return preco;
    }

    public String getPrecoFormatado() {
        return NumberFormat.getCurrencyInstance(Locale.forLanguageTag("pt-BR")).format(preco);
    }

    public int getQuilometragem() {
        return quilometragem;
    }

    public String getKmFormatado() {
        NumberFormat formato = NumberFormat.getIntegerInstance(Locale.forLanguageTag("pt-BR"));
        return formato.format(quilometragem) + " km";
    }

    public String getCambio() {
        return cambio;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public String getCor() {
        return cor;
    }

    public String getCategoria() {
        return categoria;
    }

    public int getPotencia() {
        return potencia;
    }

    public String getPotenciaFormatada() {
        return potencia + " cv";
    }

    public int getPortas() {
        return portas;
    }

    public String getDescricao() {
        return descricao;
    }

    public boolean isDestaque() {
        return destaque;
    }

    public String getTom() {
        return tom;
    }
}
