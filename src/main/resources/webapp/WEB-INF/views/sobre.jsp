<%@ page pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<section class="secao cabecalho-pagina">
    <div class="limite sobre-topo">
        <div>
            <p class="migalha"><a href="${ctx}/inicio">Início</a> <span>/</span> A Bravura</p>
            <h1>O carro entra no pátio só depois do laudo.</h1>
            <p class="lead">A Bravura é uma concessionária de seminovos no Itaim Bibi. O estoque é curto de propósito: dá para conhecer cada carro, e não uma vitrine infinita.</p>
        </div>
        <aside class="hero-painel">
            <p class="olho">Desde 1998</p>
            <strong>28</strong>
            <span>anos no mesmo endereço</span>
            <a href="${ctx}/estoque">Ver o que está à venda</a>
        </aside>
    </div>
</section>

<section class="secao secao-clara">
    <div class="limite">
        <p class="olho">O que você pode cobrar</p>
        <div class="valores">
            <article>
                <h2>Procedência</h2>
                <p>Consultamos histórico, débitos e leilão. Carro com apontamento não recebe anúncio.</p>
            </article>
            <article>
                <h2>Preço fechado</h2>
                <p>O valor da ficha já inclui a revisão de entrega. Não aparece taxa de despachante no final da conversa.</p>
            </article>
            <article>
                <h2>Garantia de 12 meses</h2>
                <p>Motor e câmbio ficam cobertos por um ano. O termo é entregue junto com a chave.</p>
            </article>
        </div>
    </div>
</section>

<section class="secao">
    <div class="limite visita">
        <div>
            <p class="olho">Visita</p>
            <h2>Venha ver o carro com hora marcada.</h2>
            <p>Av. Brigadeiro Faria Lima, 3477 — Itaim Bibi, São Paulo.</p>
            <p>Segunda a sexta, das 9h às 19h. Sábado, das 9h às 15h. Domingo a loja fecha.</p>
            <p><a href="tel:+551134569080">(11) 3456-9080</a></p>
            <div class="acoes">
                <a class="botao" href="${ctx}/proposta">Agendar test drive</a>
                <a class="botao secundario" href="${ctx}/estoque">Escolher o veículo</a>
            </div>
        </div>
        <div class="mapa">
            <p class="olho">Marcas no pátio</p>
            <ul>
                <c:forEach var="marca" items="${marcas}">
                    <li><a href="${ctx}/estoque?marca=${marca}"><c:out value="${marca}"/></a></li>
                </c:forEach>
            </ul>
            <p>${totalEstoque} carros disponíveis agora.</p>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
