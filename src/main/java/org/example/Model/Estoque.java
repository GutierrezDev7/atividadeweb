package org.example.Model;

import java.util.List;
import java.util.Optional;

public final class Estoque {
    private static final List<Carro> CARROS = List.of(
            new Carro(1, "Toyota", "Corolla Cross", "XRX", 2024,
                    192900, 18500, "Automático", "Flex", "Branco pérola",
                    "SUV", 177, 5,
                    "SUV médio com central multimídia, pacote de segurança Toyota e revisões feitas na concessionária. Único dono, manual e chave reserva.",
                    false, "#1c4a48"),
            new Carro(2, "Honda", "HR-V", "EXL", 2023,
                    159900, 31200, "Automático", "Flex", "Cinza barium",
                    "SUV", 177, 5,
                    "HR-V EXL com bancos em couro, Honda Sensing e histórico de manutenção completo. Pneus novos e sem pendência de recall.",
                    false, "#243044"),
            new Carro(3, "Jeep", "Commander", "Limited", 2024,
                    246900, 9800, "Automático", "Flex", "Preto carbon",
                    "SUV", 272, 5,
                    "Sete lugares, teto panorâmico e tração 4x4. Pouca quilometragem, ainda na garantia de fábrica e laudo cautelar aprovado.",
                    true, "#3c2a22"),
            new Carro(4, "Chevrolet", "Tracker", "Premier", 2024,
                    139900, 14200, "Automático", "Flex", "Prata switchblade",
                    "SUV", 133, 5,
                    "Tracker Premier com wireless charger, piloto automático e câmera 360. IPVA pago e transferência por nossa conta.",
                    false, "#3d4654"),
            new Carro(5, "Fiat", "Fastback", "Limited", 2024,
                    132900, 22100, "Automático", "Flex", "Vermelho montecarlo",
                    "SUV", 185, 5,
                    "Fastback Limited com teto solar, painel digital e pacote de som. Dono particular, com nota fiscal de origem e laudo cautelar aprovado.",
                    false, "#6e2a32"),
            new Carro(6, "Volkswagen", "Jetta", "GLI", 2022,
                    174900, 44800, "Automático", "Gasolina", "Vermelho kings",
                    "Sedan", 230, 4,
                    "GLI 2.0 turbo com 230 cv, câmbio DSG e freios maiores. Revisões na rede VW e pneus de alta performance com meia vida.",
                    false, "#5c2030"),
            new Carro(7, "Honda", "Civic", "Touring", 2023,
                    178500, 27600, "Automático", "Gasolina", "Azul cósmico",
                    "Sedan", 173, 4,
                    "Civic Touring turbo com Honda Sensing completo, teto e som premium. Laudo cautelar sem apontamento e manual carimbado.",
                    true, "#1d3557"),
            new Carro(8, "Hyundai", "HB20", "Platinum", 2024,
                    102900, 16800, "Automático", "Flex", "Azul silk",
                    "Hatch", 120, 5,
                    "HB20 Platinum automático, bluemedia e chave presencial. Ideal para quem quer um seminovo recente com garantia de um ano da Bravura.",
                    false, "#1e3a5f"),
            new Carro(9, "Volkswagen", "Polo", "Highline", 2023,
                    96900, 35400, "Automático", "Flex", "Branco puro",
                    "Hatch", 128, 5,
                    "Polo Highline com painel digital, sensor de estacionamento e baixo custo de manutenção. Aceitamos seu usado na troca.",
                    false, "#2c3338"),
            new Carro(10, "BMW", "320i", "M Sport", 2022,
                    259900, 39100, "Automático", "Gasolina", "Branco alpino",
                    "Premium", 184, 4,
                    "320i M Sport com pacote visual, bancos esportivos e histórico na concessionária BMW. Entrega com revisão de 40 mil km feita.",
                    true, "#1a1c22")
    );

    private static final List<String> CATEGORIAS = List.of("SUV", "Sedan", "Hatch", "Premium");

    private Estoque() {
    }

    public static List<Carro> listarTodos() {
        return CARROS;
    }

    public static List<String> categorias() {
        return CATEGORIAS;
    }

    public static List<String> marcas() {
        return CARROS.stream().map(Carro::getMarca).distinct().toList();
    }

    public static List<Carro> destaques() {
        return CARROS.stream().filter(Carro::isDestaque).toList();
    }

    public static Optional<Carro> buscarPorId(int id) {
        return CARROS.stream().filter(carro -> carro.getId() == id).findFirst();
    }

    public static List<Carro> filtrar(String categoria, String marca) {
        String categoriaNormalizada = normalizarCategoria(categoria);
        String marcaNormalizada = normalizarMarca(marca);
        return CARROS.stream()
                .filter(carro -> categoriaNormalizada.equals("todos")
                        || carro.getCategoria().equalsIgnoreCase(categoriaNormalizada))
                .filter(carro -> marcaNormalizada.equals("todas")
                        || carro.getMarca().equalsIgnoreCase(marcaNormalizada))
                .toList();
    }

    public static List<Carro> relacionados(Carro carro, int limite) {
        List<Carro> mesmaCategoria = CARROS.stream()
                .filter(outro -> outro.getId() != carro.getId()
                        && outro.getCategoria().equals(carro.getCategoria()))
                .limit(limite)
                .toList();
        if (!mesmaCategoria.isEmpty()) {
            return mesmaCategoria;
        }
        return CARROS.stream()
                .filter(outro -> outro.getId() != carro.getId())
                .limit(limite)
                .toList();
    }

    public static String normalizarCategoria(String categoria) {
        if (categoria == null || categoria.isBlank() || categoria.equalsIgnoreCase("todos")) {
            return "todos";
        }
        for (String item : CATEGORIAS) {
            if (item.equalsIgnoreCase(categoria)) {
                return item;
            }
        }
        return "todos";
    }

    public static String normalizarMarca(String marca) {
        if (marca == null || marca.isBlank() || marca.equalsIgnoreCase("todas")) {
            return "todas";
        }
        for (String item : marcas()) {
            if (item.equalsIgnoreCase(marca)) {
                return item;
            }
        }
        return "todas";
    }
}
