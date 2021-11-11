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
        <div id="rep">
        <form action="stato_pos.jsp" method="POST">
          <table>
            <tr>
              <td><h1>Posizione</h1></td>
              <td><h1>Stato</h1></td>
            </tr>
            <tr>
              <td>
                <div class="select">
                  <select name="farm" id="slct" required>
                    <option selected disabled>Seleziona posizione</option>
                    <%
                      String DRIVER="com.mysql.cj.jdbc.Driver";
                      String URL="jdbc:mysql://localhost:3306/project_work";
                      String USERNAME="root";
                      String PASSWORD="";
                      try{
                        Class.forName(DRIVER);
                          Connection con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
                          String sql=("SELECT id, nome, stato FROM posizione");
                          Statement st = con.createStatement();
                          ResultSet rs= st.executeQuery(sql);
                          while(rs.next()){
                            out.println("<option value=" + "'"  + rs.getString("id") + "'" + ">" + rs.getString("nome") + "</option>");
                          }
                          con.close();
                          }
                          catch(SQLException e){
                            e.getErrorCode();
                          }
                        %>                                                     
                    </select>
                  </div> 
                </td> 
                <td> 
                  <div class="select">
                    <select name="farm" required>
                      <option selected disabled>Stato</option>
                                                                           
                    </select>
                  </div>
                </td>
                                
          </tr>  
                 
          <tr>
            <td colspan="3">
              <button>inserisci</button>
            </td>
          </tr>
                
          </table>
        </form>
        </div>
      </section>
      

    </body>

</html>