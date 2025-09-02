<%-- 
    Document   : adauga_Medic
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursuri</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container">
            <div id="add">
                <h1>Adauga curs</h1>
                <form action="CursuriController" method="GET">
                    <table>
                        <tr>
                            <td>Denumire curs:</td>
                            <td><input type="text" name="denumire"></td>
                        </tr>
                        <tr>
                            <td>Nume profesor</td>
                            <td><input type="text" name="nume_profesor"></td>
                        </tr>
                        <tr>
                            <td>Sala</td>
                            <td><input type="text" name="sala"></td>
                        </tr>
                        <tr>
                            <td>Metoda notare</td>
                            <td><input type="text" name="metoda_notare"></td>
                        </tr>
                        <tr>
                            <td>Structura</td>
                            <td><input type="text" name="structura"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="adaugaCurs" value="Adauga"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <form action="CursuriController" method="POST">
                <input type="submit" name="afiseazaCursuri" value="Afiseaza">
            </form>
            <br>
            <a href="index.html"><b>Home</b></a>
        </div>
    </body>
</html>
