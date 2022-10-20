<head>
<meta charset="utf-8">
</head>
<header>
    <div class="container-lg-6">
 <nav class="navbar navbar-expand-lg bg-light">
  
    <a class="navbar-brand ">SpaceWide</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="principal/principal.jsp">Menu Inicial</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Relatórios
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="obrarelatoriojs.jsp">Obra Artistica</a></li>
            <li><a class="dropdown-item" href="usuariosrelatorio.jsp">Usuario</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Tabelas
          </a>
          <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="obrartisticacontrolar.jsp?pag=1">Obra Artistica</a></li>
            <li><a class="dropdown-item" href="usuarioscontrolar.jsp?pag=1">Usuario</a></li>
          </ul>
      </li>
      <li class="nav-item dropdown dropstart">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                           Logado como: <%=request.getSession().getAttribute("nome")%>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="deslogar.jsp">Deslogar</a></li>
      </ul>
 </nav>
     
    </div>
    </header>
