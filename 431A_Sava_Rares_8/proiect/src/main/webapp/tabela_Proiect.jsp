<%-- 
    Document   : tabela_Consultatie
    Created on : Nov 14, 2016, 1:03:20 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Proiect</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <div class="container">
        <h1 align="center"> Tabela Proiect:</h1>
        <br/>
        <p align="center"><a href="nou_Proiect.jsp"><b>Adauga un nou proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_Proiect.jsp" method="post">
            <div class="table-responsive-project">
            <table border="1" class="table-project">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Idproiect:</b></td>
                    <td><b>IdStudent:</b></td>
                    <td><b>Nume student:</b></td>
                    <td><b>Initiala tatalui:</b></td>
                    <td><b>Prenume student:</b></td>
                    <td><b>Data nasterii:</b></td>
                    <td><b>Cnp:</b></td>
                    <td><b>Adresa:</b></td>
                    <td><b>Facultate:</b></td>
                    <td><b>Ciclu studii:</b></td>
                    <td><b>An studii:</b></td>
                    <td><b>IdCurs:</b></td>
                    <td><b>Denumire curs:</b></td>
                    <td><b>Nume profesor:</b></td>
                    <td><b>Sala:</b></td>
                    <td><b>Metoda notare:</b></td>
                    <td><b>Structura:</b></td>
                    <td><b>Denumire proiect:</b></td>
                    <td><b>Sesiune examinare:</b></td>
                    <td><b>Descriere:</b></td>
                    <td><b>Data predare:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeProiect();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idproiect");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("IdStudentProiect")%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("initiala_tata")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getString("data_nasterii")%></td>
                    <td><%= rs.getString("cnp")%></td>
                    <td><%= rs.getString("adresa")%></td>
                    <td><%= rs.getString("facultate")%></td>
                    <td><%= rs.getString("ciclu_studii")%></td>
                    <td><%= rs.getString("an_studii")%></td>
                    <td><%= rs.getInt("IdCursProiect")%></td>
                    <td><%= rs.getString("DenumireCurs")%></td>
                    <td><%= rs.getString("nume_profesor")%></td>
                    <td><%= rs.getString("sala")%></td>
                    <td><%= rs.getString("metoda_notare")%></td>
                    <td><%= rs.getString("structura")%></td>
                    <td><%= rs.getString("DenumireProiect")%></td>
                    <td><%= rs.getString("Sesiune examinare")%></td>
                    <td><%= rs.getString("Descriere")%></td>
                    <td><%= rs.getString("Data predare")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            </div>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate" disabled>
                <script>
                function checkOneChecked() {
                    var form = document.forms[0];
                    var checkboxes = form.querySelectorAll('input[type="checkbox"][name="primarykey"]');
                    var checkedCount = Array.from(checkboxes).filter(cb => cb.checked).length;
                    form.querySelector('input[type="submit"]').disabled = (checkedCount !== 1);
                }
                document.addEventListener('DOMContentLoaded', function() {
                    var form = document.forms[0];
                    if (form) {
                        var checkboxes = form.querySelectorAll('input[type="checkbox"][name="primarykey"]');
                        checkboxes.forEach(function(cb) {
                            cb.addEventListener('change', checkOneChecked);
                        });
                        checkOneChecked();
                    }
                });
                </script>
            </p>
        </form>
        </div>
        <%
            rs.close();
            jb.disconnect();
        %>
    </body>
</html>