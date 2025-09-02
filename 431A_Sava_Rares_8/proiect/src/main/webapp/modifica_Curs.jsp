<%-- 
    Document   : modifica_Consultatie
    Created on : Nov 14, 2016, 1:36:40 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Curs</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Cursuri:</h1>
        <br/>
        <p align="center"><a href="nou_Curs.jsp"><b>Adauga un nou curs.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Curs.jsp" method="post">
            <table border="1" style="width: 100% !important; max-width: 100vw !important;">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdCurs:</b></td>
                    <td><b>Denumire:</b></td>
                    <td><b>Nume profesor:</b></td>
                    <td><b>Sala:</b></td>
                    <td><b>Metoda notare:</b></td>
                    <td><b>Structura:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("cursuri");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcurs");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("denumire")%></td>
                    <td><%= rs.getString("nume_profesor")%></td>
                    <td><%= rs.getString("sala")%></td>
                    <td><%= rs.getString("metoda_notare")%></td>
                    <td><%= rs.getString("structura")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia" disabled>
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
        <%
    jb.disconnect();%>
        <br/>
        
    </body>
</html>