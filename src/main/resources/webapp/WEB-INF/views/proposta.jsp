<%@ page pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<section class="secao">
    <div class="limite">
        <p class="migalha">
            <a href="${ctx}/inicio">Início</a> <span>/</span>
            <a href="${ctx}/estoque">Estoque</a> <span>/</span>
            Proposta
        </p>

        <c:choose>
            <c:when test="${enviada}">
                <div class="confirmacao">
                    <p class="olho olho-claro">Proposta recebida</p>
                    <h1>Anotamos o seu interesse, <c:out value="${proposta.nome}"/>.</h1>
                    <p>O resumo abaixo confirma os dados enviados ao servidor. Um consultor usaria esse contato para marcar o test drive.</p>
                    <dl class="resumo">
                        <div><dt>E-mail</dt><dd><c:out value="${proposta.email}"/></dd></div>
                        <div><dt>Telefone</dt><dd><c:out value="${proposta.telefone}"/></dd></div>
                        <div><dt>Veículo</dt><dd><c:out value="${carroInteresse.marca}"/> <c:out value="${carroInteresse.nome}"/> · <c:out value="${carroInteresse.precoFormatado}"/></dd></div>
                        <div><dt>Mensagem</dt><dd><c:out value="${proposta.mensagem}"/></dd></div>
                    </dl>
                    <div class="acoes">
                        <a class="botao" href="${ctx}/veiculo?id=${carroInteresse.id}">Voltar à ficha</a>
                        <a class="botao secundario claro" href="${ctx}/estoque">Ver outros carros</a>
                        <a class="botao secundario claro" href="${ctx}/proposta">Nova proposta</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="proposta-grade">
                    <div>
                        <h1>Conte qual carro você quer ver de perto.</h1>
                        <p class="lead">Informe o contato e o carro. Se os dados estiverem completos, a confirmação aparece nesta mesma página.</p>
                        <form class="formulario" action="${ctx}/proposta" method="post">
                            <label>
                                Nome
                                <input type="text" name="nome" maxlength="80" autocomplete="name" required value="${fn:escapeXml(proposta.nome)}">
                                <c:if test="${not empty erros.nome}"><small><c:out value="${erros.nome}"/></small></c:if>
                            </label>
                            <div class="duas">
                                <label>
                                    E-mail
                                    <input type="email" name="email" maxlength="80" autocomplete="email" required value="${fn:escapeXml(proposta.email)}">
                                    <c:if test="${not empty erros.email}"><small><c:out value="${erros.email}"/></small></c:if>
                                </label>
                                <label>
                                    Telefone
                                    <input type="tel" name="telefone" maxlength="20" autocomplete="tel" required placeholder="(11) 90000-0000" value="${fn:escapeXml(proposta.telefone)}">
                                    <c:if test="${not empty erros.telefone}"><small><c:out value="${erros.telefone}"/></small></c:if>
                                </label>
                            </div>
                            <label>
                                Veículo
                                <select name="veiculo" required>
                                    <option value="">Selecione no estoque</option>
                                    <c:forEach var="item" items="${carros}">
                                        <option value="${item.id}" ${item.id == proposta.veiculoId ? 'selected' : ''}>
                                            <c:out value="${item.marca}"/> <c:out value="${item.nome}"/> — <c:out value="${item.precoFormatado}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                                <c:if test="${not empty erros.veiculo}"><small><c:out value="${erros.veiculo}"/></small></c:if>
                            </label>
                            <label>
                                Mensagem
                                <textarea name="mensagem" rows="5" maxlength="500" required placeholder="Horário para test drive, forma de pagamento ou o usado que pretende dar na troca."><c:out value="${proposta.mensagem}"/></textarea>
                                <c:if test="${not empty erros.mensagem}"><small><c:out value="${erros.mensagem}"/></small></c:if>
                            </label>
                            <button class="botao" type="submit">Enviar proposta</button>
                        </form>
                    </div>
                    <aside class="lado">
                        <c:choose>
                            <c:when test="${not empty carroInteresse}">
                                <p class="olho">Você está de olho em</p>
                                <h2><c:out value="${carroInteresse.nome}"/></h2>
                                <p class="preco"><c:out value="${carroInteresse.precoFormatado}"/></p>
                                <p><c:out value="${carroInteresse.ano}"/> · <c:out value="${carroInteresse.kmFormatado}"/> · <c:out value="${carroInteresse.cambio}"/></p>
                                <a class="link-seta" href="${ctx}/veiculo?id=${carroInteresse.id}">Abrir a ficha</a>
                            </c:when>
                            <c:otherwise>
                                <p class="olho">Ainda sem carro?</p>
                                <h2>Escolha no estoque e volte com o modelo certo.</h2>
                                <a class="link-seta" href="${ctx}/estoque">Ver estoque</a>
                            </c:otherwise>
                        </c:choose>
                        <hr>
                        <p class="olho">Loja</p>
                        <p>Av. Brigadeiro Faria Lima, 3477<br>Itaim Bibi, São Paulo</p>
                        <p><a href="tel:+551134569080">(11) 3456-9080</a></p>
                        <a class="link-seta" href="${ctx}/sobre">Como a Bravura trabalha</a>
                    </aside>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
