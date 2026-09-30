<%@ page pageEncoding="UTF-8" %>
</main>
<footer class="rodape">
    <div class="limite rodape-grade">
        <div>
            <p class="logo-texto logo-rodape">Bravura <small>Veículos</small></p>
            <p>Seminovos com procedência verificada, preço fechado e test drive com hora marcada.</p>
            <p class="marcas-rodape">
                <c:forEach var="marca" items="${marcas}" varStatus="status">
                    <a href="${ctx}/estoque?marca=${marca}"><c:out value="${marca}"/></a><c:if test="${not status.last}"> · </c:if>
                </c:forEach>
            </p>
        </div>
        <div>
            <p class="olho">Páginas</p>
            <ul class="lista-links">
                <li><a href="${ctx}/inicio">Início</a></li>
                <li><a href="${ctx}/estoque">Estoque</a></li>
                <li><a href="${ctx}/veiculo?id=${destaqueId}">Veículo em destaque</a></li>
                <li><a href="${ctx}/sobre">A Bravura</a></li>
                <li><a href="${ctx}/proposta">Proposta</a></li>
            </ul>
        </div>
        <div>
            <p class="olho">Visita</p>
            <p>Av. Brigadeiro Faria Lima, 3477<br>Itaim Bibi, São Paulo</p>
            <p><a href="tel:+551134569080">(11) 3456-9080</a></p>
            <p>Seg a sex, 9h–19h · Sáb, 9h–15h</p>
        </div>
    </div>
    <div class="limite rodape-base">
        <span>© 2026 Bravura Veículos</span>
        <span>${totalEstoque} veículos no pátio</span>
    </div>
</footer>
</body>
</html>
