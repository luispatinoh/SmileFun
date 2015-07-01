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
        <%/*<link type="text/css"
             href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
             <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
             <script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>*/%>
    </head>
    <body>
        <%/*<script>
             $(function() {
             $('input[name=dob]').datepicker();
         });
         </script>*/%>

        <form method="POST" action='UsuarioController' name="frmAddUser" class="pure-form">
            User ID : <input type="text" readonly="readonly" name="userId" class="pure-input-1-2" placeholder="Id de Usuario"
                             value="<c:out value="${user.userId}" />" /> <br /> 
            First Name : <input
                type="text" name="firstName" class="pure-input-1-2" placeholder="Nombres"
                value="<c:out value="${user.firstName}" />" /> <br /> 
            Last Name : <input
                type="text" name="lastName" class="pure-input-1-2" placeholder="Apellidos"
                value="<c:out value="${user.lastName}" />" /> <br /> 
            <%/*
                 DOB : <input
                 type="text" name="dob"
                 value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> <br /> 
             */%>
            Email : <input type="text" name="email" class="pure-input-1-2" placeholder="E-mail"
                           value="<c:out value="${user.email}" />" /> <br /> <input
                           type="submit" value="Aceptar" class="pure-button pure-input-1-2 pure-button-primary" />
        </form>
    </body>
</html>