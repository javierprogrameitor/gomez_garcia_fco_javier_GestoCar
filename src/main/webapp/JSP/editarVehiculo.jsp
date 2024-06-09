<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:directive.include file="../INC/metas.inc"/>
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
                        fontFamily: {
                            'bobby-jones': ['Bobby-Jones', 'sans-serif']
                        }
                    },
                }
            }
        </script>
        <style>
            @font-face {
                font-family: 'Bobby-Jones';
                src: url('${contextPath}/IMG/bobby_jones/BobbyJones/BobbyJonesSoft.otf') format('opentype');
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
        <title>Editar Vehiculo</title>
    </head>
    <body class="bg-custom-green font-bobby-jones h-auto">
        <c:import url="../INC/nav.jsp"/> 
        <div class="m-3">
            <div class="max-w-lg mx-auto bg-white p-8 rounded shadow">
                <h1 class="text-2xl font-bold mb-6 text-center">Editar Vehículo</h1>
                <form action="<c:out value='${contextPath}' />/modificarVehiculoController" method="post">
                    <!-- Id-->
                    <input type="hidden" id="usuarioId" name="usuarioId" value="${sessionScope.usuarioId}">
                    <input type="hidden" id="idVehiculo" name="idVehiculo" value="${sessionScope.idVehiculo}">
                    <!--Marca-->
                    <div class="mb-4">
                        <label for="marca" class="block text-gray-700 font-bold mb-2">Marca:</label>
                        <input type="text" id="marca" name="marca" value="${vehiculo.marca}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!--Modelo-->
                    <div class="mb-4">
                        <label for="modelo" class="block text-gray-700 font-bold mb-2">Modelo:</label>
                        <input type="text" id="modelo" name="modelo" value="${vehiculo.modelo}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- Motor-->            
                    <div class="mb-4">                   
                        <select id="motor" name="motor" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="GASOLINA" <c:if test="${vehiculo.motor == 'GASOLINA'}">selected</c:if>>Gasolina</option>
                            <option value="GASOIL" <c:if test="${vehiculo.motor == 'GASOIL'}">selected</c:if>>Gasoil</option>
                            <option value="ELECTRICO" <c:if test="${vehiculo.motor == 'ELECTRICO'}">selected</c:if>>Eléctrico</option>
                            </select>
                        </div>
                        <!-- Matricula-->
                        <div class="mb-4">
                            <label for="matricula" class="block text-gray-700 font-bold mb-2">Matricula:</label>
                            <input type="text" id="matricula" name="matricula" value="${vehiculo.matricula}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- Cilindrada-->
                    <div class="mb-4">
                        <label for="cilindrada" class="block text-gray-700 font-bold mb-2">Cilindrada:</label>
                        <input type="text" id="cilindrada" name="cilindrada" value="${vehiculo.cilindrada}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- Caballos-->
                    <div class="mb-4">
                        <label for="caballos" class="block text-gray-700 font-bold mb-2">Caballos:</label>
                        <input type="text" id="caballos" name="caballos" value="${vehiculo.caballos}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- Color-->
                    <div class="mb-4">
                        <label for="color" class="block text-gray-700 font-bold mb-2">Color:</label>
                        <input type="text" id="color" name="color" value="${vehiculo.color}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- fechaCompra-->
                    <div class="mb-4">
                        <label for="fechacompra" class="block text-gray-700 font-bold mb-2">Fecha Compra:</label>
                        <input type="date" id="fachaCompra" name="fechaCompra" value="${vehiculo.fechaCompra}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- fechaVenta-->
                    <div class="mb-4">
                        <label for="fechaventa" class="block text-gray-700 font-bold mb-2">Fecha Venta:</label>
                        <input type="date" id="fechaVenta" name="fechaVenta" value="${vehiculo.fechaVenta}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- preciocompra-->
                    <div class="mb-4">
                        <label for="preciocompra" class="block text-gray-700 font-bold mb-2">Precio Compra:</label>
                        <input type="text" id="preciocompra" name="preciocompra" value="${vehiculo.preciocompra}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- precioventa-->
                    <div class="mb-4">
                        <label for="precioventa" class="block text-gray-700 font-bold mb-2">Precio Venta:</label>
                        <input type="text" id="precioventa" name="precioventa" value="${vehiculo.precioventa}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
                    <!-- ... -->
                    <div class="flex items-center justify-between">
                        <button type="submit" name="boton" value="guardar"
                                class="bg-green-700 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                            Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <c:import url="/INC/footer.jsp"/> 
        <div>
            <hr class="w-full border-t-1 border-white">
        </div>
    </body>
</html>
