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
        <form action="skill.jsp" method="post">
            <label>inserire Curriculum:</label>
            <input type="file" id="cv" name="cv">  
            <label>inserire skill:</label>
            <select id="skill" name="skill">
                <%
                String DRIVER="com.mysql.cj.jdbc.Driver";
                String URL="jdbc:mysql://localhost:3306/project_work";
                String USERNAME="root";
                String PASSWORD="";
                try{
                    Class.forName(DRIVER);
                    Connection con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    String sel=("SELECT idSkill, nomeSkill FROM skill;");
                    Statement st = con.createStatement();
                    ResultSet rs= st.executeQuery(sel);
                    while(rs.next()){
                        out.println("<option value='" + rs.getInt("idSkill") + "'>" + rs.getString("nomeSkill") + "</option>");
                    }
                        con.close();
                    } catch (SQLException e) {
                        e.getErrorCode();
                    }
                
                %>         
            </select>
            <button>Invia curriculum e skills</button>
        </form>
      </section>
      

    </body>

</html>