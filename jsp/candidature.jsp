<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%-- <%
    if(session.getAttribute("Utente")!=null){
    if(session.getAttribute("Utente").equals("TRUE")){
%> --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrati</title>
        <link rel="stylesheet" href="../css/styleRegistrazione.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/posizioni.css">
        <script src="https://kit.fontawesome.com/6a899d06a4.js" crossorigin="anonymous"></script>
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
            <a class="coloreLinkNavBar" href="../index.html" style="color: rgb(248, 95, 95);">Logout</a>
          </li>

        </ul>

        <div class="burger">
          <div class="lin1"></div>
          <div class="lin2"></div>
          <div class="lin3"></div>
        </div>
      </nav>

      <section class="table-container">
        <table>
          <thead>
            <tr>
              <td>Cod Candidatura</td>
              <td>Cod fiscale:</td>
              <td>Stato domanda:</td>
              <td>Punteggio Test:</td>
            </tr>
          </thead>
          <tbody>
          
            <%
              String DRIVER = "com.mysql.cj.jdbc.Driver";
              String URL = "jdbc:mysql://localhost:3306/project_work";
              String USERNAME = "root";
              String PASSWORD = "";
              String cod_fisc = session.getAttribute("Cf").toString();
              try {
                Class.forName(DRIVER);
                Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);   
                String sel = ("SELECT t1.codCandidatura, t1.codFiscale, t2.stato_domanda, t3.punteggio FROM utente_candidatura t1 INNER JOIN candidatura t2 ON t1.codCandidatura = t2.idCandidatura INNER JOIN test t3 ON t2.cod_posizione = t3.idTest WHERE t1.codFiscale = '" + cod_fisc + "';");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sel);
                while (rs.next()){
            %>
            
              <tr>
                <td><%= rs.getInt("t1.codCandidatura") %></td>
                <td> <%= rs.getString("t1.codFiscale") %> </td>
                <td> <%= rs.getBoolean("t2.stato_domanda") %> </td>
                <td> <%= rs.getInt("t3.punteggio") %> </td>
              </tr>
            
            <% 


                }
                    con.close();
                } catch (SQLException e) {
                    e.getErrorCode();
                }
              
            %>      
            
          </tbody>
        </table>
      
      </section>
      

    </body>

</html>

