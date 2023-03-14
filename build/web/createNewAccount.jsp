<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Create new Account</h1>
        <form action="DispatchServlet" method="POST">
            <c:set var="erros" value = "${requestScope.CREATE_ERRORS}"/>
            Username* <input type="text" name="txtUsername" value="${param.txtUsername}" 
                             />(6 - 20 chars)<br/>
            <c:if test="${not empty erros.usernameLengthError}">
                <font color = "red">
                ${erros.usernameLengthError}<br/>
                </font>
            </c:if>
            <c:if test="${not empty erros.usernameIsExisted}">
                <font color="red">
                ${erros.usernameIsExisted}<br/>
                </font>
            </c:if>
            Password* <input type="password" name="txtPassword" value="" />(6 - 30 chars)<br/>
            <c:if test="${not empty erros.passswordLengthError}">
                <font color = "red">
                ${erros.passswordLengthError}<br/>
                </font>
            </c:if>
            Confirm* <input type="password" name="txtComfirm" value="" /><br/>
            <c:if test="${not empty erros.comfirmNotMatched}"> 
                <font color = "red">
                ${erros.comfirmNotMatched}<br/>
                </font>
            </c:if>
            Full name* <input type="text" name="txtFullname" value="${param.txtFullname}" />(2 - 50 chars)<br/>
            <c:if test="${not empty erros.fullnameLengthError}">
                <font color = "red">
                ${erros.fullnameLengthError}<br/>
                </font><br/>
            </c:if>
            <input type="submit" value="Create New Account" name="btAction" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
