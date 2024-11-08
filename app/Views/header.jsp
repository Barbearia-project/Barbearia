<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
    <header id="header" role="banner">
        
        <nav class="navbar navbar-expand-lg navbar-light" aria-label="Navegação principal">
            
            <div class="container">
                
                <div class="display-left">

                <a class="navbar-brand" href="Home.html">Barbearia</a>
                
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                        data-bs-target="#navbarNav" 
                        aria-controls="navbarNav" 
                        aria-expanded="false" 
                        aria-label="Alternar navegação">

                    <span class="navbar-toggler-icon"></span>

                </button>
                
                <div class="collapse navbar-collapse" id="navbarNav">

                    <div class="display-right">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="Home.html" class="nav-link" aria-current="page">
                                <i class="bi bi-house" aria-hidden="true"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="sobre.html" class="nav-link">
                                <i class="bi bi-info-circle" aria-hidden="true"></i> Quem Somos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="agendamentos.html" class="nav-link">
                                <i class="bi bi-calendar" aria-hidden="true"></i> Agende um Horário
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="cadastro.html" class="nav-link">
                                <i class="bi bi-person-plus" aria-hidden="true"></i> Cadastre-se
                            </a>
                        </li>
                    </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>