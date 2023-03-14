<%-- 
    Document   : search
    Created on : Feb 16, 2023, 1:31:18 PM
    Author     : Ninh
--%>

<%@page import="ninhpd.registration.RegistrationDTO"%>
<%--<%@page import="java.util.List"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body> 
        <font>
        Welcome , ${sessionScope.USER.fullName}
        <font/>
        <h1>Search</h1>
        <form action="DispatchServlet">
            Search <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" /><br/>
            <input type="submit" value="search" name="btAction" />
        </form><br/>
        <c:set var ="searchValue" value="${param.txtSearchValue}" />
        <c:if test ="${not empty searchValue}">
            <c:set var = "result" value="${requestScope.SEARCH_RESULT}"/>
        </c:if>

        <c:if test ="${not empty result}" >
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th>Role</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="dto" items="${result}" varStatus = "counter">
                    <form action="DispatchServlet" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.username}
                                <input type="hidden" name="txtUsername" value="${dto.username}" />
                            </td>
                            <td>
                                <input type="text" name="txtPassword" 
                                       value="${dto.password}" />
                            </td>
                            <td>${dto.fullName}</td>
                            <td>
                                <input type="checkbox" name="chkAdmin" value="ON"
                                       <c:if test="${dto.role}">
                                           checked ="checked"
                                       </c:if>
                                       />
                            </td>
                            <td>
                                <c:url var = "deleteLink" value="DispatchServlet">
                                    <c:param name="btAction" value="delete" />
                                    <c:param name="username" value="${dto.username}" />
                                    <c:param name="lastSearchValue" value="${searchValue}" />
                                </c:url>
                                <a href="${deleteLink}">Delete</a>
                            </td>
                            <td>
                                <input type="submit" value="update" name="btAction" />
                                <input type="hidden" value="${searchValue}" name="lastSearchValue" />
                            </td>

                        </tr>
                    </form> 

                </c:forEach>

            </tbody>
        </table>

    </c:if>

    <c:if test ="${empty result}" >
        <h2>
            No record is matched !!!
        </h2>   
    </c:if>
</body>
</html>
<%--
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        Cookie lasCookie = cookies[cookies.length - 1];
        String username = lasCookie.getName();
%>
<font color:red>
    Wellcome <%= username%>
</font>
<%
    }//end cookies

        %>

        <h1>Search Page</h1>
        <form action="DispatchServlet" method="POST">
            Search Text <input type="text" name="txtSearchValue" 
                               value="<%= request.getParameter("txtSearchValue")%>" /><br/>
            <input type="submit" value="search" name="btAction" />
        </form><br/>
        <%
            String searchValue = request.getParameter("txtSearchValue");

            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");

                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Full Name</th>
                    <th>Role</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                        String urlRewriting = "DispatchServlet"
                                + "?btAction=delete"
                                + "&username=" + dto.getUsername()
                                    + "&lastSearchValue=" + searchValue;%>
            <form action="DispatchController" method="POST">
                <tr>
                    <td>
                        <%= ++count%>    
                    </td>
                    <td>
                        <%= dto.getUsername()%>
                        <input type="hidden" name="txtUsername" 
                               value="<%= dto.getUsername()%>" />                                      
                    </td>
                    <td>
                        <input type="text" name="txtPassword" 
                               value="<%= dto.getPassword()%>" />
                    </td>
                    <td>
                        <%= dto.getFullName()%>
                    </td>
                    <td>
                        <input type="checkbox" name="chkAdmin" value="ON" 
                               <%
                                   if (dto.isRole()) {
                               %> 
                               checked="checked"
                               <%
                                       }//end admin is true     
%>
                               />
                    </td>
                    <td>
                        <a href="<%= urlRewriting%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" value="Update" name="btAction" />
                        <input type="hidden" name="lastSearchValue" 
                               value="<%= searchValue%>" />
                    </td>
                </tr>
            </form>
            <%
                }//end traverse dto
            %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <h2>
        No record is matched!!!
    </h2>   
    <%
            }//end no result found
        }//end search Value has existed
%>--%>

