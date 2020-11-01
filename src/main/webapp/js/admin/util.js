
/*
 * 설명 : get으로 넘겨온 데이터를 자바스크립트에서 가져오는 함수
 */
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}	

/*
 * 설명 : absolute 자식을 가진 부모는 자식의 높이를 수동으로 입력 해야 함
 */

function absoulteParent(parent, child) {
	
	parent.css("height",child.offset().top+child.height()-parent.offset().top);
}

/*
 * 설명 : 탭 활성화
 */

function tabChange(tab, index, tabContent) {
	
	tab.children().removeClass("active").eq(index).addClass("active");
	
	if(tabContent != null) {
		
		tabContent.children().removeClass("active").eq(index).addClass("active");	
	}
}

/*
 * 설명 : 유효성 검사 후 alert 띄우기
 */

function isEmptyAlert(object) {
	
	var length = object.length;
	
	if(length == 0) {
		
		return true;
	} else if(length == 1) {
		
		if(object.val() == null || object.val() == undefined || object.val() == "") {
			
			alert(object.data("alert")+"을(를) 입력 해 주세요");
			object.focus();
			return true;
		}
		
	} else if(length > 1) {
		
		for(var i=0; i<length; i++) {
			
			if(object[i].val() == null || object[i].val() == undefined || object[i].val() == "") {
				
				alert(object[i].data("alert")+"을(를) 입력 해 주세요");
				object[i].focus();
				return true;
			}
		}
	}
	
	return false;	
}

/*
 * 설명 : isEmptyAlert을 사용 할 때에 요소들을 배열로 만들어 주는 것
 */
function isEmptyAlertUtil(object) {
	
	var _array = [];
	
	object.each(function(k, v) {
		
		_array[k] = $(this);
	})
	
	return isEmptyAlert(_array);
}


/*
 * 설명 : 유효성 검사 후 boolean 값 반환
 */

function isEmpty(object) {
	
	var length = object.length;
	
	if(length == 0) {
		
		return true;
	} else if(length == 1) {
		
		if(object.val() == null || object.val() == undefined || object.val() == "") {
			
			object.focus();
			return true;
		}
		
	} else if(length > 1) {
		
		for(var i=0; i<length; i++) {
			
			if(object[i].val() == null || object[i].val() == undefined || object[i].val() == "") {
				
				object[i].focus();
				return true;
			}
		}
	}
	
	return false;
}

/*
 * 설명 : 유효성 검사 후 boolean 값 반환(포커스 안됨)
 */

function isNonFocusEmpty(object) {
	
	var length = object.length;
	
	
	if(length == 0) {
		
		return true;
	} else if(length == 1) {
		
		if(object.val() == null || object.val() == undefined || object.val() == "") {
			
			return true;
		}
		
	} else if(length > 1) {
		
		for(var i=0; i<length; i++) {
			
			if(object[i].val() == null || object[i].val() == undefined || object[i].val() == "") {
				
				return true;
			}
		}
	}
	
	return false;	
}

/*
 * 설명 : 숫자만 입력하기
 */

function numberonly(type) {
	var temp = type.val();
	
	if(temp.indexOf(" ") > -1){
		alert("공백은 허용되지 않습니다.");
		type.val(type.val().replace(" ",""));
		return false;
	}
	
	if(isNaN(temp)){
		alert("숫자만 입력 해 주세요.");
		type.val("");
	}
}

/*
 * 설명 : ajax 간편하게 쓰기
 */

function ajaxSimple(url,data,fun, that) {
	
	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
		url : url,
		type : "post",
		data : data,
		dataType : "json",
		success : function(data){
			
			if(fun != ""){
				
				fun(data, that);
			}
			
		},
		
		error : function(a,b,c) {
			
			console.log(a + " : " + b +" : " + c);
		}
	})
}

/*
 * [설명] : 랜덤 숫자 만들기
 * [paramter]
 * 1. num : 만들고자 하는 랜덤 수의 자리 수
 */

function randomCreater(num) {
	
	var ranNum = ""
	for(var i=0;i<num;i++)
		ranNum += Math.floor(Math.random()*9);

	return ranNum;
}

