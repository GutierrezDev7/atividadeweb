<%@ page pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<c:choose>
    <c:when test="${empty carro}">
        <section class="secao">
            <div class="limite vazio">
                <p class="migalha"><a href="${ctx}/inicio">Início</a> <span>/</span> <a href="${ctx}/estoque">Estoque</a></p>
                <h1>Esse veículo não está no pátio.</h1>
                <p class="lead">O código informado não corresponde a nenhum carro do estoque atual.</p>
                <div class="acoes">
                    <a class="botao" href="${ctx}/estoque">Voltar ao estoque</a>
                    <a class="botao secundario" href="${ctx}/inicio">Ir ao início</a>
                </div>
            </div>
        </section>
    </c:when>
    <c:otherwise>
        <section class="secao">
            <div class="limite">
                <p class="migalha">
                    <a href="${ctx}/inicio">Início</a> <span>/</span>
                    <a href="${ctx}/estoque">Estoque</a> <span>/</span>
                    <a href="${ctx}/estoque?categoria=${carro.categoria}"><c:out value="${carro.categoria}"/></a>
                </p>
                <div class="ficha">
                    <div class="painel" style="--tom: ${carro.tom}">
                        <span class="etiqueta etiqueta-clara"><c:out value="${carro.categoria}"/></span>
                        <div>
                            <p><c:out value="${carro.marca}"/></p>
                            <strong><c:out value="${carro.versao}"/></strong>
                        </div>
                        <span><c:out value="${carro.ano}"/> · <c:out value="${carro.cor}"/></span>
                    </div>
                    <div class="ficha-texto">
                        <p class="olho"><c:out value="${carro.marca}"/></p>
                        <h1><c:out value="${carro.nome}"/></h1>
                        <p class="preco preco-grande"><c:out value="${carro.precoFormatado}"/></p>
                        <p class="lead"><c:out value="${carro.descricao}"/></p>
                        <ul class="specs">
                            <li><span>Ano</span><strong><c:out value="${carro.ano}"/></strong></li>
                            <li><span>Quilometragem</span><strong><c:out value="${carro.kmFormatado}"/></strong></li>
                            <li><span>Câmbio</span><strong><c:out value="${carro.cambio}"/></strong></li>
                            <li><span>Combustível</span><strong><c:out value="${carro.combustivel}"/></strong></li>
                            <li><span>Potência</span><strong><c:out value="${carro.potenciaFormatada}"/></strong></li>
                            <li><span>Portas</span><strong><c:out value="${carro.portas}"/></strong></li>
                        </ul>
                        <div class="acoes">
                            <a class="botao" href="${ctx}/proposta?id=${carro.id}">Quero este veículo</a>
                            <a class="botao secundario" href="${ctx}/estoque?marca=${carro.marca}">Mais <c:out value="${carro.marca}"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <c:if test="${not empty relacionados}">
            <section class="secao secao-clara">
                <div class="limite">
                    <div class="secao-topo">
                        <div>
                            <p class="olho">Continuar a visita</p>
                            <h2>Outros carros para comparar.</h2>
                        </div>
                        <a class="link-seta" href="${ctx}/estoque">Estoque completo</a>
                    </div>
                    <div class="grade">
                        <c:forEach var="item" items="${relacionados}">
                            <article class="cartao">
                                <a class="cartao-link" href="${ctx}/veiculo?id=${item.id}">
                                    <div class="vitrine" style="--tom: ${item.tom}">
                                        <span><c:out value="${item.marca}"/></span>
                                        <strong><c:out value="${item.versao}"/></strong>
                                    </div>
                                    <div class="cartao-corpo">
                                        <p class="etiqueta"><c:out value="${item.categoria}"/> · <c:out value="${item.ano}"/></p>
                                        <h3><c:out value="${item.nome}"/></h3>
                                        <p class="preco"><c:out value="${item.precoFormatado}"/></p>
                                        <span class="link-seta">Ver ficha</span>
                                    </div>
                                </a>
                            </article>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:if>
    </c:otherwise>
</c:choose>

<%@ include file="includes/footer.jsp" %>
