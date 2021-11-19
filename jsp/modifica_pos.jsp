<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int mod = Integer.parseInt(request.getParameter("modifica"));
    boolean stato=false;
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("SELECT stato FROM posizione WHERE id = "+ mod +";");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while(rs.next()){
            stato = rs.getBoolean("stato");
            if(stato){
                stato=false;
            }else{
                stato=true;
            }
        }   
        String upd = ("UPDATE posizione SET stato = ? WHERE id = ?");
        PreparedStatement ps = con.prepareStatement(upd);
        ps.setBoolean(1, stato);
        ps.setInt(2, mod);
        ps.executeUpdate();
        ps.close();    
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'gest_pos.jsp';
</script>