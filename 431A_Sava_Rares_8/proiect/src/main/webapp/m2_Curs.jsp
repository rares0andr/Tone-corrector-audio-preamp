<%-- 
    Document   : m2_Medic
    Created on : Nov 14, 2016, 1:42:49 PM
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
        <h1 align="center"> Tabela Cursuri:</h1>
        <br/>
        <p align="center"><a href="nou_Curs.jsp"><b>Adauga un nou curs.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcurs"));
            String Denumire = request.getParameter("denumire");
            String NumeProfesor = request.getParameter("nume_profesor");
            String Sala = request.getParameter("sala");
            String MetodaNotare = request.getParameter("metoda_notare");
            String Structura = request.getParameter("structura");

            String[] valori = {Denumire, NumeProfesor, Sala, MetodaNotare, Structura};
            String[] campuri = {"denumire", "nume_profesor", "sala", "metoda_notare", "structura"};
            jb.modificaTabela("cursuri", "idcurs", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        
            <br/>
    </body>
</html>