<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%/*<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>*/%>
<title>Add new user</title>
</head>
<body>
    <%/*<script>
        $(function() {
            $('input[name=dob]').datepicker();
        });
    </script>*/%>

    <form method="POST" action='UsuarioController' name="frmAddUser">
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