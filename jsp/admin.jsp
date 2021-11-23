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
        <title>Admin</title>
        <link rel="stylesheet" href="../css/styleRegistrazione.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/user.css">
        <script src="https://kit.fontawesome.com/6a899d06a4.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%-- <nav>

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
        </nav> --%>

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

        
        <section class="user-content">
            <div id="wrapper">
                <div id="user">

                    <i class="fas fa-user-check mb-2" style="font-size: 30px"></i>
                    <div id="tit">
                        <h1>Admin</h1>
                    </div>
          
                    <div id="inf">
                        <p><%out.println(session.getAttribute("Welcome"));%></p>
                    </div>
                </div>
            
                <div id="rep">
                    <table style="background-color: white;">                       
                        <tr>
                          <td>
                            <div>
                              <div id="icon" style="padding-top: 2%">
                                <i class="fas fa-user-circle"></i>
                              </div> 
                              <div id="primo"> 
                                <span id="tipo">Username</span>
                              </div>
                              <div id="secondo">
                                <span><%out.println(session.getAttribute("Email"));%></span>
                              </div>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td id="ultimo">
                            <div>
                                <div id="icon">
                                    <i class="fas fa-key"></i>
                                </div>

                                <div id="primo">
                                    <span id="tipo">Password</span>
                                </div>

                                <div id="secondo" style="padding-bottom: 2%">
                                    <span>
                                        <%
                                        String Password=session.getAttribute("Password").toString();
                                        String hide="";
                                        for(int i=0; i<=Password.length()-1; i++){
                                            hide+="*";
                                        }
                                        out.println(hide);
                                        %>
                                    </span>
                                    
                                </div>
                            </div>
                          </td>
                        </tr>
                    </table>
            
                    <div class="box-scelta">
                      <div id="left">
                        <a href="gest_pos.jsp"><button>Gestisci posizioni</button></a>
                      </div>
                      <%-- <div id="right">           
                        <a href="#"><button><input type="file" name="" id=""></button></a>
                      </div> --%>
                      <div id="right">
                        <a href="gest_cand.jsp"><button>Gestisci candidature</button></a>
                      </div>
                    </div>
                
                </div>
            </div>
            
        
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