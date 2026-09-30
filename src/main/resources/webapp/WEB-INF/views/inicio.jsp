<%@ page pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<section class="hero">
    <div class="limite hero-grade">
        <div>
            <p class="olho">Concessionária desde 1998</p>
            <h1>Seminovos escolhidos com critério.</h1>
            <p class="lead">Cada carro do pátio passa por checagem de procedência, histórico e revisão. O preço que você vê aqui é o preço da mesa.</p>
            <div class="acoes">
                <a class="botao" href="${ctx}/estoque">Ver estoque</a>
                <a class="botao secundario" href="${ctx}/proposta">Fazer uma proposta</a>
            </div>
        </div>
        <aside class="hero-painel">
            <p class="olho">Agora no pátio</p>
            <strong>${totalEstoque}</strong>
            <span>veículos prontos para test drive</span>
            <a href="${ctx}/veiculo?id=${destaqueId}">Abrir o destaque da semana</a>
        </aside>
    </div>
</section>

<section class="faixa">
    <div class="limite faixa-grade">
        <article><strong>28 anos</strong><span>no Itaim Bibi</span></article>
        <article><strong>${totalEstoque}</strong><span>carros em estoque</span></article>
            <article><strong>${totalMarcas}</strong><span>marcas à disposição</span></article>
        <article><strong>12 meses</strong><span>de garantia Bravura</span></article>
    </div>
</section>

<section class="secao">
    <div class="limite">
        <div class="secao-topo">
            <div>
                <p class="olho">Seleção</p>
                <h2>Três carros para começar a visita.</h2>
            </div>
            <a class="link-seta" href="${ctx}/estoque">Estoque completo</a>
        </div>
        <div class="grade">
            <c:forEach var="carro" items="${destaques}">
                <article class="cartao">
                    <a class="cartao-link" href="${ctx}/veiculo?id=${carro.id}">
                        <div class="vitrine" style="--tom: ${carro.tom}">
                            <span><c:out value="${carro.marca}"/></span>
                            <strong><c:out value="${carro.versao}"/></strong>
                        </div>
                        <div class="cartao-corpo">
                            <p class="etiqueta"><c:out value="${carro.categoria}"/> · <c:out value="${carro.ano}"/></p>
                            <h3><c:out value="${carro.nome}"/></h3>
                            <p class="meta"><c:out value="${carro.kmFormatado}"/> · <c:out value="${carro.cambio}"/> · <c:out value="${carro.combustivel}"/></p>
                            <p class="preco"><c:out value="${carro.precoFormatado}"/></p>
                            <span class="link-seta">Ver veículo</span>
                        </div>
                    </a>
                </article>
            </c:forEach>
        </div>
    </div>
</section>

<section class="secao secao-clara">
    <div class="limite">
        <p class="olho">Como funciona</p>
        <h2>Da vitrine ao test drive, sem fila de balcão.</h2>
        <ol class="passos">
            <li>
                <h3>Escolha no estoque</h3>
                <p>Filtre por categoria ou marca e abra a ficha com preço, quilometragem e procedência.</p>
                <a class="link-seta" href="${ctx}/estoque">Ir ao estoque</a>
            </li>
            <li>
                <h3>Leia a ficha</h3>
                <p>Ano, câmbio, potência e o que foi revisado ficam na página do veículo, antes de você sair de casa.</p>
                <a class="link-seta" href="${ctx}/veiculo?id=${destaqueId}">Ver um exemplo</a>
            </li>
            <li>
                <h3>Envie a proposta</h3>
                <p>Diga qual carro interessa e o horário do test drive. A equipe responde com a disponibilidade.</p>
                <a class="link-seta" href="${ctx}/proposta">Abrir proposta</a>
            </li>
        </ol>
    </div>
</section>

<section class="secao">
    <div class="limite chamada">
        <div>
            <p class="olho">A casa</p>
            <h2>Uma concessionária pequena, com estoque que cabe numa conversa.</h2>
            <p class="lead">Não trabalhamos com leilão nem com carro de procedência duvidosa. Se não passa no laudo, não entra no pátio.</p>
        </div>
        <div class="acoes">
            <a class="botao" href="${ctx}/sobre">Conhecer a Bravura</a>
            <a class="botao secundario" href="${ctx}/proposta">Falar com um consultor</a>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
