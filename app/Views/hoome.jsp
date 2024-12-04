<%@ page contentType="text/html; charset=UTF-8" %>




    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Barbearia - Página Inicial</title>
 
        <!-- Bootstrap Icons with Integrity -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            
        <!-- Security Headers -->
        <meta http-equiv="Content-Security-Policy"
            content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; img-src 'self' data:;">

        <!-- Preload Critical Assets -->
        <link rel="preload" href="../Assets/css/Home.css" as="style">
        <link rel="preload" href="../Assets/img/barbeiro cortando barba.jpg" as="image">

        <!-- Stylesheets with Integrity and Crossorigin -->
        <link rel="stylesheet" href="../Assets/css/Home.css">
        

        <!-- Favicon -->
        <link rel="icon" type="image/png" href="../Assets/img/favcon.avif">

        <script type="text/javascript">
            function showAlert() {
                // Pega os parâmetros da URL
                var urlParams = new URLSearchParams(window.location.search);
                var message = urlParams.get('message');
                var tipo = urlParams.get('tipoMensagem');

                if (message) {
                    // Exibe o alert com a mensagem
                    if (tipo === 'sucesso') {
                        alert("Sucesso: " + message);
                    } else if (tipo === 'erro') {
                        alert("Erro: " + message);
                    }
                }
            }
        </script>

    </head>

    <body onload="showAlert()">

        <button onclick="topFunction()" id="myBtn" title="Go to top"> ↑ </button>

        <header id="header" role="banner">

            <nav class="navbar navbar-expand-lg navbar-light" aria-label="Navegação principal">

                <div class="container">

                    <img src="../Assets/img/logo_header.png" display=flex; width="35px" ; height="35px" gap="1rem" ;>

                    <div class="display-left">

                        <a class="navbar-brand" href="Home.html">Barbearia</span></a>

                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">

                        <span class="navbar-toggler-icon"></span>

                    </button>

                    <div class="collapse navbar-collapse" id="navbarNav">

                        <div class="display-right">

                            <ul class="navbar-nav">

                                <li class="nav-item">

                                    <a href="#quem-somos" class="nav-link">

                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
                                          </svg> Quem Somos

                                    </a>

                                </li>

                                <li class="nav-item">

                                    <a href="agendamento.jsp" class="nav-link">

                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
                                          </svg> Agende um Horário

                                    </a>

                                </li>

                                <% 
                                HttpSession sessao = request.getSession(false); 
                                if (sessao != null && sessao.getAttribute("nomeUsuario") != null) {
                                %>
                                
                                <li class="nav-item">
                                    <a href="conta.jsp" class="nav-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                                      </svg> Conta</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a href="../config/logout.jsp" class="nav-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
                                        <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
                                      </svg> Sair</a>
                                </li>
                                <% } else { %>
                                <li class="nav-item">
                                    <a href="cadastro.html" class="nav-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                                        <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                                        <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5"/>
                                      </svg> Cadastre-se</a>
                                </li>

                                <li class="nav-item">
                                    <a href="login.html" class="nav-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
                                        <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                                      </svg> login</a>

                                <% } %>

                            </ul>

                        </div>

                    </div>

            </nav>

        </header>

        <main id="main-content" role="main">
            <div id="carrossel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000"
                aria-label="Galeria de imagens da Barbearia">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../Assets/img/barbeiro cortando barba.jpg" class="d-block w-100"
                            alt="Barbeiro cortando barba" loading="lazy">
                        <div class="carousel-caption d-none d-md-block">

                            <div class="logo_carousel"><img src="../Assets/img/logo_header.png"></div>
                            <a href="agendamento.jsp" class="btn btn-primary">Agendar Agora</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../Assets/img/salao babearia.jpg" class="d-block w-100" alt="Salão Barbearia"
                            loading="lazy">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="logo_carousel"><img src="../Assets/img/logo_header.png"></div>
                            <a href="agendamento.jsp" class="btn btn-primary"> Agendar Agora</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../Assets/img/pentes de maquinhinha.jpg" class="d-block w-100"
                            alt="Pentes de Maquininha" loading="lazy">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="logo_carousel"><img src="../Assets/img/logo_header.png"></div>
                            <a href="agendamento.jsp" class="btn btn-primary">Agendar Agora</a>
                        </div>
                    </div>
                </div>
            </div>

            <div>
            </div>
            
            </main>
            
            <section id="quem-somos">
            
            <div class="about">
            
            <h3>Quem Somos</h3>
            
            </div>
            
            </section>
            
            <div class="about-text">
            
            <img class="about-img" src="../Assets/img/Logo.png">
            
            <div class="about-text-left">

                <%

                if (sessao != null) {
                
                    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");
                    String emailUsuario = (String) sessao.getAttribute("emailUsuario");


                if (nomeUsuario != null && emailUsuario != null) {
                
                %>
                
                <p>Bem-vindo, <strong><%= nomeUsuario %></strong>!</p>

                <%
                } else {
                %>
                <p></p>
                <%
                }
                } else {
                %>
                <p></p>   
                <%}%>   
    
            
                A Beauty Life Hair é um salão de beleza, fundado em 2015, com o propósito de oferecer uma experiência
                completa de cuidado capilar e bem-estar. Desde o início, nossa visão foi criar um espaço onde cada
                pessoa
                pudesse se sentir acolhida e valorizada, com serviços que vão além da estética, proporcionando um
                momento de
                autoconfiança e renovação. Nossa missão é mais do que apenas transformar a aparência; queremos que cada
                cliente se sinta verdadeiramente conectado com sua essência e seguro de sua beleza única. Acreditamos
                que a
                beleza é uma expressão de quem somos, e que ela deve refletir como nos sentimos e o impacto que queremos
                transmitir ao mundo.

                Com uma equipe de profissionais altamente qualificados e apaixonados, nossa essência é cuidar de cada
                detalhe. Nos dedicamos a entender a individualidade de cada cliente, para garantir um atendimento
                personalizado e atento, que valorize suas necessidades e preferências. Para nós, cada cliente é especial
                e
                merece uma experiência que o inspire e o deixe confiante em seu visual. Essa filosofia nos leva a
                investir
                continuamente na qualificação da equipe, que está sempre atualizada com as tendências e técnicas mais
                inovadoras do mundo da beleza.

            </div>

        </div>

        <div class="about-text-down">

            Além de técnica, nossos profissionais trazem para cada serviço o cuidado e a sensibilidade que fazem toda a
            diferença no resultado final. Acreditamos que o atendimento vai muito além da habilidade: envolve empatia e
            atenção ao que cada cliente deseja expressar com seu visual. Por isso, buscamos harmonizar estilo e saúde
            capilar, respeitando a integridade dos fios e preservando sua vitalidade, usando apenas produtos de
            altíssima
            qualidade e de marcas reconhecidas por seu compromisso com o bem-estar capilar.

            Para a Beauty Life Hair, o cabelo é mais do que um aspecto físico; ele é uma extensão da personalidade e
            reflete
            as emoções e experiências de quem o carrega. Por isso, dedicamos tempo e esforço para entender a
            individualidade
            de cada pessoa que nos visita. Nosso trabalho não é apenas criar estilos, mas traduzir identidades, ajudando
            nossos clientes a se sentirem representados e confortáveis consigo mesmos. Assim, cada corte, coloração ou
            tratamento se torna uma verdadeira expressão da identidade e do estilo único de cada cliente, destacando o
            que
            ele tem de mais autêntico.

        </div>



        <div class="about">

            <h3>Serviços</h3>

        </div>

        <div class="servicos">

            <div class="servico">
                <span class="nome">Corte</span>
                <a href="agendamento.jsp" class="preco">R$ 30,00</a>
            </div>

            <div class="servico">
                <span class="nome">Barba</span>
                <a href="agendamento.jsp" class="preco">R$ 15,00</a>
            </div>

            <div class="servico">
                <span class="nome">Hidratação</span>
                <a href="agendamento.jsp" class="preco">R$ 60,00</a>
            </div>

            <div class="servico">
                <span class="nome">Nutrição</span>
                <a href="agendamento.jsp" class="preco">R$ 100,00</a>
            </div>

            <div class="servico">
                <span class="nome">Reconstrução</span>
                <a href="agendamento.jsp" class="preco">R$ 150,00</a>
            </div>

            <div class="servico">
                <span class="nome">Descoloração</span>
                <a href="agendamento.jsp" class="preco">R$ 50,00</a>
            </div>

            <div class="servico">
                <span class="nome">Coloração</span>
                <a href="agendamento.jsp" class="preco">R$ 30,00</a>
            </div>

            <div class="servico">
                <span class="nome">Chapinha</span>
                <a href="agendamento.jsp" class="preco">R$ 40,00</a>
            </div>

        </div>

        <footer class="footer">

            <a>&copy; 2024 Barbearia. Todos os direitos reservados.</a>

            <div class="footer-links">

                <a href="#">Whatssap</a> |
                <a href="#">Facebook</a> |
                <a href="#">Instagram</a>

            </div>

        </footer>

        <!-- Scripts with Integrity -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-..." crossorigin="anonymous"></script>

        <!-- Custom Scripts -->
        <script src="../Assets/js/main.js" defer></script>
        <script src="../Assets/js/home.js"></script>
    </body>

    </html>