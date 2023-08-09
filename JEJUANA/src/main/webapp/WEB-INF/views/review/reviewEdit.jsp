<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
<link rel="stylesheet" href="/jejuana/css/review.css"/>
<script>
$(function(){
	CKEDITOR.ClassicEditor.create(document.getElementById("review_content"), {
        
		// https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
        toolbar: {
            items: [
                'exportPDF','exportWord', '|',
                'findAndReplace', 'selectAll', '|',
                'heading', '|',
                'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                'bulletedList', 'numberedList', 'todoList', '|',
                'outdent', 'indent', '|',
                'undo', 'redo',
                '-',
                'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                'alignment', '|',
                'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                'textPartLanguage', '|',
                'sourceEditing'
            ],
            shouldNotGroupWhenFull: true
        },
        // Changing the language of the interface requires loading the language file using the <script> tag.
        // language: 'es',
        list: {
            properties: {
                styles: true,
                startIndex: true,
                reversed: true
            }
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
        heading: {
            options: [
                { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
            ]
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
        placeholder: '',
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
        fontFamily: {
            options: [
                'default',
                'Arial, Helvetica, sans-serif',
                'Courier New, Courier, monospace',
                'Georgia, serif',
                'Lucida Sans Unicode, Lucida Grande, sans-serif',
                'Tahoma, Geneva, sans-serif',
                'Times New Roman, Times, serif',
                'Trebuchet MS, Helvetica, sans-serif',
                'Verdana, Geneva, sans-serif'
            ],
            supportAllValues: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
        fontSize: {
            options: [ 10, 12, 14, 'default', 18, 20, 22 ],
            supportAllValues: true
        },
        // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
        // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
        htmlSupport: {
            allow: [
                {
                    name: /.*/,
                    attributes: true,
                    classes: true,
                    styles: true
                }
            ]
        },
        // Be careful with enabling previews
        // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
        htmlEmbed: {
            showPreviews: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
        link: {
            decorators: {
                addTargetToExternalLinks: true,
                defaultProtocol: 'https://',
                toggleDownloadable: {
                    mode: 'manual',
                    label: 'Downloadable',
                    attributes: {
                        download: 'file'
                    }
                }
            }
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
        mention: {
            feeds: [
                {
                    marker: '@',
                    feed: [
                        '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                        '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                        '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                        '@sugar', '@sweet', '@topping', '@wafer'
                    ],
                    minimumCharacters: 1
                }
            ]
        },
        // The "super-build" contains more premium features that require additional configuration, disable them below.
        // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
        removePlugins: [
            // These two are commercial, but you can try them out without registering to a trial.
            // 'ExportPdf',
            // 'ExportWord',
            'CKBox',
            'CKFinder',
            'EasyImage',
            // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
            // Storing images as Base64 is usually a very bad idea.
            // Replace it on production website with other solutions:
            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
            // 'Base64UploadAdapter',
            'RealTimeCollaborativeComments',
            'RealTimeCollaborativeTrackChanges',
            'RealTimeCollaborativeRevisionHistory',
            'PresenceList',
            'Comments',
            'TrackChanges',
            'TrackChangesData',
            'RevisionHistory',
            'Pagination',
            'WProofreader',
            // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
            // from a local file system (file://) - load this site via HTTP server if you enable MathType
            'MathType'
        ]
    });
		
	//태그 테이블 생성
	var arr= new Array(); //태그 배열 생성
	<c:forEach var="tDTO" items="${list }">
		arr.push("${tDTO.tag_content }");
	</c:forEach>

	num = 0;
	console.log(arr);
	const rowCnt = Math.ceil(${size}/5);
	const columnCnt = 8;
	
	var tag = "<table>";
	for(let i=0; i<rowCnt; i++){
		tag += "<tr>";
		for(let j=0; j<columnCnt; j++){
			tag += "<td>";
			tag += "<input type='checkbox' name='tagArr' value='";
			tag += arr[num] +"' ";
			
			'${dto.tag}'.split('/').map(function(tagData, idx){ // '/' 기준으로 자르기
				if(arr[num]==tagData){ //자른 값과 value가 같다면 
					tag += " checked"; 
			    }
			} );
			
			tag += ">";
			tag += arr[num];
			num++;
			tag += "</td>";
			if(num==${size}) break;
		}
		tag += "</tr>";
		if(num==${size}) break;
	}
	tag += "</table>";
	$("#tagli").append(tag);
	
	//첫번째로 업로드한 이미지 저장
	$("#reviewForm").submit(function(){
		let testArr = Array.from(document.querySelectorAll("img[src]")).map(v => v.src);
		var img = testArr[1]; //헤더 뺀 이미지
		$("#thumbnail").val(img); //이미지값 서버로 전송하기 위함
		
		if($("#review_subject").val()==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(testArr.length==1){ //헤더의 이미지만 있을 경우
			alert("이미지는 1개 이상 첨부하여야 합니다");
			return false;
		}
		var tagCount = 0;
		$("input[name=tagArr]").each(function(){
			if(this.checked==true) tagCount++;
		});
		if(tagCount<1 || tagCount>3){
			alert("태그는 1개 이상 3개 이하 선택하여야 합니다");
			return false;
		}	
		return true;
	});
});
</script>
<div class="container">
<br><br>
	<form method="post" action="reviewEditOk" id="reviewForm" enctype="multipart/form-data">
		<input type="hidden" name="plan_no" value="${dto.plan_no }">
		<input type="hidden" id="thumbnail" name="thumbnail" value="">
		<ul>
			<div style="text-align:center">
				<li>
					<input type="text" name="review_subject" id="review_subject" value="${dto.review_subject }" placeholder="제목을 입력하세요. (10자 이내)" maxlength="15">
				</li>
			</div>
			<li>
				<textarea name="review_content" id="review_content"  placeholder="솔직한 리뷰는 사람들에게 도움이 됩니다! * 이미지는 1장 이상 첨부해 주세요">${dto.review_content }</textarea>
			</li>
		</ul>
		<div id="tagli">[태그 선택]</div>
		<div class="editFix_div">
			<a class="editFix" id="editFix_A" href="/jejuana/review/reviewList">목록</a>
			<input class="editFix flex review_fix" type="submit" value="수정하기">
		</div>
		
	</form>
</div>