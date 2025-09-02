<%-- 
    Document   : adauga_Pacient
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Studenti</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container">
            <div id="add">
                <h1>Adauga student</h1>
                <form action="StudentiController" method="GET">
                    <table>
                        <tr>
                            <td>Nume Student:</td>
                            <td><input type="text" name="nume" value="${student.nume}"></td>
                        </tr>
                        <tr>
                            <td>Initiala Tata:</td>
                            <td><input type="text" name="initiala_tata" value="${student.initialaTata}"></td>
                        </tr>
                        <tr>
                            <td>Prenume Student:</td>
                            <td><input type="text" name="prenume" value="${student.prenume}"></td>
                        </tr>
                        <tr>
                            <td>Data nasterii:</td>
                            <td><input type="text" name="data_nasterii" value="${student.dataNasterii}"></td>
                        </tr>
                        <tr>
                            <td>CNP:</td>
                            <td><input type="text" name="cnp" value="${student.cnp}"></td>
                        </tr>
                        <tr>
                            <td>Adresa:</td>
                            <td><input type="text" name="adresa" value="${student.adresa}"></td>
                        </tr>
                        <tr>
                            <td>Facultate:</td>
                            <td><input type="text" name="facultate" value="${student.facultate}"></td>
                        </tr>
                        <tr>
                            <td>Ciclu studii:</td>
                            <td><input type="text" name="ciclu_studii" value="${student.cicluStudii}"></td>
                        </tr>
                        <tr>
                            <td>An studii:</td>
                            <td><input type="text" name="an_studii" value="${student.anStudii}"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="adaugaStudent" value="Adauga"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <form action="StudentiController" method="POST">
                <input type="submit" name="afiseazaStudenti" value="Afiseaza">
            </form>
            <br>
            <a href="index.html"><b>Home</b></a>
        </div>
    </body>
</html>
