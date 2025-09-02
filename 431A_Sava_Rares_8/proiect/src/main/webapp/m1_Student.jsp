<%-- 
    Document   : m1_Pacient
    Created on : Nov 14, 2016, 1:39:35 PM
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
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Studenti:</h1>
        <br/>
        <p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("studenti", "idstudent", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String InitialaTata = rs.getString("initiala_tata");
            String Prenume = rs.getString("prenume");
            String DataNasterii = rs.getString("data_nasterii");
            String Cnp = rs.getString("cnp");
            String Adresa = rs.getString("adresa");
            String Facultate = rs.getString("facultate");
            String CicluStudii = rs.getString("ciclu_studii");
            String AnStudii = rs.getString("an_studii");
            
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Student.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> <input type="text" name="idstudent" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Initiala tatalui:</td>
                    <td> <input type="text" name="initiala_tata" size="30" value="<%= InitialaTata%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data nasterii:</td>
                    <td> <input type="text" name="data_nasterii" size="30" value="<%= DataNasterii%>"/></td>
                </tr>
                <tr>
                    <td align="right">CNP:</td>
                    <td> <input type="text" name="cnp" size="30" value="<%= Cnp%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" value="<%= Adresa%>"/></td>
                </tr>
                <tr>
                    <td align="right">Facultate:</td>
                    <td> <input type="text" name="facultate" size="30" value="<%= Facultate%>"/></td>
                </tr>
                <tr>
                    <td align="right">Ciclu studii:</td>
                    <td> <input type="text" name="ciclu_studii" size="30" value="<%= CicluStudii%>"/></td>
                </tr>
                <tr>
                    <td align="right">An studii:</td>
                    <td> <input type="text" name="an_studii" size="30" value="<%= AnStudii%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        
            <br/>
    </body>
</html>