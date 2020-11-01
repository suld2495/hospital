<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/lib/jquery-ui/jquery-ui.min.css' />">
<link rel="stylesheet" href="<c:url value='/css/admin/popup/popupwrite.css' />">

<section class="content">
    <div class="content_wrap">
        <div class="qna_board_wrap">
            <article class="basicText">
                <div class="headerTextDiv1">
                    <h2>팝업 관리</h2>
                </div>
                <div class="redLine"></div>
                <div class="headerTextDiv2">팝업 관리가 가능합니다.</div>
            </article>
        </div>

        <div class="popupTableDiv">
            <form method="post" action="<c:url value="/admin/popupWrite" />" class="form" enctype="multipart/form-data">
                <table class="boardTable">
                    <tr>
                        <td>기간설정</td>
                        <td>
                            <input type="text" id="datepicker1">
                            <img src="<c:url value='/images/admin/calendar.jpg'/>" class="datepicker1 pointer">
                            <select class="hour1">
                                <option value="01">01시</option>
                                <option value="02">02시</option>
                                <option value="03">03시</option>
                                <option value="04">04시</option>
                                <option value="05">05시</option>
                                <option value="06">06시</option>
                                <option value="07">07시</option>
                                <option value="08">08시</option>
                                <option value="09">09시</option>
                                <option value="10">10시</option>
                                <option value="11">11시</option>
                                <option value="12">12시</option>
                            </select>:
                            <select class="minutes1">
                                <option value="00">00분</option>
                                <option value="10">10분</option>
                                <option value="20">20분</option>
                                <option value="30">30분</option>
                                <option value="40">40분</option>
                                <option value="50">50분</option>
                            </select>~
                            <input type="text" id="datepicker2">
                            <img src="<c:url value='/images/admin/calendar.jpg'/>" class="datepicker2 pointer">
                            <select class="hour2">
                                <option value="01">01시</option>
                                <option value="02">02시</option>
                                <option value="03">03시</option>
                                <option value="04">04시</option>
                                <option value="05">05시</option>
                                <option value="06">06시</option>
                                <option value="07">07시</option>
                                <option value="08">08시</option>
                                <option value="09">09시</option>
                                <option value="10">10시</option>
                                <option value="11">11시</option>
                                <option value="12">12시</option>
                            </select>:
                            <select class="minutes2">
                                <option value="00">00분</option>
                                <option value="10">10분</option>
                                <option value="20">20분</option>
                                <option value="30">30분</option>
                                <option value="40">40분</option>
                                <option value="50">50분</option>
                            </select>
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <td>창 크기</td>--%>
<%--                        <td>가로 <input type="text" name="popup_width" class="px"> px, 세로 <input type="text" name="popup_height" class="px"> px</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>창 위치</td>--%>
<%--                        <td>화면 위로부터 <input type="text" name="popup_top" class="px"> px, 왼쪽부터 <input type="text" name="popup_left" class="px"> px</td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td>팝업 이미지등록</td>
                        <td><input type="file" name="file"></td>
                    </tr>
<%--                    <tr>--%>
<%--                        <td>링크 #</td>--%>
<%--                        <td><input type="text" name="popup_link"></td>--%>
<%--                    </tr>--%>
                </table>

                <input type="hidden" name="update" value="${update}">
                <input type="hidden" name="popup_start">
                <input type="hidden" name="popup_end">
            </form>
        </div>

        <div class="popupBn">
            <img src="<c:url value='/images/admin/popupSubmit.jpg'/>" class="submit pointer">
            <a href="<c:url value='/admin/popup/1'/>">
                <img src="<c:url value='/images/admin/popuplist.jpg'/>">
            </a>
        </div>
    </div>
</section>

<script src="<c:url value='/lib/jquery-ui/jquery-ui.min.js' />"></script>

<script type="text/javascript">

    var popupwrite = {


        init : function() {
            //날짜 호출하기
            this.datepicker();

            //전송전 체크
            this.submit();
        },

        datepicker : function() {

            var $datepicker1 = $(".datepicker1");
            var $datepicker2 = $(".datepicker2");

            $("#datepicker1").datepicker({

                dateFormat: "yy-mm-dd"
            });

            $("#datepicker2").datepicker({

                dateFormat: "yy-mm-dd"
            });

            $datepicker1.click(function() {

                $("#datepicker1").datepicker("show");
            })

            $datepicker2.click(function() {

                $("#datepicker2").datepicker("show");
            })
        },

        submit : function() {

            var $submit = $(".submit");
            var that = this;

            $submit.click(function() {

                var $datepicker1 = $("#datepicker1");
                var $datepicker2 = $("#datepicker2");
                var $form = $(".form");

                if(!isEmpty($datepicker1) && !isEmpty($datepicker2)) {

                    var $popup_start = $("input[name='popup_start']");
                    var $popup_end = $("input[name='popup_end']");

                    var $hour1 = $(".hour1 option:selected");
                    var $hour2 = $(".hour2 option:selected");
                    var $minutes1 = $(".minutes1 option:selected");
                    var $minutes2 = $(".minutes2 option:selected");

                    $popup_start.val($datepicker1.val() + " " + $hour1.val() + ":" + $minutes1.val() + ":00");
                    $popup_end.val($datepicker2.val() + " " + $hour2.val() + ":" + $minutes2.val() + ":00");
                } else {
                    alert("날짜 또는 이미지를를 선택해 주세요.")
                    return false;
                }

                $form.submit();
            });
        }
    }

    $(document).ready(function() {

        popupwrite.init();
    });
</script>