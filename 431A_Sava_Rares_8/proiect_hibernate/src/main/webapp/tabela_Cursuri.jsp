<%-- 
    Document   : tabela_Medici
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursuri</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeCurs").hide();
                $("#modificaCurs").hide();

                $("#update").click(function () {
                    $("#modificaCurs").show();
                    $("#stergeCurs").hide();
                });
                $("#delete").click(function () {
                    $("#stergeCurs").show();
                    $("#modificaCurs").hide();
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Tabela Cursuri:</h1>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th class="col-id">IdCurs</th>
                            <th class="col-name">Denumire</th>
                            <th class="col-name">Nume profesor</th>
                            <th>Sala</th>
                            <th class="col-wide">Metoda notare</th>
                            <th class="col-wide">Structura</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cursuri" items="${listaCursuri}">
                            <tr>
                                <td class="col-id">${cursuri.idcurs}</td>
                                <td class="col-name">${cursuri.denumire}</td>
                                <td class="col-name">${cursuri.numeProfesor}</td>
                                <td>${cursuri.sala}</td>
                                <td class="col-wide">${cursuri.metodaNotare}</td>
                                <td class="col-wide">${cursuri.structura}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <form action="CursuriController" method="POST">
                <div class="button-container">
                    <p>
                        Modifica: <input type="checkbox" id="update"> 
                        Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('denumire').disabled = this.checked;
                                document.getElementById('nume_profesor').disabled = this.checked;
                                document.getElementById('sala').disabled = this.checked;
                                document.getElementById('metoda_notare').disabled = this.checked;
                                document.getElementById('structura').disabled = this.checked;">
                    </p>
                    <p>
                        <select name="idcurs">
                            <c:forEach items="${listaCursuri}" var="cursuri">
                                <option value="${cursuri.idcurs}">${cursuri.idcurs}, ${cursuri.denumire}, ${cursuri.numeProfesor}, ${cursuri.sala}, ${cursuri.metodaNotare}, ${cursuri.structura}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        Modifica denumire: <input id="denumire" type="text" name="denumire">
                        Modifica nume profesor: <input id="nume_profesor" type="text" name="nume_profesor">
                        Modifica sala: <input id="sala" type="text" name="sala">
                        Modifica metoda notare: <input id="metoda_notare" type="text" name="metoda_notare">
                        Modifica structura: <input id="structura" type="text" name="structura">
                    </p>
                    <div class="button-container-row">
                        <button type="submit" id="modificaCurs" name="modificaCurs">Modifica</button>
                        <button type="submit" id="stergeCurs" name="stergeCurs">Sterge</button>
                    </div>
                </div>
            </form>
            <p align="center">
                <a href="index.html"><b>Home</b></a>
            </p>
        </div>
    </body>
</html>
