<%@page import="org.glassfish.servlet.persistent.LoginPO"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Smile Fun</title>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

        <style>
            .centered {
                position:fixed;
                top: 50%;
                left: 50%;
                height:18em;
                margin-top: -9em; /*set to a negative number 1/2 of your height*/
                margin-left: -8em; /*set to a negative number 1/2 of your width*/

            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="main">
                <%  LoginPO usuario = (LoginPO) session.getAttribute("user");
                    boolean logged = false;
                    String usuarioNombre = "";
                    try {
                        if (usuario == null) {
                            usuarioNombre = "Usuario";
                            logged = false;
                        } else {
                            usuarioNombre = usuario.getUser();
                            logged = true;
                        }
                    } catch (Exception e) {
                        usuarioNombre = "Usuario";
                        logged = false;
                    }
                %>

                <div class="pure-menu pure-menu-horizontal">
                    <ul class="pure-menu-list" style="float:right">
                        <li class="pure-menu-item pure-menu-selected"><a href="index.jsp" class="pure-menu-link">Home</a></li>
                        <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                            <% if (logged) {%>
                            <ul class="pure-menu-children">
                                <li class="pure-menu-item"><a href="user.jsp" id="menuLink1" class="pure-menu-link"><%= (usuarioNombre)%></a></li>
                                <li class="pure-menu-item"><a href="principal.jsp" class="pure-menu-link">Mi Perfil</a></li>
                                <li class="pure-menu-item"><a href="LogoutServlet" class="pure-menu-link">Logout</a></li>                
                            </ul>
                            <%
                            } else {
                            %>
                            <ul class="pure-menu-children">
                                <li class="pure-menu-item"><a href="login.jsp" class="pure-menu-link">Log in</a></li>
                            </ul>
                            <%
                                }
                            %>
                        </li>
                    </ul>
                </div>

                <header class="clearfix">

                    <h1>Smile Fun</h1>

                    <div class="support-note">
                        <span class="note-ie">Lo sentimos, se necesita un navegador más reciente.</span>
                    </div>

                </header>


                <div class="centered" style="width:400px">

                    <form method="POST" action='LoginController' name="frmLogin" class="pure-form">
                        <fieldset class="pure-group">
                            <label>Ingrese sus datos</label>
                            <br/>
                            <%  usuario = (LoginPO) session.getAttribute("user");
                                try {
                                    if (usuario == null) {%>
                            <span class="note-ie"><%= (request.getAttribute("str_MsgLogin") == null ? "" : (request.getAttribute("str_MsgLogin")))%></span>
                            <%}
                                } catch (Exception e) {
                                }
                            %>
                            <br/>
                            <input type="text" class="pure-input-1-2" placeholder="Username" name="user">
                            <input type="password" class="pure-input-1-2" placeholder="Password" name="password">
                        </fieldset>

                        <button type="submit" class="pure-button pure-input-1-2 pure-button-primary">Ingresar</button>
                    </form>

                </div>



            </div>
        </div>
    </body>
</html>
