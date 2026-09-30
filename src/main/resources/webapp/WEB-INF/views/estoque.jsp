<%@ page pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<section class="secao cabecalho-pagina">
    <div class="limite">
        <p class="migalha"><a href="${ctx}/inicio">Início</a> <span>/</span> Estoque</p>
        <h1>Estoque à vista.</h1>
        <p class="lead">Preço anunciado, quilometragem real e categoria no filtro. Clique no carro para abrir a ficha ou já seguir para a proposta.</p>

        <nav class="filtros" aria-label="Categorias">
            <c:url var="linkTodos" value="/estoque">
                <c:if test="${marca ne 'todas'}">
                    <c:param name="marca" value="${marca}"/>
                </c:if>
            </c:url>
            <a class="${categoria eq 'todos' ? 'ativo' : ''}" href="${linkTodos}">Todos</a>
            <c:forEach var="cat" items="${categorias}">
                <c:url var="linkCategoria" value="/estoque">
                    <c:param name="categoria" value="${cat}"/>
                    <c:if test="${marca ne 'todas'}">
                        <c:param name="marca" value="${marca}"/>
                    </c:if>
                </c:url>
                <a class="${categoria eq cat ? 'ativo' : ''}" href="${linkCategoria}"><c:out value="${cat}"/></a>
            </c:forEach>
        </nav>

        <nav class="filtros filtros-marca" aria-label="Marcas">
            <c:forEach var="item" items="${marcas}">
                <c:url var="linkMarca" value="/estoque">
                    <c:param name="marca" value="${item}"/>
                    <c:if test="${categoria ne 'todos'}">
                        <c:param name="categoria" value="${categoria}"/>
                    </c:if>
                </c:url>
                <a class="${marca eq item ? 'ativo' : ''}" href="${linkMarca}"><c:out value="${item}"/></a>
            </c:forEach>
        </nav>
    </div>
</section>

<section class="secao secao-lista">
    <div class="limite">
        <p class="contagem">${carros.size()} veículo<c:if test="${carros.size() != 1}">s</c:if> neste filtro</p>
        <c:choose>
            <c:when test="${empty carros}">
                <div class="vazio">
                    <h2>Nenhum veículo com esse recorte.</h2>
                    <p>Limpe os filtros para ver o pátio inteiro.</p>
                    <a class="botao" href="${ctx}/estoque">Ver todos</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grade">
                    <c:forEach var="carro" items="${carros}">
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
                                    <span class="link-seta">Ver ficha</span>
                                </div>
                            </a>
                        </article>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
