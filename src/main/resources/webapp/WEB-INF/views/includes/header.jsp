<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${titulo}"/> · Bravura Veículos</title>
    <link rel="icon" href="${ctx}/favicon.svg" type="image/svg+xml">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,560;9..144,650&family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/css/style.css">
</head>
<body class="aurora">
<header class="topo">
    <div class="limite barra">
        <a class="logo" href="${ctx}/inicio">
            <span class="logo-marca">B</span>
            <span class="logo-texto">Bravura <small>Veículos</small></span>
        </a>
        <input class="nav-toggle" type="checkbox" id="nav-toggle">
        <label class="nav-botao" for="nav-toggle" aria-label="Abrir menu">
            <span></span><span></span><span></span>
        </label>
        <nav class="menu" aria-label="Principal">
            <a class="${pagina eq 'inicio' ? 'ativo' : ''}" href="${ctx}/inicio">Início</a>
            <a class="${pagina eq 'estoque' ? 'ativo' : ''}" href="${ctx}/estoque">Estoque</a>
            <a class="${pagina eq 'sobre' ? 'ativo' : ''}" href="${ctx}/sobre">A Bravura</a>
            <a class="botao botao-pequeno" href="${ctx}/proposta">Fazer proposta</a>
        </nav>
    </div>
</header>
<main>
