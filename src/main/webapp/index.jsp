<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
              integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            'custom-green': '#A6B6A0',
                            'custom-gray': '#C4C4C4',
                        },
                    },
                }
            }
        </script>
        <style>
            @font-face {
                font-family: 'Bobby-Jones';
                src: url('IMGCRS/bobby_jones/BobbyJones/BobbyJonesSoft.otf') format('opentype');
            }

            .text-shadow-black {
                text-shadow: 1px 1px 1px rgba(1, 1, 1, 1);
            }

            .text-shadow-white {
                text-shadow: 1px 1px 1px rgb(253, 253, 252);
            }

            .font-bobby-jones {
                font-family: 'Bobby-Jones', sans-serif;
            }
        </style>
        <title>Pantalla Inicial</title>
    </head>

    <body class="bg-custom-green">
        <div>
            <hr class="w-full border-t-1 border-white">
        </div>
        <nav class="bg-custom-green flex flex-wrap justify-evenly p-6">
            <div class="flex items-center">
                <img src="IMG/logoConcesionario.png" alt="Logo" class="h-20 w-20">
            </div>
            <div class="text-center">
                <span class="text-shadow-black text-green-600 text-3xl md:text-5xl font-bobby-jones">GESTOCAR, Gestiona tus vehiculos de forma cómoda
                </span>
            </div>
        </nav>
        <div>
            <hr class="w-full border-t-1 border-white">
        </div>

        <div class="text-center m-4">
            <span class="text-shadow-black text-green-600 text-xl md:text-3xl font-bobby-jones">Iniciar Sesion como:
            </span>
        </div>
        <div class="flex flex-wrap justify-evenly m-2">
            <form action="<c:out value="${contextPath}" />/FrontController" method="post">
                <div class="text-sm breadcrumbs">
                    <ul>
                        <li><a>                          
                                <button id="invitado" name="boton" value="invitado" class="text-gray-100 text-lg md:text-2xl font-black text-shadow-black border-solid">INVITADO</button>                           
                            </a></li>
                        <li><a>
                                <button id="administrador" name="boton" value="administrador" class="text-gray-100 text-lg md:text-2xl font-black text-shadow-black border-solid">ADMINISTRADOR</button>
                            </a></li>
                        <li><a>
                                <button id="logeado" name="boton" value="logeado" class="text-gray-100  text-lg md:text-2xl font-black text-shadow-black border-solid">USUARIO LOGEADO</button>
                            </a></li>
                    </ul>
                </div>
            </form>
        </div>

        <div>
            <hr class="w-full border-t-1 border-white m-2">
        </div>
        <div class="carousel w-full max-h-96">
            <!-- Carousel items -->
            <div id="slide1" class="carousel-item relative w-full">
                <img src="IMG/CapturaLogo.png" class="w-full" />
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                    <a href="#slide4" class="btn btn-circle">❮</a>
                    <a href="#slide2" class="btn btn-circle">❯</a>
                </div>
            </div>
            <div id="slide2" class="carousel-item relative w-full">
                <img src="IMG/concesionario3.jpg" class="w-full" />
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                    <a href="#slide1" class="btn btn-circle">❮</a>
                    <a href="#slide3" class="btn btn-circle">❯</a>
                </div>
            </div>
            <div id="slide3" class="carousel-item relative w-full">
                <img src="IMG/concesionario4.jpg" class="w-full" />
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                    <a href="#slide2" class="btn btn-circle">❮</a>
                    <a href="#slide4" class="btn btn-circle">❯</a>
                </div>
            </div>
            <div id="slide4" class="carousel-item relative w-full">
                <img src="IMG/concesionario2.jpg" class="w-full" />
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                    <a href="#slide3" class="btn btn-circle">❮</a>
                    <a href="#slide5" class="btn btn-circle">❯</a>
                </div>
            </div>
            <div id="slide5" class="carousel-item relative w-full">
                <img src="IMG/concesionario5.jpg" class="w-full" />
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                    <a href="#slide4" class="btn btn-circle">❮</a>
                    <a href="#slide1" class="btn btn-circle">❯</a>
                </div>
            </div>
        </div>


        <div>
            <hr class="w-full border-t-1 border-white">
        </div>


        <div>
            <hr class="w-full border-t-1 border-white">
        </div>
        <footer class="text-green-600 flex flex-wrap justify-between px-8 py-4 bg-custom-green text-shadow-black m-4">
            <div class="flex items-center mb-2 md:mb-0">
                <i class="fa fa-phone mr-2 text-4xl shadow-custom"></i><a class="text-xl font-bold"> Contacto 662 789
                    611</a>
            </div>
            <div class="flex items-center space-x-4">
                <span class="text-xl font-bold mr-2">Redes Sociales</span>
                <a class="text-green-600 text-4xl"><i class="fa-brands fa-facebook"></i></a>
                <a class="text-green-600 text-4xl"><i class="fa-brands fa-square-instagram"></i></a>
                <a class="text-green-600 text-4xl"><i class="fa-brands fa-linkedin"></i></a>
            </div>
        </footer>

        <div>
            <hr class="w-full border-t-1 border-white m-2">
        </div>
    </body>
</html>
