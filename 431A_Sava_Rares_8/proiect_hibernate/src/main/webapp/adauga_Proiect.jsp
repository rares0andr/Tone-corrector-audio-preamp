<%-- 
    Document   : adauga_Consultatie
    Created on : Nov 22, 2016, 6:19:27 PM
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
            <div id="add">
                <h1>Adauga un nou proiect</h1>
                <form action="ProiectController" method="GET">
                    <table>
                        <tr>
                            <td>Student:</td>
                            <td>
                                <select name="idstudent">
                                    <c:forEach items="${listaStudenti}" var="studenti">
                                        <option value="${studenti.idstudent}">${studenti.idstudent}, ${studenti.nume}, ${studenti.initialaTata}, ${studenti.prenume}, ${studenti.dataNasterii}, ${studenti.cnp}, ${studenti.adresa}, ${studenti.facultate}, ${studenti.cicluStudii}, ${studenti.anStudii}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Curs:</td>
                            <td>
                                <select name="idcurs">
                                    <c:forEach items="${listaCursuri}" var="cursuri">
                                        <option value="${cursuri.idcurs}">${cursuri.idcurs}, ${cursuri.denumire}, ${cursuri.numeProfesor}, ${cursuri.sala}, ${cursuri.metodaNotare}, ${cursuri.structura}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Data predare:</td>
                            <td><input type="text" name="data_predare"></td>
                        </tr>
                        <tr>
                            <td>Denumire:</td>
                            <td><input type="text" name="denumire"></td>
                        </tr>
                        <tr>
                            <td>Sesiune examinare:</td>
                            <td><input type="text" name="sesiune_examinare"></td>
                        </tr>
                        <tr>
                            <td>Descriere:</td>
                            <td><input type="text" name="descriere"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="adaugaProiect" value="Adauga"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <form action="ProiectController" method="POST">
                <input type="submit" name="afiseazaProiect" value="Afiseaza">
            </form>
            <br>
            <a href="index.html"><b>Home</b></a>
        </div>
    </body>
</html>
