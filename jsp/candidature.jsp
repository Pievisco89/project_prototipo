<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("user")){
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Candidature</title>
        <link rel="stylesheet" href="../css/styleRegistrazione.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/posizioni.css">
        <script src="https://kit.fontawesome.com/6a899d06a4.js" crossorigin="anonymous"></script>
    </head>
    <body>

      <nav class="navbar navbar-light breadcrumb">
        <div class="container">
          <a class="navbar-brand" href="#">
            <img src="../img/logo.jpg" alt="logo">
          </a>
          <ol class="breadcrumb nav-links">
            <li class="breadcrumb-item">
              <a class="coloreLinkNavBar" href="../index.html">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a class="coloreLinkNavBar" href="../about.html">Chi siamo?</a>
            </li>
            <li class="breadcrumb-item">
              <a class="coloreLinkNavBar" href="../index.html" style="color: rgb(248, 95, 95);">Logout</a>
            </li>
          </ol>
                
          <div class="burger">
            <div class="lin1"></div>
            <div class="lin2"></div>
            <div class="lin3"></div>
          </div>     
            
        </div>
      </nav>

      <section class="table-container">
        <table class="table cand">
          <thead class="table-dark">
            <tr>
              <td>Cod Candidatura</td>
              <td>Cod fiscale:</td>
              <td>Stato domanda:</td>
              <td>Punteggio Test:</td>
              <td>Posizione:</td>
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
                String sel = ("SELECT t1.codCandidatura, t1.codFiscale, t2.stato_domanda, t3.punteggio, t4.nome FROM utente_candidatura t1 INNER JOIN candidatura t2 ON t1.codCandidatura = t2.idCandidatura INNER JOIN test t3 ON t2.codTest = t3.idTest INNER JOIN posizione t4 ON t2.cod_posizione=t4.id WHERE t1.codFiscale = '"+ cod_fisc +"';");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sel);
                while (rs.next()){
            %>
            
              <tr>
                <td><%= rs.getInt("t1.codCandidatura") %></td>
                <td><%= rs.getString("t1.codFiscale") %></td>
                <td>
                  <% 
                    if(rs.getBoolean("t2.stato_domanda")){
                      out.println("Accettata");
                    }else{
                      out.println("Non accettata");
                    }                   
                  %>
                </td>
                <td><%= rs.getInt("t3.punteggio") %></td>
                <td><%= rs.getString("t4.nome") %></td>
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
        
      
        <a href="user.jsp"> <button type="button" class="btn btn-dark m-3">Indietro</button></a>  

      </section>
      
    <script src="../js/script.js"></script>
    </body>

</html>
<%
      }else{
%>
  <script>
    window.location.href = '../login_user.html';
  </script> 
<%
      }
%>