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
                src: url('IMG/bobby_jones/BobbyJones/BobbyJonesSoft.otf') format('opentype');
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
        <title>Login</title>
    </head>

    <body class="bg-custom-green">
        <jsp:directive.include file="/INC/nav.inc"/>
        <div class="flex flex-grow flex-col items-center justify-center p-4">
            <div class="bg-custom-gray rounded-lg p-6 md:p-8 mb-6 form-border text-shadow-black w-full max-w-md">
                <form action="<c:out value="${contextPath}" />/LoginController" method="post">
                    <!----------------------------------------------------->
                    <div>
                        <hr class="w-full border-t-1 border-white mb-4">
                    </div>
                    <!----Nombre------------------------------------------------->
                    <label class="block text-green-600 text-lg font-bold mb-2">Nombre:</label>
                    <input type="text" id="nombre" name="usuario" value="<c:if test="${not empty datosFormulario['nombre']}"><c:out value="${datosFormulario['nombre']}" /></c:if>"
                           class="border border-green-600 rounded w-full py-2 px-3 leading-tight focus:outline-none text-shadow-black "
                           required />
                        <!----Apellidos------------------------------------------------->
                        <label for="apellidos" class="block text-green-600 text-lg font-bold mb-2 mt-4">Apellidos:</label>
                        <input type="text" id="apellidos" name="usuario"  value="<c:if test="${not empty datosFormulario['apellidos']}"><c:out value="${datosFormulario['apellidos']}" /></c:if>"
                               class="border border-green-600 rounded w-full py-2 px-3 leading-tight focus:outline-none text-shadow-black"
                               required />
                        <!----Email------------------------------------------------->
                        <label for="email" class="block text-green-600 text-lg font-bold mb-2 mt-4">Email:</label>
                        <input type="email" id="email" name="usuario" value="<c:if test="${not empty datosFormulario['email']}"><c:out value="${datosFormulario['email']}" /></c:if>"
                               class="border border-green-600 rounded w-full py-2 px-3 leading-tight focus:outline-none text-shadow-black"
                               required />
                        <!----Password------------------------------------------------->
                        <label for="password" class="block text-green-600 text-lg font-bold mb-2 mt-4">Password :</label>
                        <input type="password" id="password" name="usuario"  value="<c:if test="${not empty datosFormulario['password']}"><c:out value="${datosFormulario['password']}" /></c:if>"
                               class="border border-green-600 rounded w-full py-2 px-3  leading-tight focus:outline-none text-shadow-black"
                               required />
                        <!----DNI------------------------------------------------->
                        <label for="dni" class="block text-green-600 text-lg font-bold mb-2 mt-4">DNI :</label>
                        <input type="text" id="dni" name="usuario"  value="<c:if test="${not empty datosFormulario['dni']}"><c:out value="${datosFormulario['dni']}" /></c:if>"
                               class="border border-green-600 rounded w-full py-2 px-3 leading-tight focus:outline-none text-shadow-black"/>
                        <!----Boton------------------------------------------------->
                        <div class="flex justify-center text-shadow-black mt-4">
                            <button type="submit" id="crearCuenta"
                                    class="bg-green-700 hover:bg-green-600 text-shadow-black font-bold py-2 px-4 rounded focus:outline-none mt-4 text-shadow-black">CREAR
                                CUENTA</button>
                        </div>
                        <!----------------------------------------------------->
                        <div>
                            <hr class="w-full border-t-1 border-white mt-4">
                        </div>
                    </form>
                </div>
            </div>
        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>