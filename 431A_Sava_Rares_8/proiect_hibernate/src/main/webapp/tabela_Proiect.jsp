<%-- 
    Document   : tabela_Proiect
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page import="DAOImpl.CursuriDaoImpl"%>
<%@page import="DAOImpl.StudentiDaoImpl"%>
<%@page import="pojo.Cursuri"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Studenti"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proiect</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeProiect").hide();
                $("#modificaProiect").hide();

                $("#update").click(function () {
                    $("#modificaProiect").show();
                    $("#stergeProiect").hide();
                });
                $("#delete").click(function () {
                    $("#stergeProiect").show();
                    $("#modificaProiect").hide();
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <%
                StudentiDaoImpl studentDaoImpl = new StudentiDaoImpl();
                CursuriDaoImpl cursDaoImpl = new CursuriDaoImpl();
                List<Studenti> listaStudenti = new ArrayList();
                listaStudenti = studentDaoImpl.afiseazaStudenti();
                List<Cursuri> listaCursuri = new ArrayList();
                listaCursuri = cursDaoImpl.afiseazaCursuri();
                request.setAttribute("listaStudenti", listaStudenti);
                request.setAttribute("listaCursuri", listaCursuri);
            %>
            <h1>Tabela Proiect:</h1>
            <div class="table-responsive-project">
                <table class="table-project">
                    <thead>
                        <tr>
                            <th class="col-id">IdProiect</th>
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
                            <th class="col-id">IdCurs</th>
                            <th class="col-name">Denumire</th>
                            <th class="col-name">Nume profesor</th>
                            <th>Sala</th>
                            <th class="col-wide">Metoda notare</th>
                            <th class="col-wide">Structura</th>
                            <th>Data predare</th>
                            <th class="col-name">Denumire</th>
                            <th>Sesiune examinare</th>
                            <th class="col-wide">Descriere</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="proiect" items="${listaProiect}">
                            <tr>
                                <td class="col-id">${proiect.idproiect}</td>
                                <td class="col-id">${proiect.studenti.idstudent}</td>
                                <td class="col-name">${proiect.studenti.nume}</td>
                                <td>${proiect.studenti.initialaTata}</td>
                                <td class="col-name">${proiect.studenti.prenume}</td>
                                <td>${proiect.studenti.dataNasterii}</td>
                                <td>${proiect.studenti.cnp}</td>
                                <td class="col-wide">${proiect.studenti.adresa}</td>
                                <td>${proiect.studenti.facultate}</td>
                                <td>${proiect.studenti.cicluStudii}</td>
                                <td>${proiect.studenti.anStudii}</td>
                                <td class="col-id">${proiect.cursuri.idcurs}</td>
                                <td class="col-name">${proiect.cursuri.denumire}</td>
                                <td class="col-name">${proiect.cursuri.numeProfesor}</td>
                                <td>${proiect.cursuri.sala}</td>
                                <td class="col-wide">${proiect.cursuri.metodaNotare}</td>
                                <td class="col-wide">${proiect.cursuri.structura}</td>
                                <td>${proiect.dataPredare}</td>
                                <td class="col-name">${proiect.denumire}</td>
                                <td>${proiect.sesiuneExaminare}</td>
                                <td class="col-wide">${proiect.descriere}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <form action="ProiectController" method="POST">
                <div class="button-container">
                    <p>
                        Modifica: <input type="checkbox" id="update"> 
                        Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idstudent').disabled = this.checked;
                                document.getElementById('idcurs').disabled = this.checked;
                                document.getElementById('data_predare').disabled = this.checked;
                                document.getElementById('denumire').disabled = this.checked;
                                document.getElementById('sesiune_examinare').disabled = this.checked;
                                document.getElementById('descriere').disabled = this.checked;">
                    </p>
                    <p>
                        <select name="idproiect">
                            <c:forEach items="${listaProiect}" var="proiect">
                                <option value="${proiect.idproiect}">${proiect.idproiect}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        <select name="idstudent">
                            <c:forEach items="${listaStudenti}" var="studenti">
                                <option value="${studenti.idstudent}">${studenti.idstudent}, ${studenti.nume}, ${studenti.initialaTata}, ${studenti.prenume}, ${studenti.dataNasterii}, ${studenti.cnp}, ${studenti.adresa}, ${studenti.facultate}, ${studenti.cicluStudii}, ${studenti.anStudii}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        <select name="idcurs">
                            <c:forEach items="${listaCursuri}" var="cursuri">
                                <option value="${cursuri.idcurs}">${cursuri.idcurs}, ${cursuri.denumire}, ${cursuri.numeProfesor}, ${cursuri.sala}, ${cursuri.metodaNotare}, ${cursuri.structura}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        Modifica data predarii: <input id="data_predare" type="text" name="data_predare">
                        Modifica denumire: <input id="denumire" type="text" name="denumire">
                        Modifica sesiunea de examinare: <input id="sesiune_examinare" type="text" name="sesiune_examinare">
                        Modifica descrierea: <input id="descriere" type="text" name="descriere">
                    </p>
                    <div class="button-container-row">
                        <button type="submit" id="modificaProiect" name="modificaProiect">Modifica</button>
                        <button type="submit" id="stergeProiect" name="stergeProiect">Sterge</button>
                    </div>
                </div>
            </form>
            <p align="center">
                <a href="index.html"><b>Home</b></a>
            </p>
        </div>
    </body>
</html>
