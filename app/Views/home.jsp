<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Barbearia - Página Inicial</title>
    
    <!-- Security Headers -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; img-src 'self' data:;">
    
    <!-- Preload Critical Assets -->
    <link rel="preload" href="../Assets/css/Home.css" as="style">
    <link rel="preload" href="../Assets/img/barbeiro cortando barba.jpg" as="image">
    
    <!-- Stylesheets with Integrity and Crossorigin -->
    <link rel="stylesheet" href="../Assets/css/Home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    
    <!-- Bootstrap Icons with Integrity -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
        integrity="sha512-..." crossorigin="anonymous">
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="../Assets/img/favcon.avif">
</head>

<body>
    


    <main id="main-content" role="main">
        <div id="carrossel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000" aria-label="Galeria de imagens da Barbearia">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Assets/img/barbeiro cortando barba.jpg" class="d-block w-100" alt="Barbeiro cortando barba" loading="lazy">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Título do Slide 1</h5>
                        <p>Descrição do slide 1.</p>
                        <a href="caminho/para/agendamento.html" class="btn btn-primary">Agendar Agora</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../Assets/img/salao babearia.jpg" class="d-block w-100" alt="Salão Barbearia" loading="lazy">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Título do Slide 2</h5>
                        <p>Descrição do slide 2.</p>
                        <a href="caminho/para/agendamento.html" class="btn btn-primary">Agendar Agora</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../Assets/img/pentes de maquinhinha.jpg" class="d-block w-100" alt="Pentes de Maquininha" loading="lazy">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Título do Slide 3</h5>
                        <p>Descrição do slide 3.</p>
                        <a href="caminho/para/agendamento.html" class="btn btn-primary">Agendar Agora</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class="about">

        <h3>Quem Somos</h3>

    </div>

    <div class="about-text">

        <div class="about-text-left">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti hic in vel laboriosam asperiores aliquam, fugit sapiente ipsam. Rem natus magnam delectus consectetur, nemo minima esse maxime totam? Odit, aut?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut iusto libero consectetur officia, dolorum enim odit! Nesciunt error, consectetur nemo ipsa quo repudiandae, fugit iste atque numquam ad rerum dolorem.
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut voluptatum sit mollitia veniam voluptatem nemo? Vero quas laboriosam corporis officia alias labore praesentium. Voluptatibus nisi autem ea deserunt dolore fugit!
        </div>

        <br>
        <br>

        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Soluta aspernatur quam dolorum corporis et explicabo debitis omnis aliquam tempora quaerat magnam sequi tenetur facere ullam vitae, similique obcaecati fuga deserunt!
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam unde eligendi, aliquam, similique quia placeat dolor fugiat amet quis repellendus magnam perspiciatis nostrum ratione veniam consectetur pariatur deserunt nisi. Nesciunt?
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia iste animi accusantium perferendis labore sed eius voluptate perspiciatis nostrum libero totam unde velit maiores neque, pariatur ut aperiam. Molestias, dolor!
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos ea accusantium quod nam nihil! Consequuntur illo impedit quod aut temporibus ipsam enim, minus unde? Libero illo delectus ipsum eum tempora?   

    
    </div>


    <!-- Scripts with Integrity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-..." 
            crossorigin="anonymous"></script>

    <!-- Custom Scripts -->
    <script src="../Assets/js/main.js" defer></script>
</body>
</html>


<%@ include file="footer.jsp" %>