<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, width=device-width, user-scalable=yes">
    <link rel="stylesheet" href="<c:url value="/css/admin/login/login.css"/>">

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <script>

            location.href = "<c:url value='/admin/notice/1'/>";
        </script>
    </sec:authorize>

    <script src="<c:url value="/js/lib/jquery.1.12.4.js"/>"></script>

    <script>
        var loginForm = {
            init : function (){
                this.submit();

                this.enter();
            }

            ,submit : function (){

                $(".loginSubmit").click(function() {

                    $(".form").submit();
                });

                $(".form").submit(function(){
                    if($("#id").val() != null && $("#id").val() != "" && $("#password").val() != null && $("#password").val() != ""){
                        $.ajax({
                            beforeSend : function(jqXHR) {
                                jqXHR.setRequestHeader("AJAX", true);
                            },
                            url : "<c:url value='/login/auth'/>",
                            type : "post",
                            dataType : "json",
                            data : $(".form").serialize(),
                            success : function(data){
                                if(data.response.error)
                                    alert("아이디 또는 비밀번호가 맞지 않습니다.");
                                else{
                                    location.href = "<c:url value='/admin/notice/1'/>";
                                }

                                return false;
                            },
                            error : function(jqXHR){
                                if (jqXHR.status == 401) {
                                    //alert("401");
                                } else if (jqXHR.status == 403) {
                                    alert("로그인을 하세요.");
                                    location.replace('<c:url value="/admin/login" />');
                                } else if (jqXHR.status == 200) {
                                    location.href = "<c:url value='/admin/notice/1'/>";
                                } else {
                                    alert("예외가 발생했습니다. 관리자에게 문의하세요.");
                                }
                            }
                        })
                    }else{
                        alert("아이디 또는 비밀번호를 입력 해 주세요.");
                    }
                    return false;
                });
            },

            enter : function() {

                var $password = $("#password");
                var $id = $("#id");

                $password.keypress(function(e){
                    if(e.keyCode==13) {
                        $(".loginSubmit").trigger("click");
                        return false;
                    }
                })

                $id.keypress(function(e){
                    if(e.keyCode==13) {
                        $(".loginSubmit").trigger("click");
                        return false;
                    }
                })
            }
        }
        $(document).ready(function(){
            loginForm.init();
        });
    </script>
    <title>미소원치과 관리자</title>
</head>
<body>
<div class="wrap">
    <div class="logo">
        <h2>관리자페이지입니다</h2>
        <p>ADMINISTRATION</p>
    </div>
    <form:form class="form" method="post" action="/login/auth">
        <div class="mainForm">
            <!-- <div class="remember">
                <div class="rememberBox">
                    <input type="checkbox" id="rememberMe" name ="_spring_security_remember_me"><label for="rememberMe">자동 로그인 하기</label>
                </div>
            </div> -->
            <div class="formBox">
                <div class="loginText">Login</div>
                <div class="loginInputBox">
                    <div class="idBox"><input type="text" name="id" id="id" placeholder="ID"></div>
                    <div class="passBox"><input type="password" name="password" id="password" placeholder="PASSWORD"></div>
                </div>

                <div class="loginBox"><img src="<c:url value='/images/login/loginBn.jpg'/>" class="loginSubmit pointer"></div>
            </div>
        </div>
    </form:form>
</div>
<script src="<c:url value='/js/admin/util.js'/>"></script>
</body>
</html>