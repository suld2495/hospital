var content = '/hospital';
document.write("<script type='text/javascript' src='" + content + "/js/admin/newUtil.js'><"+"/script>");
document.write("<script type='text/javascript' src='" + content + "/js/admin/util.js'><"+"/script>");
document.write("<script type='text/javascript' src='" + content + "'/js/admin/common.js'><"+"/script>");
document.write("<script type='text/javascript' src='" + content + "/lib/editor/js/service/HuskyEZCreator.js' charset='utf-8'><"+"/script>");
document.write("<script type='text/javascript' src='" + content + "'/js/admin/form/jquery.form.min.js'><"+"/script>");



(function($) {
	
	/*-----------------------------  페이지 이동에 대한 처리를 담당 하는 기능  -------------------------------------------------*/
	var defaultPageMoveFun = {
			
			exec: function(that, element) {
				
				var boardNum = $(element).find(".boardNumdata").data("boardnum");
				var $target = $(element);
				
				if($target.hasClass("sn")) {
					
					location.href = that.option.link.view + boardNum;
				} else if($target.hasClass("sy")) {
					
					that.secretPopup(boardNum, "view");
				}
			}
	}
	
	
	var defalutOption = {
			url: content + "/admin/getBoard",
			allCheck: ".allCheck",	//게시글 리스트를 모두 선택 하는 checkbox
			allCheckBn: ".allCheckBn",	//게시글 리스트를 모두 선택 하는 버튼
			check: ".check",	//각각의 게시글 리스트 checkbox
			pagingText: ".pagingText",	//새로운 페이지 호출 이벤트를 발생시키는 요소
			selectSearch: {		//selectSearch는 select로 선택해서 하는 검색을 말함
				use: true,		
				selectGroup: {
					
					selectGroup1: ".selectGroup"
				},
				defaultSelect: ".selectGroup"
			},
			searchType: "select",
			search: {	//text를 입력 해서 하는 검색
				element: ".select",
				bn: ".selectBn",
				scope: "board_subject",
				searchType: ".searchType"
			},
			page: 1,	//페이지
			paging: ".paging",	//페이징 요소
			pagingOption: {},
			type: "table",
			element: ".boardList",	//게시글 출력 하는 요소
			clone: "",	//게시글 리스트를 표현할 클론
			addBoardListCallback: "",
			boardList: 10,	//한번에 보여지는 게시글 수
			totalPage: 10,	//한번에 보여지는 페이징의 수
			boardListChanger: ".boardListChanger",	//한번에 보여지는 게시글의 수 변화시키는 요소
			countDisplay: ".count",	//카운트를 표시하는 곳
			countUnit: "건",		//건, 명 등등
			boardViewMove: ".sampleTr",	//게시글 뷰 페이지로 이동 하기위한 이벤트 걸리 위한 요소
			boardWrite: false,	//글쓰기 페이지인지 여부
			useGallery: true,	//글쓰기 시에 본문에 이미지 업로드 사용 여부
			isQna: false,		//qna 게시판인지확인	
			oEditors: [],		//글쓰기 에디터
			appendixImg: false,	//파일 첨부시에 이미지로 파일 선택 대체 할 것이지 여부
			thumanil: false,	//썸네일 사용 여부
			chatcha: false,		//자동생성방지 사용 여부
			fileSize: 10,		//파일 사이즈 기본값
			thumnailSize: 10,	//썸네일 사이즈 기본값
			fileExt: "php|php3|php4|htm|inc|html|jsp|asp",	//파일 업로드 불가 확장자 리스트
			linkChange: ".linkChange",	//링크가 걸려 있는 건 페이지 이동시에 변경이 되지 않아 데이터의 유효성을 해치게 되므로 링크 href를 변경 하여야 함 그래서 해당 클래스가 있는 링크의 href를 변경
			linkChangeString: {					//링크 변경 시에 적용 되는 파라미터 이름(주의 점은 링크에서 동적 파라미터가 들어가는 부분을 뒤에 몰아서 적어야 함)
					board_num: "boardNum"
			},
			movie: false,		//스마트 에디터를 통해 동영상 업로드 할지 여부
			pageMoveFun: defaultPageMoveFun,	//페이지 이동에 대한 처리
			popup: {
				
			}
	}
	
	function Board() {
		
		this.$element = null;
		this.option = null;
	}
	
	Board.prototype.init = function(selector, option) {
		
		if(selector == undefined) {
			
			return;
		}
		
		/*
		 * 변수 선언 
		 */
		this.$element = selector;
		this.option = option;
		this.option.element = selector;
		
		//게시글 리스트 클론 만들기
		var $sampleTr = $(".sampleTr").eq(0);
		this.option.clone = $sampleTr.clone().removeClass("none");
		
		//page 설정
		if(option.page != null && !isNaN(option.page) && option.page != "") {
			
			defalutOption.page = option.page;
		}
		
		/*
		 * 초기화 함수 실행
		 */
		
		var pagingOption = $.extend(null, option.pagingOption);
		pagingOption.total = this.option.total;
		pagingOption.boardList = this.option.boardList;
		pagingOption.totalPage = this.option.totalPage;
		pagingOption.page = defalutOption.page;
		
		$.paging(pagingOption);
		
		/*
		 * 뒤로보기 한 경우에 기존에 보던 페이지 보기
		 * 
		 */
		this.checkForHash();
		
		//전체 선택	
		this.allCheck();
		
		//이벤트 실행
		this.initEvent();
		
		//글쓰기 페이지 인가
		if(this.option.boardWrite) {
			
			this.boardWriteInit();
		}
		
		//글쓰기 init
		this.writeInit();
		
		//게시글 뷰 init
		this.viewInit();
	}
	
	Board.prototype.initEvent = function() {
		
		var that = this;
		
		//새로운 페이지 호출
		$(document).on("click", this.option.pagingText, function() {
			
			defalutOption.page = $(this).attr("id");
			
			that.pageMove(that, {}, this);
		});
		
		//text 입력 검색
		$(this.option.search.bn).on("click", function() {
			
			if(that.option.searchType == "checkbox") {
				
				if(!that.searchTypeChChange(that)) {
					
					return;
				}
			}
			
			that.selectClick(that, this);
		});

		//검색시에 enter로 검색 하기
		$(this.option.search.element).on("keypress", function(e) {
			
			if(e.keyCode==13) {
				 $(that.option.search.bn).trigger("click");
			 }
		});
		
		//select로 검색
		$(this.option.selectSearch.defaultSelect).on("change", function() {
			
			that.selectSearchClick(that, this);
			
		});
		
		//한번에 보여지는 게시글의 수 변경
		$(this.option.boardListChanger).on("change", function() {
			
			that.boardListChange(that, this);
		});
		
		//text 검색 조건 변경(제목-> 내용 이런 식)
		$(this.option.search.searchType).on("change", function() {
			
			that.searchTypeChange(that, this);
		});
		
		//게시글 뷰 페이지로 이동
		$(document).on("click", this.option.boardViewMove, function() {
			
			that.boardViewMove(that, this);
		});
		
		//팝업 닫기
		$(document).on("click", ".popupClose", function() {
			
			that.popupClose(that, this);
		});
		
		//비밀글 확인 버튼 누르기(삭제, 수정, 비밀글 보기)
		$(document).on("click", ".secretBn", function() {
			
			that.secretClick(that, this);
		});
		
		var className = this.$element.context.className.split(" ");
		
		//삭제 버튼 클릭
		$(document).on("click", "." + className[0] + " .updateBoard", function() {
			
			that.updateClick(that, this);
		});
		
		//단체 삭제 버튼 클릭
		$(document).on("click", ".boardsDelete", function() {
			
			that.boardsDelete(that);
		});
	}
	
	//뒤로가기 한 경우 기존에 보던 페이지 볼 수 있도록 하기
	Board.prototype.checkForHash = function() {
		
		if(document.location.hash) {
			
			var HashLocationName = document.location.hash;
			HashLocationName = HashLocationName.replace("#", "");
			
			defalutOption.page = HashLocationName;
			
			this.pageMove(this, {});
		} 
	}
	
	//글쓰기 페이지 일 때 초기화 함수
	Board.prototype.boardWriteInit = function() {
	
		var skinURI = content + "/lib";
		
		if(this.option.useGallery) {
			
			if(this.option.movie) {
				
				skinURI += "/editor/SmartEditor2SkinMovieUse.html";
			} else{
				
				skinURI += "/editor/SmartEditor2Skin.html";
			}
		} else {
			
			skinURI += "/editor/SmartEditor2SkinNoImage.html";
		}
		
		var $board_content = $(".board_content");
		
		if($board_content.length !== 0) {
			
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: this.option.oEditors,
			    elPlaceHolder: "board_content",
			    sSkinURI: skinURI,
			    fCreator: "createSEditor2"
			});
		}
	}	
	
	//페이지 호출 콜백 함수
	Board.prototype.pageMove = function(that, data, element) {
		
		document.location.hash = "#" + defalutOption.page;
		
		
		var $search = $(that.option.search.element);
		var $selectSearch = $(that.option.selectSearch.defaultSelect);
		
		if(that.option.selectSearch.use) {
			
			 $.each($selectSearch, function() {

				 var $target = $(this);
				 var $targetSelected = $target.find("option:selected");
				 
				 if($targetSelected.val() !== "0" && $targetSelected.val() !== "all") {

					 data[$target.data("query")] = $targetSelected.val();
				 }
			 });
		}
		
		if($search.val()) {

			var string = that.option.search.scope;
			data.search = $search.val();
			data.searcharray = string;
		}
		
		that.searchAjax(data);
	}
	
	//text 검색
	Board.prototype.selectClick = function(that, element) {
		
		var $select = $(that.option.search.element);
		
		if(!$select.val()) {
			
			alert("검색어를 입력 해 주세요");
			$select.focus();
			return;
		}
		
		defalutOption.page = 1;
		that.pageMove(that, {});
	}
	
	//select로 검색 변경
	Board.prototype.selectSearchClick = function(that, element) {
		
		var $target = $(element);
		var select = $target.data("select");
		
		$.each($(that.option.selectSearch.defaultSelect).not("." + select), function() {
			
			$(this).find("option").eq(0).prop("selected", true);
		});
		
		defalutOption.page = 1;
		that.pageMove(that, {});
	}
	
	//한번에 보여지는 게시글의 수 변경
	Board.prototype.boardListChange = function(that, element) {
		
		defalutOption.page = 1;
		that.option.boardList = $(element).find("option:selected").val();
		that.pageMove(that, {});
	}
	
	//text 검색에서 검색 조건 변경(select 사용시)
	Board.prototype.searchTypeChange = function(that, element) {
		
		that.option.search.scope = $(element).find("option:selected").val();
	}
	
	//text 검색에서 검색 조건 변경(checkbox 사용시)
	Board.prototype.searchTypeChChange = function(that) {
		
		var $searchTypeCh = $(".searchTypeCh:checked");
		var length = $searchTypeCh.length;
		var value = "";
		var i;
		
		if(length === 0) {
			
			alert("검색 조건을 선택 해 주세요");
			return false;
		}
		
		for(i = 0 ; i < length ; i += 1) {
			
			value += $searchTypeCh.eq(i).val();
			
			if(i != (length - 1)) {
				
				value += "|";
			}
		}
		
		that.option.search.scope = value;
		
		return true;
	}
	
	//게시글 뷰로 이동하기
	Board.prototype.boardViewMove = function(that, element) {
		
		that.option.pageMoveFun.exec(that, element);
	}
	
	//게시글 삭제 하기
	Board.prototype.updateClick = function(that, element) {
		
		var $target = $(element);
		var boardNum = $target.data("boardnum");
		
		if($target.hasClass("admin")) {
			
			that.secretClick(that, $target);
		} else {
			
			that.secretPopup(boardNum, $target.data("type"));
		}
	}
	
	//게시글 단체로 삭제하기
	Board.prototype.boardsDelete = function(that) {
		
		var $check = $(".check:checked");
		var boardarray = checkboxArray($check, "num");
		var data = {};
		
		if($check.length == 0) {
			
			alert("대상을 선택 해 주세요");
			return;
		}
		
		data.boardarray = boardarray;
		data.tableName = that.option.tableName;
		data.board_type = "delete";
		
		that.secretDelete(data, that);
	}
	
	Board.prototype.secretPopup = function(boardNum, type) {
		
		var html = [];
		
		html.push("<div class='cover'></div>")
		html.push("<div class='popup passwordPopup'>");
			html.push("<div class='twoPasswordTop'><img src='/images/board/rock.png'></div>");
			html.push("<div class='twoPasswordBottomText'><span>비밀번호 <span class='twoPasswordTopSpan'>확인</span></span></div>");
			html.push("<div class='twoPasswordBottomText2'><p>Password check</p></div>");
			html.push("<div class='twoPasswordMiddel'><div><input type='password' placeholder='비밀번호' class='passPopupInput'></div></div>");
			html.push("<div class='popupClose pointer'><img src='images/board/cancle.jpg'></div>");
			html.push("<div class='secretBn pointer twoPasswordBottomBn' data-boardNum='" + boardNum + "' data-type='" + type + "'><img src='images/board/check.jpg'></div>");
		html.push("</div>");
		
		$("body").append(html.join(""));
	}
	
	//팝업 닫기
	Board.prototype.popupClose = function(that, element) {
		
		var $popupContainer = $(element).parents(".popup");
		var $cover = $(".cover");
		
		$popupContainer.remove();
		$cover.remove();
	}
	
	//비밀글 확인창 누르기
	Board.prototype.secretClick = function(that, element) {
		
		var $target = $(element);
		var $passPopupInput = $(".passPopupInput");
		var data = {};
		
		data.board_password = $passPopupInput.val();
		data.board_num = $target.data("boardnum");
		data.tableName = that.option.tableName;
		data.board_type = $target.data("type")
		
		if (data.board_password === "") {
			alert("비밀번호를 입력 해 주세요.");
			return false;
		}
		
		that.secretDelete(data, that);
	}
	
	//삭제 하기
	Board.prototype.secretDelete = function(data, that) {
		
		$.simpleAjax({
			url: content + "/admin/board/delete",
			data: data,
			fun: that.boardSecretViewFn,
			that: this
		});
	}
	
	//서버에 리스트 호출
	Board.prototype.searchAjax = function(data) {
		
		data.page = defalutOption.page;
		data.boardList = this.option.boardList;
		data.tableName = this.option.tableName;
		
		if(data.board_use == null) {
			
			data.board_use = this.option.board_use;
		}
		
		if(this.option.isQna) {
			
			data.qna = true;
		}
		
		if(this.option.order != null) {
			
			data[this.option.order.query] = this.option.order.direction;
		}
		
		var option = {
				url: this.option.url,
				data: data,
				fun: this.searchAjaxFn,
				that: this
		}
		
		$.simpleAjax(option);
	}
	
	//게시글 리스트 호출 콜백 함수
	Board.prototype.searchAjaxFn = function(data, that) {
		
		var $list = that.option.element;
		var $appendElement;
		var length = data.list.length;
		var i, img, imgroot, temp;
		var $count = $(that.option.countDisplay);
		var img, imgroot;
		
		if(that.option.type === "table") {
			
			$appendElement = $list.find("tbody");
		} else if(that.option.type === "gallery") {
			
			$appendElement = $list;
		}
		
		$appendElement.children().remove();
		
		if(length > 0) {
			
			for(i = 0; i < length; i = i + 1) {
				
				temp = that.option.clone.clone();
				
				$appendElement.append(temp);
				
				$.each(data.list[i], function(key, value) {
					
					var $column = temp.find("[class ~='" + key + "']");
					var $columnData = temp.find("[class ~='" + key + "data']");
					
					if(key == "thumnail") {
						
						img = value;
						return;
					}
					
					if(key == "boardPath") {
						
						imgroot = value;
						return;
					}
					
					if(key == "boardSecret") {
						
						temp.removeClass("sy sn")
						 	.addClass("s" + value);
						
						return;
					}

					if (key === "status") {
						if (value === 'N') {
							value = "정상";
						} else {
							value = "삭제";
						}
					}

					$column.html(value);
					$columnData.data(key.toLowerCase(), value);
				});
				
				temp.find(".imageroot").attr("src", content + "/" + data.uploadPath + "/" + img);
			}
		}
		
		if(that.option.addBoardListCallback) {
			
			that.option.addBoardListCallback(data);
		}
		
		var $linkChange = $(that.option.linkChange);
		
		$.each($linkChange, function() {
			
			var $target = $(this);
			var link = $target.attr("href");
			
			var linkFirst = "";	//링크에서 파라미터 앞에 주소를 담기 위한 것
			var linkArray = {};	//파라미터 값 담기 위한 것
			var min = 0;	//파라미터 앞에 존재하는 url을 담기 위해 사용 되는 것으로 min이 가장 적은 곳까지 url을 뽑아 내기 위한 것
			var linkResult = "";	//최종 링크 저장	
			
			$.each(that.option.linkChangeString, function(key, value) {
				
				var urlNum = link.search(key);
				var data;
				var seperate = "td";	//부모의 요소
				
				if(urlNum == -1) {
					
					return;
				}
				
				if(min == 0 || urlNum < min) {
					
					linkFirst = link.substr(0, urlNum);
					min = urlNum;
				}
				
				if(that.option.isGallery) {
					
					seperate = "li";
				}
				
				data = $target.parents(seperate).find("." + value + "data").data(value.toLowerCase());
				
				linkArray[key] = key + "=" + data;
			});

			linkResult = linkFirst;
			
			$.each(linkArray, function(key, value) {
				
				linkResult += value + "&"; 
			});
			
			
			$target.attr("href", linkResult);
		});
		
		$count.html(data.total);
		
		$.paging({
			total: data.total,
			boardList: that.option.boardList,
			totalPage: that.option.totalPage,
			page: defalutOption.page
		});
	}
	
	//패스워드 일치 여부 확인 콜백함수
	Board.prototype.boardSecretViewFn = function(data, that) {
		
		if(data.num == 0) {
			
			alert("비밀번호가 틀렸습니다.");
		} else {
		
			if(data.board_type == "view") {
				
				var uri = data.board_num;

				var html = [];
				
				html.push("<form id='commonForm' name='commonForm'></form>");
				
				$("body").append(html.join(""));
				
				var comSubmit = new ComSubmit();

				
				comSubmit.setUrl(that.option.link.view + uri);
		        comSubmit.addParam("pass", "pass");
		        comSubmit.addParam("page", defalutOption.page);
		        comSubmit.submit();
			} else if(data.board_type == "delete") {
				
				alert("삭제 되었습니다.");
				location.href = that.option.link.list;
			} else if(data.board_type == "modify") {
				
				var uri = data.board_num;

				var html = [];
				
				html.push("<form id='commonForm' name='commonForm'></form>");
				
				$("body").append(html.join(""));
				
				var comSubmit = new ComSubmit();

				comSubmit.setUrl(that.option.link.modify + "&board_num=" + data.board_num);
		        comSubmit.addParam("pass", "pass");
		        comSubmit.submit();
			}
		}
	}
	
	
	//전체 클릭
	Board.prototype.allCheck = function() {
		
		var allCheck = this.option.allCheck;
		var allCheckBn = this.option.allCheckBn;
		var check = this.option.check;
		
		$.AllCheck(allCheck, check);
		$.AllCheckBn(allCheckBn, check);
	}
	
	
	
	
	
	/*
	 * 게시글 쓰기 관련 
	 * 
	 * 
	 * 
	 */
	
	Board.prototype.writeInit = function() {
		
		var $file = $(".fileDiv");
		
		this.fileClone = $file.clone().last();
		
		//브라우저의 파일 선택 디자인 대신 이미지로 대체 할 경우
		if(this.option.appendixImg) {
			
			this.appendixImg();
		}
		
		
		//글쓰기 이벤트
		this.writeEvent();
	}
	
	Board.prototype.writeEvent = function() {
		
		var that = this;
		
		//첨부파일 선택시에 자동으로 첨부파일 새로 추가기능
		$(document).on("change",".fileDiv input[type='file']",function(e) {
		
			that.appendixAdd(that, this);
		});
		
		//전송 클릭
		$(document).on("click", ".submitBn", function() {
			
			/*if(that.option.chatcha) {
				
				that.chatchaCheck(that, this);
			} else {
				
				
			}*/
			that.boardWriteSubmit(that, this);
		});
		
		//리셋버튼 클릭
		$(document).on("click", ".resetBn", function() {
			
			that.reset(that, this);
		});
		
		//비밀글 설정 시에 비밀글 아니오는 display:none 되어 있기에 비밀글 설정 예로만 toggle 기능 되도록 하는 것
		$(document).on("click", ".board_secret", function() {
			
			that.board_secret(that, this);
		});
		
		//비밀글 설정 시에 비밀글 아니오는 display:none 되어 있기에 비밀글 설정 예로만 toggle 기능 되도록 하는 것
		$(document).on("click", ".board_secret_no", function() {
			
			that.board_secret_no(that, this);
		});
		
		
		//게시글 수정시에 내용 부분 클릭시에 에디터에 입력 되도록하기
		$(document).on("click", ".boardContent", function() {
			
			that.contentInsert(that, this);
		});
		
		//첨부파일 삭제
		$(document).on("click", ".deleteAppendix", function() {
			
			that.deleteAppendix(that, this);
		});
		
		//썸네일 클릭
		$(document).on("change", ".thumnail_input", function() {
			
			that.thumnailClick(that, this);
		});
		
		//동영상 업로드
		$(document).on("change", ".board_movie", function() {
			
			that.movieInput(that, this);
		});
	}
	
	//첨부파일 선택 시 자동으로 첨부파일 새로 추가기능
	Board.prototype.appendixAdd = function(that, element) {
		
		var $target = $(element);
		
		var $file = $(".fileDiv input[type='file']");
		
		//파일용량 체크
		if(that.fileSize($target.get(0), that.option.fileSize)) return;
		
		//파일 확장자 체크
		if(that.fileExt($target, that.option.fileExt)) {
			
			var ext = that.option.fileExt.split("|");
			var msg = ext.join(", ")
			
			$target.val("");
			
			alert(msg + "확장자는 사용 불가능 합니다.");
			return;
		}
		
		if($target.val() != "") {
			
			//첨부파일 업로드 시에 파일 이름 표시 하는 것
			$target.nextAll(".fileNameSpan").find("span").html($.filenameExtract($target.val()));

			//첨부파일을 수정 한 경우
			var update = getParameterByName("update");
			
			if(update == "modify") {
				
				var num = $target.attr("name").substr($target.attr("name").length - 1);
				
				var fileName = $(".file" + num).html();
				
				if(fileName != "") {
					
					var $type = $("input[name='type" + num + "']");
					
					if($type.val() != "add") {
						
						$type.val("modify");
					}
				} 
			}
			
			
			var empty = 0;
			
			//첨부파일 비어 있는 게 존재 할 경우 첨부파일을 새로 추가 하지 않기 위한 것
			$.each($file, function(k, v) {
				
				if($(v).val() == ""){
					
					if($(v).siblings("input[name *= 'before']").val() == null || $(v).siblings("input[name *= 'before']").val() == "") {
						
						empty++;
					}
					
				}
			})						
			
			if(empty > 0) {
				
				return;
			} 
			
			var $fileDiv = $(".fileDiv").last();
			
			var _clone = that.fileClone.clone();
			_clone.find("input").attr("name","file" + ($file.length + 1));
			_clone.find(".add").attr("name","type" + ($file.length + 1));
			
			if ($target.get(0).title !== "none") {
				$fileDiv.after(_clone);
			}
			
		}
	}
	
	//파일 사이즈 체크
	Board.prototype.fileSize = function(file, max) {
		
			var maxSize = max * 1024 * 1024;
			var fileSize = 0;
			
			var browser=navigator.appName;
			
			if (browser=="Microsoft Internet Explorer")
			{
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}
			// 익스플로러가 아닐경우
			else
			{
				var length = file.files.length;
				if(length == 0) {
					
					return false;
				} else {
				
					fileSize = file.files[0].size;
				}
			}
			
			if(maxSize < fileSize) {
				
				alert("파일용량은 " + max + "M이하만 업로드 가능합니다.");
				$(file).val("");
				$(file).siblings(".fileNameSpan").find("span").html("");
				return true;
			}
			
			return false;
	}
	
	//파일 용량 체크(true면 위험 파일 확장자 포함한다는 것)
	Board.prototype.fileExt = function(file, sampleExt) {

		var filename = file.val().split(".");
		var fileExt = filename[filename.length - 1];
		var ext = sampleExt.split("|");
		var length = ext.length;
		var i;
		
		for(i = 0;i < length;i += 1) {
			
			if(fileExt == ext[i]) {
				
				return true;
			}
		}
		
		return false;
		
	}
	
	//자동생성방지에서 통과 여부 확인
	Board.prototype.chatchaCheck = function(that) {
		
		var response = grecaptcha.getResponse(widgetId1);
		
		if(response != "") {
			
			$.simpleAjax({
				url: "/captchaCheck.do",
	   			data: {token: response},
	   			fun: that.chatchaCheckFn,
	   			that: that,
	   			async: false
			})
		} else {
			
			alert("자동생성방지를 실행해 주세요");
		}
	}
	
	Board.prototype.chatchaCheckFn = function(data, that) {
		
		var $submit = $(".submit");
		
		var success = JSON.parse(data);
		
		if(success.success) {
			
			alert("작성 되었습니다.");
			
			$submit.submit();
		} else {
			
			alert("오류가 발생 하여 현재 게시글 작성이 불가합니다. 고객센터에 연락 해 주시기 바랍니다.");
		}
	}
	
	//글쓰기
	Board.prototype.boardWriteSubmit = function(that, element) {
		
		var isModify = getParameterByName("update");
		
		var $submit = $(".submit");
		
		var $board_content = $(".board_content");
		
		if($board_content.length !== 0 ) {
			
			that.option.oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
		}
		
		var $board_subject = $(".board_subject");
		var $board_subject2 = $(".board_subject2");
		var $board_writer = $(".board_writer");
		var $board_content = $(".board_content");
		var $board_password = $(".board_password");
		var $board_work = $(".board_work");
		var $board_work_date = $(".board_work_date");
		var $board_company = $(".board_company");
		var $edu_time = $(".edu_time");
		var $edu_start = $(".edu_start");
		var $course_time = $(".course_time");
		
		var $test_date = $(".test_date");
		var $licence = $(".licence");
		var $application_period = $(".application_period");
		var $notice = $(".notice_date");
		var $agency = $(".agency");

		var $headline = $(".headline");
		var $phone = $(".phone");
		var $email = $(".email");
		
		var subject_length = $board_subject.length;
		var subject_length2 = $board_subject2.length;
		var writer_length = $board_writer.length;
		var password_length = $board_password.length;
		var work_length = $board_work.length;
		var work_date_length = $board_work_date.length;
		var company_length = $board_company.length;
		var edu_time_length = $edu_time.length;
		var edu_start_length = $edu_start.length;
		var course_time_length = $course_time.length;
		
		var test_date_length = $test_date.length;
		var licence_length = $licence.length;
		var application_period_length = $application_period.length;
		var notice_length = $notice.length;
		var agency_length = $agency.length;
		
		var headline_length = $headline.length;
		var phone_length = $phone.length;
		var email_length = $email.length;
		
		if(subject_length) {
			
			if(isEmptyAlert($board_subject)) return;
		}
		
		if(subject_length2) {
			
			if(isEmptyAlert($board_subject2)) return;
		}
		
		if(writer_length) {
			
			if(isEmptyAlert($board_writer)) return;
		}

		
		if(headline_length) {
			
			var value = $headline.find("option:selected").val();
			
			if(value == "0") {
				
				alert("말머리를 선택 해 주세요");
				return;
			}
		}
		
		if(phone_length) {
			
			if(isEmptyAlert($phone)) return;
		}
		
		if(email_length) {
			
			if(isEmptyAlert($email)) return;
		}
		
		if(password_length) {
			
			if(isEmptyAlert($board_password)) return;
		}

		if(work_length) {
			
			if(isEmptyAlert($board_work)) return;
		}
		
		if(work_date_length) {
			
			if(isEmptyAlert($board_work_date)) return;
		}
		
		if(company_length) {
			
			if(isEmptyAlert($board_company)) return;
		}

		if(edu_time_length) {
			
			if(isEmptyAlert($edu_time)) return;
		}
		
		if(edu_start_length) {
			
			if(isEmptyAlert($edu_start)) return;
		}
		
		if(course_time_length) {
			
			if(isEmptyAlert($course_time)) return;
		}
		
		if(test_date_length) {
			
			if(isEmptyAlert($test_date)) return;
		}
		
		if(licence_length) {
			
			if(isEmptyAlert($licence)) return;
		}
		
		if(application_period_length) {
			
			if(isEmptyAlert($application_period)) return;
		}
		
		if(notice_length) {
			
			if(isEmptyAlert($notice)) return;
		}
		
		if(agency_length) {
			
			if(isEmptyAlert($agency)) return;
		}

		
		if(isModify == "write") {
			
			if($board_content.length !== 0 ) {
				
				if($board_content.val().replace("<p>","").replace("</p>","").replace("<br>","") == "") {
					
					alert("내용을 입력 해 주세요");
					$board_content.focus();
					return;
				}
			}	
		} else {
			if ($('.boardContent').length) {
				$('#board_content').val($('.boardContent').text());
			}
		}
		
		var $thumnail_input = $(".thumnail_input");
		var thumnail_length = $thumnail_input;
		
		if(thumnail_length) {
			
			//썸네일이 존재 하지 않으면 form에서 삭제
			if(!$thumnail_input.val()) {
				
				$thumnail_input.remove();
			}
		}
			
		var $file = $(".fileDiv input[type='file']");
		
		$.each($file, function(k, v) {
			
			if($(v).val() == "") {
				
				$(v).next("input").remove();
				$(v).remove();
			}
		});
		
		if(defalutOption.chatcha) {
			
			that.chatchaCheck(that);
		} else{
			
			alert("작성 되었습니다.");
			
			$submit.submit();
		}
		
		
	}
	
	//리셋 하기
	Board.prototype.reset = function(that, element) {
		
		var $reset = $(".resetFn");
		
		var $submit = $(".submit");
		
		var $board_content = $(".board_content");
		var content_length = $board_content.length;
		
		$.each($submit.find("input"),function(k,v) {
			
			if($(v).attr("type") == "hidden") {
				
				return;
			}
			
			$(v).val("");
		});
		
		if(that.isAppendix) {
			
			var $file = $(".fileDiv input[type='file']");
			
			$.each($file, function(k, v) {
				
				$(v).val("");
			})			
		}
		
		that.option.oEditors.getById["board_content"].exec("SET_CONTENTS", [""]);
		
		if(content_length) {
			
			$board_content.html("");
		}
		
	}
	
	//비밀글 토글 기능 만들기
	Board.prototype.board_secret = function(that, element) {
		
		var $board_secret_no = $(".board_secret_no");
		var $target = $(element);
		
		var checked = $target.is(":checked")
		
		$board_secret_no.prop("checked", !checked);
	}

	//비밀글 토글 기능 만들기
	Board.prototype.board_secret_no = function(that, element) {
		
		var $board_secret_no = $(".board_secret");
		var $target = $(element);
		
		var checked = $target.is(":checked")
		
		$board_secret_no.prop("checked", !checked);
	}
	
	//첨부파일, 썸네일 파일 선택을 이미지로 대체
	Board.prototype.appendixImg = function() {
		
		$(document).on("click", this.option.appendixImg, function() {
			
			var $input = $(this).parents("p").children("input");
			
			$input.trigger("click");
		});
		
		$(document).on("click", ".thumnailImg",function() {
			
			var $input = $(this).parents("div").children("input");
			
			$input.trigger("click");
		});
	}
	
	Board.prototype.imgAdd = function(temp) {
		
		var info = $.filenameExt(temp);
		var sHTML;
		
		if(info.ext === "mp4") {

			var $thumnail = $(".board_img");
			$thumnail.val("th" + info.filename + "." + "png");
			
			sHTML = "<video src='" + temp + "' controls></viedo>";
		} else {
			
			sHTML = "<img src='" + temp + "'>";
		}
		
		this.option.oEditors.getById["board_content"].exec("PASTE_HTML", [sHTML]);
	}
	
	Board.prototype.deleteAppendix = function(that, element) {
		
		var $target = $(element);
		var $targetParent = $target.parents(".fileDiv");
		var num = $target.data("num");
		var $type = $("input[name='type" + num + "']");
		
		$type.val("delete");
		
		$targetParent.hide();
		$targetParent.find("input[type=file]").remove();
	}
	
	Board.prototype.thumnailClick = function(that, element) {
		
		var fileExt = "jpeg|jpg|png|gif";
		
		var $target = $(element);
		
		//파일용량 체크
		if(that.fileSize($target.get(0), that.option.thumnailSize)) return;
		
		//파일 확장자 체크
		if(!that.fileExt($target, fileExt)) {
			
			var ext = fileExt.split("|");
			var msg = ext.join(", ")
			
			$target.val("");
			
			alert(msg + "확장자는 사용 불가능 합니다.");
			return;
		}
		
		if($target.val() != "") {
			
			//첨부파일 업로드 시에 파일 이름 표시 하는 것
			$target.nextAll(".fileNameSpan").find("span").html($.filenameExtract($target.val()));
		}
	}
	
	//동영상 업로드
	Board.prototype.movieInput = function(that, element) {
		
		var form = "<form id='movie_form' method='post' enctype='multipart/form-data' action='/movieUpload.do'><form>";

		$("body").append(form);
		
		var $movie_form = $("#movie_form");
		
		$movie_form.append($(element).clone());
		
		var options = {
			dataType: "json",
			success: function(responseText) {
			
				if(that.option.movieThumnail) {
					
					
				} else {
					
					
				}
			}
		}
		
		$movie_form.ajaxForm(options).submit();			
	}
	
	/*
	 * 게시글 뷰 관련 내용 
	 * 
	 * 
	 */
	Board.prototype.viewInit = function() {
		
		//뷰 이벤트
		this.viewEvent();
	}
	
	Board.prototype.viewEvent = function() {
		
		var that = this;
		
		//첨부파일 다운로드 리스트 열기
		$(document).on("click", ".appendixSpan", function() {
			
			that.downListOpen(that, this);
		});
		
		//파일 다운로드
		$(document).on("click", ".download", function() {
			
			that.fileDown(that, this);
		});
	}
	
	//첨부파일 다운로드 리스트 열기
	Board.prototype.downListOpen = function(that, element) {
		
		var $appendixReal = $(".appendixReal ul");
		
		$appendixReal.toggleClass("none");
	}
	
	//첨부파일 다운 받기
	Board.prototype.fileDown = function(that, element) {
		
		var $target = $(element);
		
		var filename = $target.data("filename");
		var originFilename = $target.data("origin");
		
		var html = [];
		
		html.push("<form id='commonForm' name='commonForm'></form>");
		
		$("body").append(html.join(""));
		
        var comSubmit = new ComSubmit();
        
        comSubmit.setUrl("/fileDownload.do");
        comSubmit.addParam("filename", filename);
        comSubmit.addParam("originFilename", originFilename);
        comSubmit.submit();
        
        $("#commonForm").remove();
	}
	
	//게시글 수정 시에 내용 부분 클릭 시에 에디터로 내용 전송
	Board.prototype.contentInsert = function(that, element) {
		
		var $target = $(element);
		var editorId = "board_content";
		var oEditors = that.option.oEditors;
		
		if($target.html() != "") {
			
			if(oEditors.length != 0) {
				
				oEditors.getById[editorId].exec("SET_CONTENTS", [$target.html()]);
			} else {
				
				return;
			}
			
		} 
		
		$target.remove();
		
		var oSelection = oEditors.getById[editorId].getEmptySelection(); 
		oSelection.selectNodeContents(oEditors.getById[editorId].getWYSIWYGDocument().body); 
		oSelection.collapseToEnd(); // 끝(최하단)으로 이동 
		oSelection.select(); 
		oEditors.getById[editorId].exec("FOCUS");
	}
	
	
	/*
	 *  [내용] : 게시글의 순서 변경하기
	 *  [파라미터]  
	 *  	a : 위쪽 요소
	 *  	b : 아래쪽 요소
	 */
	
	Board.prototype.boardOrderChange = function(a, b) {
		
		var aLength = a.length;
		var bLength = b.length;
		
		var $aBoardOrderdata = a.find(".boardOrderdata");
		var $bBoardOrderdata = b.find(".boardOrderdata");
		
		var aOrderNum = $aBoardOrderdata.data("boardorder");
		var bOrderNum = $bBoardOrderdata.data("boardorder");
		
		var $top = a.prev();
		var topLength = $top.length;	
		
		if(!aLength) {
			
			alert("가장 위 입니다.");
			return;
		}
		
		if(!bLength) {
			
			alert("가장 아래 입니다.");
			return;
		}
		
		$aBoardOrderdata.data("boardorder", bOrderNum);
		$bBoardOrderdata.data("boardorder", aOrderNum);
		
		if(topLength === 0) {
			
			var $top = a.next();
		}
		
		b.after(a);

		if(topLength === 0) {
			
			$top.before(b);
		} else {
			
			$top.after(b);
		}
	}
	
	//변경된 출력 순서 저장하기
	Board.prototype.orderArrowSubmit = function() {
		
		var $check = $(".check");
		var $tr = $(this.option.boardViewMove);
		
		var url = content + "/admin/newOrderChange";
		var data = {};

		var value = [];
		var length = $check.length;
		
		var _temp;
		
		for(var i = 0; i < length; i += 1) {
			
			_temp = {};
			
			_temp.order = $tr.eq(i).find(".boardOrderdata").data("boardorder");
			_temp.board_num = $tr.eq(i).find(".boardNumdata").data("boardnum");
			
			value[i] = JSON.stringify(_temp);
		}
		
		data.order = value.toString();
		data.tableName = this.option.tableName;

		var fun = this.orderArrowSubmitFn;
		
		$.simpleAjax({
			url: url,
			data: data,
			fun: fun
		});
		
	}
	
	Board.prototype.orderArrowSubmitFn = function() {
		
		alert("변경 되었습니다.");
		
		location.reload();
	}
	
	
	Board.prototype.pageMoveFunChange = function(pageMoveFun) {
	
		this.option.pageMoveFun = pageMoveFun;
	}
	
	
	
	

	
	
	$.fn.boardCreate = function(option) {
		
		var result = $.extend(null, defalutOption, option);
		
		if(option.chatcha != null) {
			
			defalutOption.chatcha = option.chatcha;
		}
		
		this.each(function() {
			
			var $target = $(this);
			
			var board = new Board();
			board.init($target, result);
			
			$target.data("board", board);
		});
		
		return this;
	}
	
	$.fn.imgAdd = function(img) {
		
		this.each(function() {
			
			var $target = $(this);
			var board = $target.data("board");
			
			if(board) {
				
				board.imgAdd(img);
			}
		});
	}
	
	$.fn.boardOrderChange = function(a, b) {
		
		this.each(function() {
			
			var $target = $(this);
			var board = $target.data("board");
			
			if(board) {
				
				board.boardOrderChange(a, b);
			}
		});
	}
	
	$.fn.orderArrowSubmit = function() {
		
		this.each(function() {
			
			var $target = $(this);
			var board = $target.data("board");
			
			if(board) {
				
				board.orderArrowSubmit();
			}
		});
	}
	
	$.fn.pageMoveFun = function(fun) {
		
		this.each(function() {
			
			var $target = $(this);
			var board = $target.data("board");
			
			if(board) {
				
				board.pageMoveFunChange(fun);
			}
		});
	}
})(jQuery);


