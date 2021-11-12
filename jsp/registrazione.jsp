<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrati</title>
        <link rel="stylesheet" href="../css/styleRegistrazione.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <nav>

            <div class="logo">
                <img src="../img/logo.jpg" alt="logo">
            </div>

            <ul class="nav-links">

                <li >
                    <a class="coloreLinkNavBar" href="../index.html" >Home</a>
                </li>

                <li>
                    <a class="coloreLinkNavBar" href="#">Chi siamo?</a>
                </li>

                <li>
                    <a class="coloreLinkNavBar" href="#">Contatti</a>
                </li>

                <li>
                    <a class="coloreLinkNavBar" href="registrazione.jsp" style="color: rgb(248, 95, 95);">Registrati</a>
                </li>

                <li>
                    <a class="coloreLinkNavBar" href="../login.html">Login</a>
                </li>

            </ul>

            <div class="burger">
                <div class="lin1"></div>
                <div class="lin2"></div>
                <div class="lin3"></div>
            </div>
        </nav>

        <section class="form-container">

            <form action="registrazione_check.jsp" method="post" class="form_login">

                <h1>Registrati</h1>

                <div class="input-container">

                    <input type="text" name="nome" id="nome" placeholder="Inserisci il nome" required>
                    <input type="text" name="cognome" id="cognome" placeholder="Inserisci il cognome" required>
          
                </div>

                <div class="input-container">

                    <input type="text" name="codiceFiscale" id="codiceFiscale" required placeholder="Inserisci il codiceFiscale" maxlength="16" minlength="16" >

                    <select class="nazionalita" name="naz" id="naz">
                        <%
                        String DRIVER = "com.mysql.cj.jdbc.Driver";
                        String URL = "jdbc:mysql://localhost:3306/project_work";
                        String USERNAME = "root";
                        String PASSWORD = "";
                        try {
                            Class.forName(DRIVER);
                            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                            String sel1 = ("SELECT idNazionalita, nomeNazionalita from nazionalità order by idNazionalita");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(sel1);
                            while (rs.next()) {
                                int i = 0;
                                out.println("<option value='" + rs.getString("idNazionalita") + "'>" + rs.getString("nomeNazionalita") + "</option>");
                                i++;
                            }   
                            rs.close();
                            con.close();
                        } catch (SQLException e) {
                            e.getErrorCode();
                        }
                        %>
                    </select>

                </div>

                <div class="input-container">
                    <input type="email" name="email" id="email" required value="" placeholder="Example@gmail.com">

                    <input type="password" name="password" id="password" required value="" placeholder="Inserisci la password">

                </div>

                <div class="input-container">

                    <input type="password" name="confermaPassword" id="confermaPassword" placeholder="Conferma password">

                    <input type="date" name="dataNascita" id="dataNascita" required>

                </div>

                <input type="submit" value="Login">

                <h4 style="color:rgb(165, 165, 165)">Sei già iscritto?<a style="text-decoration: none;color:whitesmoke" href="../login_user.html">Accedi</a></h4>

            </form>
        </section>

    </body>

</html>
