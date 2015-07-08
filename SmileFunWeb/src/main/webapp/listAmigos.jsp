<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Smile Fun</title>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

        <link rel="stylesheet" href="css/avatar.css">
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
                <div class="pure-menu pure-menu-horizontal">
                    <ul class="pure-menu-list" style="float:right">
                        <li class="pure-menu-item pure-menu-selected">Friends</li>
                        <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                            <a href="#" id="menuLink1" class="pure-menu-link">Usermame</a>
                            <ul class="pure-menu-children">
                                <li class="pure-menu-item"><a href="#" class="pure-menu-link">My Profile</a></li>
                                <li class="pure-menu-item"><a href="#" class="pure-menu-link">Logout</a></li>                
                            </ul>
                        </li>
                    </ul>
                </div>
                <header class="clearfix">
                    <h1>Smile Fun</h1>
                    <div class="support-note">
                        <span class="note-ie">Sorry, only modern browsers.</span>
                    </div>
                </header>
                <div class="centered" style="width:400px">

                    <form class="pure-form">
                        <fieldset>
                            <legend>Mis amigos</legend>

                            <input type="text" style="width:300px" placeholder="nombre">        
                            <button type="submit" class="pure-button pure-button-primary">Buscar</button>
                        </fieldset>
                    </form>
                    
                    <div>
                        <c:forEach items="${amigos}" var="amigo">
                            <section class="post">
                                <header class="post-header">
                                    <img class="post-avatar" alt="${amigo.amigoId}" height="48" width="48" src="${amigo.photoUrl}">
                                    <c:out value="${amigo.amigoId}" />
                                    <a class="link_post">Ver album</a>
                                </header>
                            </section>
                        </c:forEach>
                    </div>
                    <p><a href="AmigoController?action=insert">Agregar amigo</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
