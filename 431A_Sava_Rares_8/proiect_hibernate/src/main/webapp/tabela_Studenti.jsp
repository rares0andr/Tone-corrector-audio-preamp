<%-- 
    Document   : tabela_Studenti
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Studenti</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeStudent").hide();
                $("#modificaStudent").hide();

                $("#update").click(function () {
                    $("#modificaStudent").show();
                    $("#stergeStudent").hide();
                });
                $("#delete").click(function () {
                    $("#stergeStudent").show();
                    $("#modificaStudent").hide();
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Tabela Studenti:</h1>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th class="col-id">IdStudent</th>
                            <th class="col-name">Nume</th>
                            <th>Initiala tatalui</th>
                            <th class="col-name">Prenume</th>
                            <th>Data nasterii</th>
                            <th>Cnp</th>
                            <th class="col-wide">Adresa</th>
                            <th>Facultate</th>
                            <th>Ciclu studii</th>
                            <th>An studii</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="studenti" items="${listaStudenti}">
                            <tr>
                                <td class="col-id">${studenti.idstudent}</td>
                                <td class="col-name">${studenti.nume}</td>
                                <td>${studenti.initialaTata}</td>
                                <td class="col-name">${studenti.prenume}</td>
                                <td>${studenti.dataNasterii}</td>
                                <td>${studenti.cnp}</td>
                                <td class="col-wide">${studenti.adresa}</td>
                                <td>${studenti.facultate}</td>
                                <td>${studenti.cicluStudii}</td>
                                <td>${studenti.anStudii}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <form action="StudentiController" method="POST">
                <div class="button-container">
                    <p>
                        Modifica: <input type="checkbox" id="update"> 
                        Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                                document.getElementById('initialaTata').disabled = this.checked;
                                document.getElementById('prenume').disabled = this.checked;
                                document.getElementById('dataNasterii').disabled = this.checked;
                                document.getElementById('cnp').disabled = this.checked;
                                document.getElementById('adresa').disabled = this.checked;
                                document.getElementById('facultate').disabled = this.checked;
                                document.getElementById('cicluStudii').disabled = this.checked;
                                document.getElementById('anStudii').disabled = this.checked;">
                    </p>
                    <p>
                        <select name="idstudent">
                            <c:forEach items="${listaStudenti}" var="studenti">
                                <option value="${studenti.idstudent}">${studenti.idstudent}, ${studenti.nume}, ${studenti.initialaTata}, ${studenti.prenume}, ${studenti.dataNasterii}, ${studenti.cnp}, ${studenti.adresa}, ${studenti.facultate}, ${studenti.cicluStudii}, ${studenti.anStudii}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        Modifica Nume: <input id="nume" type="text" name="nume">
                        Modifica initiala tatalui: <input id="initialaTata" type="text" name="initiala_tata">
                        Modifica Prenume: <input id="prenume" type="text" name="prenume">
                        Modifica data nasterii: <input id="dataNasterii" type="text" name="data_nasterii">
                        Modifica CNP: <input id="cnp" type="text" name="cnp">
                        Modifica Adresa: <input id="adresa" type="text" name="adresa">
                        Modifica facultatea: <input id="facultate" type="text" name="facultate">
                        Modifica ciclul de studii: <input id="cicluStudii" type="text" name="ciclu_studii">
                        Modifica anul de studiu: <input id="anStudii" type="text" name="an_studii">
                    </p>
                    <div class="button-container-row">
                        <button type="submit" id="modificaStudent" name="modificaStudent">Modifica</button>
                        <button type="submit" id="stergeStudent" name="stergeStudent">Sterge</button>
                    </div>
                </div>
            </form>
            <p align="center">
                <a href="index.html"><b>Home</b></a>
            </p>
        </div>
    </body>
</html>
