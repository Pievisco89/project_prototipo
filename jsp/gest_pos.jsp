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
              <td>Id posizione</td>
              <td>Nome posizione:</td>
              <td>Stato:</td>
            </tr>
          </thead>
          <tbody>
          
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
            %>
            
              <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nome") %></td>
                <td>
                  
                  <% 
                
                    rs.getBoolean("stato");
                    if(rs.getBoolean("stato")){
                      
                      out.println("Libero");
                    
                    }else{

                      out.println("Occupato");

                    }
                    
                  %>
                
                </td>
                <form action="modifica_pos.jsp" method="post">
                  <td><button id="modifica" name="modifica" value="<%= rs.getInt("id") %>"><i class="fas fa-pencil-alt"></i></button></td>
                </form>
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
        <form action="aggiungi_pos.jsp" method="post">
        <button><i class="fas fa-plus"></i></button>
          <label>inserire nome posizione:</label>
          <input type="text" id="nome" name="nome">  
          <label>inserire stato posizione:</label>
          <select id="stato" name="stato">
            <option value="true">Libero</option>
            <option value="false">Occupato</option>
          </select>
        </form>
      </section>
      

    </body>

</html>