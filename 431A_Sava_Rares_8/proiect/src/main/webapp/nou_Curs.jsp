<%-- 
    Document   : nou_Medic
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga curs</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Denumire = request.getParameter("denumire");
            String NumeProfesor = request.getParameter("nume_profesor");
            String Sala = request.getParameter("sala");
            String MetodaNotare = request.getParameter("metoda_notare");
            String Structura = request.getParameter("structura");
            if (Denumire != null) {
                jb.connect();
                jb.adaugaCurs(Denumire, NumeProfesor, Sala, MetodaNotare, Structura);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Curs.</h1>
        <form action="nou_Curs.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Denumire curs:</td>
                    <td> <input type="text" name="denumire" size="40" required /></td>
                </tr>
                <tr>
                    <td align="right">Nume profesor:</td>
                    <td> <input type="text" name="nume_profesor" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Sala:</td>
                    <td> <input type="text" name="sala" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Metoda notare:</td>
                    <td> <input type="text" name="metoda_notare" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Structura:</td>
                    <td> <input type="text" name="structura" size="30" required /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga cursul" disabled />
    <script>
    function checkFields() {
        var form = document.forms[0];
        var required = ['denumire', 'nume_profesor', 'sala', 'metoda_notare', 'structura'];
        var allFilled = required.every(function(name) {
            var el = form[name];
            return el && el.value.trim() !== '';
        });
        form.querySelector('input[type="submit"]').disabled = !allFilled;
    }
    document.addEventListener('DOMContentLoaded', function() {
        var form = document.forms[0];
        if (form) {
            var inputs = form.querySelectorAll('input[type="text"]');
            inputs.forEach(function(input) {
                input.addEventListener('input', checkFields);
            });
            checkFields();
        }
    });
    </script>
        </form>
        <%
            }
        %>
        <br/>
        <div style="text-align:center;"><a href="index.html"><b>Home</b></a></div>
        <br/>
    </body>
</html>