/*
 * ajax 간단하게 사용하기 
 * 
 */
(function($) {
	
	$.ajaxOption = {
			
			type: "post",
			dataType: "json",
			fun: "",
			that: "",
			data: {},
			async: true,
	}
	
	$.simpleAjax = function(option) {
		
		var result = $.extend(null, $.ajaxOption, option);
		
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			url: result.url,
			type: result.type,
			dataType: result.dataType,
			data: result.data,
			async: result.async,
			success: function(data) {
				
				if(result.fun) {
					
					if(result.that) {
						
						result.fun(data, result.that);
					} else {
						
						result.fun(data);
					}
						
				}
			},
			error: function(a,b,c) {
				alert(a + " : " + b + " : " + c);
			}
		});
	}
})(jQuery);

/*
 * 페이징 사용하기
 *  
 * 
 */
(function($) {
	
	$.pagingOption = {
			
			paging: ".paging",
			prevPrev 	: "/images/paging/left_left.jpg",
			prev		: "/images/paging/left.jpg",
			nextNext 	: "/images/paging/right_right.jpg",
			next		: "/images/paging/right.jpg"
	}
	
	$.paging = function(option) {
		
		$.extend($.pagingOption, option);
	
		if(option.total == undefined) {
			
			return;
		}
		
		var $paging = $($.pagingOption.paging);
		
		var total = parseInt(option.total);
		var boardList = parseInt(option.boardList);
		var totalPage = parseInt(option.totalPage);
		var page = parseInt(option.page);
		
		var paging = "<ul>", undo = "<ul>", next = "<ul>";
		//전체 페이지 수
		var pageTotal = total%boardList==0?parseInt(total/boardList):parseInt(total/boardList)+1;
		//한번에 보여지는 페이지들의 수가 몇번 되는지
		var pageListNum = pageTotal%totalPage==0?parseInt(pageTotal/totalPage):parseInt(pageTotal/totalPage)+1;
		//한번에 보여지는 페이지들의 수에서 현재가 몇번 째인지
		var currentPageListNum = page%totalPage==0?parseInt(page/totalPage):parseInt(page/totalPage)+1;
		//<<의 숫자
		var undoPage = page%boardList==0?parseInt(page/boardList)-2:parseInt(page/boardList)-1;
		//>>의 숫자
		var nextPage = page%boardList==0?parseInt(page/boardList):parseInt(page/boardList)+1;

		undoPage = undoPage * totalPage + 1;
		nextPage = nextPage * totalPage + 1;
		
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
			undo += "<li class='undo_2 pagingText pointer' id='" + undoPage + "'><img src='" + $.pagingOption.prevPrev + "'></li>";
		else
			undo += "<li class='undo_2 pagingText pointer' id='1'><img src='" + $.pagingOption.prevPrev + "'></li>";
		
		if(page != 1){
			
			undo += "<li class='leftImg pagingText pointer' id='"+(page-1)+"'><img src='" + $.pagingOption.prev + "'></li>";
			undo += "<li class='pagingText pointer' id='"+(page-1)+"'></li>";
		} else {
		
			undo += "<li class='leftImg pagingText pointer' id='1'><img src='" + $.pagingOption.prev + "'></li>";
			undo += "<li class='pagingText pointer' id='1'></li>";
		}
			
		if(pageTotal != page){
			
			if(pageTotal == 0) {
				
				next += "<li class='pagingText pointer' id='1'></li>";
				next += "<li class='rightImg pagingText pointer' id='1'><img src='" + $.pagingOption.next + "'></li>";
			} else {
				
				next += "<li class='pagingText pointer' id='"+(parseInt(page)+1)+"'></li>";
				next += "<li class='rightImg pagingText pointer' id='"+(parseInt(page)+1)+"'><img src='" + $.pagingOption.next + "'></li>";
			}
			
		} else {
			
			next += "<li class='pagingText pointer' id='"+pageTotal+"'></li>";
			next += "<li class='rightImg pagingText pointer' id='"+pageTotal+"'><img src='" + $.pagingOption.next + "'></li>";
		}
			
		if(currentPageListNum != pageListNum) {
		
			if(pageTotal == 0) {
				
				next += "<li class='next_2 pagingText pointer' id='1'><img src='" + $.pagingOption.nextNext + "'></li>";	
			} else {
				
				next += "<li class='next_2 pagingText pointer' id='"+nextPage+"'><img src='" + $.pagingOption.nextNext + "'></li>";	
			}
			
		}
		else
			next += "<li class='next_2 pagingText pointer' id='"+pageTotal+"'><img src='" + $.pagingOption.nextNext + "'></li>";	
		
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
			
		$paging.html("").append(_paging);	
	}
})(jQuery);

/*
 * 전체 경로에서 파일 이름만 가져오기
 *  
 * 
 */
(function($) {
	
	$.filenameExtract = function(str) {
		
		var fileroot = str.split("\\");
		var filename = fileroot[fileroot.length - 1];
		
		return filename;
	}
})(jQuery);

/*
 * [설명] : 경로를 받아서 root, 파일이름, 확장자를 반환하기
 * [파라미터] 
 * 		- originFilename : 파일경로
 */

(function($) {
	
	$.filenameExt = function(originFilename) {
		
		var fileroot = originFilename.split("/");
		var filerootLength = fileroot.length;
		
		var filenames = fileroot[filerootLength - 1].split(".");
		var filenamesLength = filenames.length;
		var ext = filenames[filenamesLength - 1];
		var filename = "", filerootname = "";
		var i;
		
		for(i = 0 ; i < filenamesLength - 1 ; i += 1) {
			
			filename += filenames[i];
			
			if(i < filenamesLength - 2) {
				
				filename += ".";
			}
		}
		
		for(i = 0 ; i < filerootLength - 1 ; i += 1) {
			
			filerootname += fileroot[i] + "/";
		}
		
		var info = {
				filerootname: filerootname,
				filename: filename,
				ext: ext
		}
		
		return info;
	}
})(jQuery);