/*
 * [설명] : 쿠기 생성하기
 * [paramter]
 * 1. cName : 쿠키 저장 이름
 * 2. cValue : 쿠키에 저장 할 값
 * 3. cDay : 쿠키 유효기간
 */
function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

/*
 * [설명] : 쿠기 가져오기
 * [paramter]
 * 1. cName : 쿠키 저장 이름
 */
function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

/*
 * [설명] : 게시판 페이징 작업 하기
 * [paramter]
 * 1. cName : 전체 게시글의 수
 * 2. boardList : 한번에 보여지는 게시글의 수
 * 3. totalPage : 한번에 보여지는 페이지의 수
 * 4. page : 현재 페이지
 * 5. pagingBox : 페이징 그려지는 요소
 */
function paging(total, boardList, totalPage, page, pagingBox) {
	var paging = "<ul>", undo = "", next = "",
		//전체 페이지 수
		pageTotal = total%boardList==0?parseInt(total/boardList):parseInt(total/boardList)+1,
		//한번에 보여지는 페이지들의 수가 몇번 되는지
		pageListNum = pageTotal%totalPage==0?parseInt(pageTotal/totalPage):parseInt(pageTotal/totalPage)+1,
		//한번에 보여지는 페이지들의 수에서 현재가 몇번 째인지
		currentPageListNum = page%totalPage==0?parseInt(page/totalPage):parseInt(page/totalPage)+1,
		//<<의 숫자
		undoPage = page%boardList==0?parseInt(page/boardList)-2:parseInt(page/boardList)-1,
		//>>의 숫자
		nextPage = page%boardList==0?parseInt(page/boardList):parseInt(page/boardList)+1;

	undoPage = undoPage*totalPage+1;
	nextPage = nextPage*totalPage+1;

	for(var i=(currentPageListNum-1)*totalPage;i<(currentPageListNum-1)*totalPage+parseInt(totalPage);i++){
		if(i == pageTotal)
			break;

		if(i == page-1){
			paging += "<li id='"+(i+1)+"' class='active pagingText pointer'>"+(i+1)+"</li>";
			continue;
		}
		paging += "<li id='"+(i+1)+"' class='pagingText pointer'>"+(i+1)+"</li>";
	}

	if(currentPageListNum != 1)
		undo += "<li class='undo_2 pagingText pointer' id='" + undoPage + "'><img src='/images/admin/paging/left_left.jpg'></li>";
	else
		undo += "<li class='undo_2 pagingText pointer' id='1'><img src='/images/admin/paging/left_left.jpg'></li>";
	
	if(page != 1){
		
		undo += "<div class='leftImg pagingText pointer' id='"+(page-1)+"'><img src='/images/admin/paging/left.jpg'></div>";
		undo += "<div class='pagingText pointer' id='"+(page-1)+"'></div>";
	} else {
	
		undo += "<div class='leftImg pagingText pointer' id='1'><img src='/images/admin/paging/left.jpg'></div>";
		undo += "<div class='pagingText pointer' id='1'></div>";
	}
		
	if(pageTotal != page){
		
		if(pageTotal == 0) {
			
			next += "<div class='pagingText pointer' id='1'></div>";
			next += "<div class='rightImg pagingText pointer' id='1'><img src='/images/admin/paging/right.jpg'></div>";
		} else {
			
			next += "<div class='pagingText pointer' id='"+(parseInt(page)+1)+"'></div>";
			next += "<div class='rightImg pagingText pointer' id='"+(parseInt(page)+1)+"'><img src='/images/admin/paging/right.jpg'></div>";
		}
		
	} else {
		
		next += "<div class='pagingText pointer' id='"+pageTotal+"'></div>";
		next += "<div class='rightImg pagingText pointer' id='"+pageTotal+"'><img src='/images/admin/paging/right.jpg'></div>";
	}
		
	if(currentPageListNum != pageListNum) {
	
		if(pageTotal == 0) {
			
			next += "<li class='next_2 pagingText pointer' id='1'><img src='/images/admin/paging/right_right.jpg'></li>";
		} else {
			
			next += "<li class='next_2 pagingText pointer' id='"+nextPage+"'><img src='/images/admin/paging/right_right.jpg'></li>";
		}
		
	}
	else
		next += "<li class='next_2 pagingText pointer' id='"+pageTotal+"'><img src='/images/admin/paging/right_right.jpg'></li>";
	
	if(paging == "<ul>") {
		
		paging += "<li class='active pagingText' id='1'>1</li></ul>";
	} else {
		
		paging += "</ul>";
	}
	
	
	
	var _paging = "<div>";
		_paging += "<div class='left'>"+undo+"</div>";
		_paging += "<div class='middle'>"+paging+"</div>";
		_paging += "<div class='right'>"+next+"</div>";
		_paging += "</div>";
		
	pagingBox.html("").append(_paging);	
}


