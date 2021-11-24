<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("user")){
%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    String[] par = request.getParameterValues("speciale");
    int lunghezza = par.length;
    int[] vet = new int[lunghezza]; 
    String cv = request.getParameter("cv");
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        for(int i = 0; i < par.length; i++){
            vet[i] = Integer.parseInt(par[i]);
            String ins = ("INSERT INTO utente_skill (codSkill , codFiscale) VALUES(?, ?)");
            PreparedStatement ps = con.prepareStatement(ins);
            ps.setInt(1, vet[i]);
            ps.setString(2, session.getAttribute("Cf").toString());
            ps.executeUpdate();
            ps.close();
        }
        String upd = ("UPDATE utente SET curriculum = ? WHERE codiceFiscale = ?");
        PreparedStatement ps2 = con.prepareStatement(upd);
        ps2.setString(1, cv);
        ps2.setString(2, session.getAttribute("Cf").toString());
        ps2.executeUpdate();
        ps2.close();    
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'curriculum.jsp';
</script> 
<%
      }else{
%>
  <script>
    window.location.href = '../login_user.html';
  </script> 
<%
      }
%>