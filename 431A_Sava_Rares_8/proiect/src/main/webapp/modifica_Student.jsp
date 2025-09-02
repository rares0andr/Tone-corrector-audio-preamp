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
        <title>Modifica Student</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Studenti:</h1>
        <br/>
        <p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Student.jsp" method="post">
            <div class="container">
                <div class="table-responsive">
                    <table border="1" style="width: 100% !important; max-width: 100vw !important;">
                        <tr>
                            <td><b>Mark:</b></td>
                            <td><b>IdStudent:</b></td>
                            <td><b>Nume:</b></td>
                            <td><b>Initiala tata:</b></td>
                            <td><b>Prenume:</b></td>
                            <td><b>Data nasterii:</b></td>
                            <td><b>Cnp:</b></td>
                            <td><b>Adresa:</b></td>
                            <td><b>Facultate:</b></td>
                            <td><b>Ciclu studii:</b></td>
                            <td><b>An studii:</b></td>
                            
                        </tr>
                        <%
                            jb.connect();
                            ResultSet rs = jb.vedeTabela("studenti");
                            long x;
                            while (rs.next()) {
                                x = rs.getLong("idstudent");
                        %>
                        <tr>
                            <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                            <td><%= x%></td>
                            <td><%= rs.getString("nume")%></td>
                            <td><%= rs.getString("initiala_tata")%></td>
                            <td><%= rs.getString("prenume")%></td>
                            <td><%= rs.getString("data_nasterii")%></td>
                            <td><%= rs.getString("cnp")%></td>
                            <td><%= rs.getString("adresa")%></td>
                            <td><%= rs.getString("facultate")%></td>
                            <td><%= rs.getString("ciclu_studii")%></td>
                            <td><%= rs.getString("an_studii")%></td>
                            <%
                                }
                            %>
                        </tr>
                    </table><br/>
                </div>
            </div>
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
        </div>
        <%
    jb.disconnect();%>
        <br/>
        
    </body>
</html>