/*
 * [설명] : input요소에서 enter를 입력 할 경우에 click 이벤트를 발생 시키는 경우
 * [paramter]
 * 1. $input : input요소
 * 2. $clickObject : click 될 요소
 */
function enterClickTrigger($input, $clickObject) {
	
	$input.keypress(function(e) {
		
		 if(e.keyCode==13) {

			 $clickObject.trigger("click");
			 return false;
		 }
	})
}

/*
 * [설명] : checkbox 다중 선택 체크박스의 data에 담긴 내용을 배열로 반환
 * [paramter]
 * 1. $object : checkbox 요소
 * 2. data : checkbox의 data-에 저장 되어 있는 이름
 */
function checkboxArray($object, dataName) {
	
	var _temp = [];
	
	if($object.length == 0) return null;
	
	$object.each(function(k, v) {
		
		_temp[k] = $(v).data(dataName);
	})
	
	return _temp;
}

/*
 * [설명] : 모든 체크박스 체크 
 * [param]
 * 1. a는 전체 클릭 되게 하는 요소
 * 2. b는 a를 클릭 시에 모두 클릭 되야 하는 요소
 */
(function($){
	$.AllCheck = function(a,b){
		
		$(document).on("click",a,function() {
			
			var $b = $(b);
			
			if ($(this).prop("checked")) {
				
				$b.prop("checked", true);
				
			} else {
				
				$b.prop("checked", false);
			}
		});
	};
})(jQuery);


/*
 * [설명] : 모든 체크박스 체크 버튼 
 * [param]
 * 1. a는 전체 클릭 되게 하는 버튼
 * 2. b는 a를 클릭 시에 모두 클릭 되야 하는 요소
 */
(function($){
	$.AllCheckBn = function(a,b){
		
		$(document).on("click",a,function() {
			
			var $b = $(b);
			
			if ($(this).data("check") != "checked") {
				
				$b.prop("checked", true);
				$(this).data("check","checked");
			} else {
				
				$b.prop("checked", false);
				$(this).data("check","nonchecked");
			}
		});
	};
})(jQuery);

/*
 * [설명] : 01012345677로 되어 있는 핸드폰 번호를 010-1234-5678로 바꾸기
 * [param]
 * 1. 핸드폰 번호
 */
function phoneChange(phone) {
	
	if(phone.length == "" || phone.search("null") != -1) {
		
		return "";
	}
		
	phone = phone.replace(phone.substring(0,3),phone.substring(0,3)+"-");
	
	if(phone.length == 10) {
		
		phone = phone.replace(phone.substring(4,7), phone.substring(4,7)+"-");
	} else {
		
		phone = phone.replace(phone.substring(4,8), phone.substring(4,8)+"-");
	}
	
	return phone;
}

/*
 * [설명] : 이벤트 간편하게 사용하기 
 * [param]
 * 1. 요소
 * 2. 이벤트 이름
 * 3. function
 */

var util = {
		
		addEvent: (function(window) {
			
			if(window.addEventListener) {
				
				return function (element, eventName, cb) {
					
					element.addEventListener(eventName, cb);
				}
			} else if(window.attachEvent) {
				
				return function (element, eventName, cb) {
					
					element.attachEvent("on" + eventName, cb);
				}
			} else {
				
				return function (element, eventName, cb) {
					
					element["on" + eventName] = cb;
				}				
			}
		}(window))
}
