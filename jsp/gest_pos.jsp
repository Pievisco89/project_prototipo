<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("admin")){
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Gestisci posizioni</title>
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

      <section class="table-container pt-2">
        <table class="table" style="width: 70%;">
          <thead class="table-dark">
            <tr>
              <td>Id posizione</td>
              <td>Nome posizione:</td>
              <td>Stato:</td>
              <td>Modifica:</td>
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
                  <td><button id="modifica" name="modifica" value="<%= rs.getInt("id") %>" class="btn-primary" style="padding: 0 5px; border-radius: 5px;"><i class="fas fa-pencil-alt"></i></button></td>   
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
          <div class="container pos">        
            <label>Inserire nome posizione:</label>
            <input type="text" id="nome" name="nome" style="width: 50%"> 
          </div> 
          <div class="container pos">  
            <label>Inserire stato posizione:</label>
            <select id="stato" name="stato">
              <option value="true">Libero</option>
              <option value="false">Occupato</option>
            </select>
          </div>
          <div class="container pos text-center">  
            <button class="btn btn-success" style="padding: 5px 15px;"><i class="fas fa-plus"></i></button>
          </div> 
        </form>

        <a href="admin.jsp"> <button type="button" class="btn btn-dark m-3">Indietro</button></a>
      </section>
      
	    <script src="../js/script.js"></script>
    </body>

</html>
<%
      }else{
%>
  <script>
    window.location.href = '../login.html';
  </script> 
<%
      }
%>