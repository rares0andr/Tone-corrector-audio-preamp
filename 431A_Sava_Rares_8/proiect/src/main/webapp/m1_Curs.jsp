<%-- 
    Document   : m1_Medic
    Created on : Nov 14, 2016, 1:39:35 PM
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
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Cursuri:</h1>
        <br/>
        <p align="center"><a href="nou_Medic.jsp"><b>Adauga un nou curs.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("cursuri", "idcurs", aux);
            rs.first();
            String Denumire = rs.getString("denumire");
            String Nume_profesor = rs.getString("nume_profesor");
            String Sala = rs.getString("sala");
            String Metoda_notare = rs.getString("metoda_notare");
            String Structura = rs.getString("structura");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Curs.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> <input type="text" name="idcurs" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="denumire" size="30" value="<%= Denumire%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nume profesor:</td>
                    <td> <input type="text" name="nume_profesor" size="30" value="<%= Nume_profesor%>"/></td>
                </tr>
                <tr>
                    <td align="right">Sala:</td>
                    <td> <input type="text" name="sala" size="30" value="<%= Sala%>"/></td>
                </tr>
                <tr>
                    <td align="right">Metoda notare:</td>
                    <td> <input type="text" name="metoda_notare" size="30" value="<%= Metoda_notare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Structura:</td>
                    <td> <input type="text" name="structura" size="30" value="<%= Structura%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        
            <br/>
    </body>
</html>