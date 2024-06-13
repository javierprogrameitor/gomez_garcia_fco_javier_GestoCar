<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:directive.include file="../INC/metas.inc" />
<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
              integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
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
                src: url('${pageContext.request.contextPath}/IMG/bobby_jones/BobbyJones/BobbyJonesSoft.otf') format('opentype');
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
        <title>Acciones Admin</title>
    </head>
<body class="bg-custom-green font-bobby-jones h-auto">
    <c:import url="../INC/nav.jsp" />
    <div class="flex flex-col items-center justify-center p-4 mt-18 mb-10">
        <div class="overflow-x-auto w-full max-w-7xl">
            <h1 class="flex items-center justify-center text-shadow-black text-green-700 text-4xl font-black m-4">ADMINISTRADOR </h1>
            <!-- Mostrar mensaje de éxito o error -->
            <c:if test="${not empty mensaje}">
                <div class="bg-green-200 border-l-4 border-green-500 text-green-700 p-4" role="alert">
                    <p class="font-bold">Mensaje:</p>
                    <p>${mensaje}</p>
                </div>
            </c:if>
            <h3 class="flex items-center justify-center text-shadow-black text-green-700 text-2xl font-black m-2">Todos los Usuarios:</h3>

            <form action="administradorController" method="post">
                <table class="table-auto bg-custom-gray w-full text-left border-collapse">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="px-4 py-2">Elige</th>
                            <th class="px-4 py-2">Nombre</th>
                            <th class="px-4 py-2">Apellidos</th>
                            <th class="px-4 py-2">Email</th>
                            <th class="px-4 py-2">PassWord</th>
                            <th class="px-4 py-2">Dni</th>
                            <th class="px-4 py-2">Campobaja</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${usuario}" var="usuario">
                            <tr class="bg-white border-b">
                                <td class="bg-green-700 hover:bg-green-600 text-center"><input type="radio" name="registroUsuario" value="${usuario.idUsuario}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.nombre}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.apellidos}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.email}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.password}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.dni}" /></td>
                                <td class="px-4 py-2"><c:out value="${usuario.campoBaja}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <button type="submit" name="boton" value="eliminarUsuario" class="bg-green-700 hover:bg-green-600 text-shadow-black font-bold py-2 px-4 rounded focus:outline-none m-4">
                    ELIMINAR USUARIO
                </button>

                <h3 class="flex items-center justify-center text-shadow-black text-green-700 text-2xl font-black m-2">Todos los Vehículos:</h3>

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
                                <td class="bg-green-700 hover:bg-green-600 text-center"><input type="radio" name="registroVehiculo" value="${vehiculo.idVehiculo}" /></td>
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

                <button type="submit" name="boton" value="eliminarVehiculo" class="bg-green-700 hover:bg-green-600 text-shadow-black font-bold py-2 px-4 rounded focus:outline-none m-4">
                    ELIMINAR VEHÍCULO
                </button>
            </form>

            <form action="<c:out value='${contextPath}' />/Return" method="post">
                <button type="submit" class="bg-green-700 hover:bg-green-600 text-shadow-black font-bold py-2 px-4 rounded focus:outline-none mt-4">
                    SALIR
                </button>
            </form>
        </div>
    </div>
    <c:import url="/INC/footer.jsp" />
    <div>
        <hr class="w-full border-t-1 border-white">
    </div>
</body>
</html>
