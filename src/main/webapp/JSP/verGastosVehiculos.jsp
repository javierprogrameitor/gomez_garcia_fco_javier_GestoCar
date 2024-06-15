<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            function closeModal() {
                document.getElementById('modal').style.display = 'none';
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
        <title>Visualizar Gastos</title>
    </head>
    <body class="bg-custom-green font-bobby-jones min-h-screen">
        <c:import url="../INC/nav.jsp"/> 
        <!-- Mostrar mensaje de éxito o error -->
        <c:if test="${llevasID}">
            <div id="modal" class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
                    <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                    <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                        <div class="bg-red-600 p-4">
                            <h3 class="text-lg leading-6 font-medium text-white" id="modal-title">
                               Debes de seleccionar un Vehiculo
                            </h3>
                        </div>
                        <div class="bg-white px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                            <button type="button" onclick="window.location.href = '${contextPath}/JSP/usuario.jsp'" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-green-600 text-base font-medium text-white hover:bg-green-700 focus:outline-none sm:ml-3 sm:w-auto sm:text-sm">
                                Volver
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <form action="visualizarGastoController" method="post">
            <h3 class="flex items-center justify-center text-shadow-black text-green-700 text-2xl font-black m-2">Seleccione un vehiculo para ver sus gastos: </h3>
            <div class="container mx-auto px-4 py-8">
                <table class="table-auto bg-custom-gray w-full text-left border-collapse">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="px-4 py-2">Elige</th>
                            <th class="px-4 py-2">Marca</th>
                            <th class="px-4 py-2">Modelo</th>
                            <th class="px-4 py-2">Motor</th>
                            <th class="px-4 py-2">Matrícula</th>
                            <th class="px-4 py-2">Cilindrada</th>
                            <th class="px-4 py-2">Caballos</th>
                            <th class="px-4 py-2">Color</th>
                            <th class="px-4 py-2">Fecha Compra</th>
                            <th class="px-4 py-2">Fecha Venta</th>
                            <th class="px-4 py-2">Precio Compra</th>
                            <th class="px-4 py-2">Precio Venta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${vehiculo}" var="vehiculo">
                            <tr class="bg-white border-b">
                                <td class="bg-green-700 hover:bg-green-600 text-center">
                                    <input type="radio" name="registroVehiculo" value="${vehiculo.idVehiculo}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.marca}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.modelo}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.motor}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.matricula}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.cilindrada}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.caballos}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.color}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.fechaCompra}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.fechaVenta}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.preciocompra}" /></td>
                                <td class="px-4 py-2"><c:out value="${vehiculo.precioventa}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="flex justify-center mt-4">
                <button type="submit"  value="visualizarGastoVehiculo" name="boton"  class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Ver Gastos</button>
            </div>
        </form>


        <c:import url="/INC/footer.jsp"/> 
    </body>
</html>