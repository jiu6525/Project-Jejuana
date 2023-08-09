<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
<link rel="stylesheet" href="/jejuana/css/notice.css"/>

<script>
	$(function(){
		 CKEDITOR.ClassicEditor.create(document.getElementById("content"), {
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
		 
		 //폼 유효성검사
		 $("#complainForm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			} 
			if($("#content").val()==""){
				alert("내용을 입력하세요.");
				return false;
			} 
			if($("#complain").val()=="0"){
				alert("신고사유를 선택해주세요.");
				return false;
			}
			return true;
		 });
    });
</script>
<div class="container">
	<p class="container_p">신고하기</p>
	<form method="post" action="complainWriteOk" id="complainForm">
		<ul>
			<li><input type="hidden" name="plan_no" value="${plan_no }"/></li>
			<li>제목</li>
			<li><input type="text" name="notice_subject" id="subject" value="[신고]"/></li>
			<li>글내용</li>
			<li>
				<!-- 에디터 -->
				<textarea name="notice_content" id="content">
					1. 신고 글 제목: ${review_subject}</br>
					<br/>
					2. 신고 글 작성자:${id}</br>
					<br/>
					3. 신고 사유(자세히):
				</textarea>
			</li>
			<li>신고 사유(신고 사유는 등록 후 수정불가능합니다.):
				<select name="complain" id="complain">
					<option value="0">신고 사유를 선택해주세요.</option>
					<option value="스팸홍보/도배글입니다.">스팸홍보/도배글입니다.</option>
					<option value="음란물입니다.">음란물입니다.</option>
					<option value="불법정보를 포함하고 있습니다.">불법정보를 포함하고 있습니다.</option>
					<option value="청소년에게 유해한 내용입니다.">청소년에게 유해한 내용입니다.</option>
					<option value="욕설/생명경시/혐오/차별적 표현입니다.">욕설/생명경시/혐오/차별적 표현입니다.</option>
					<option value="개인정보노출 게시물입니다.">개인정보노출 게시물입니다.</option>
					<option value="불쾌한 표현이 있습니다.">불쾌한 표현이 있습니다.</option>
				</select>
			</li>
			<li><input type="checkbox" name="secretKey"/> 비밀글 설정</li>
			<li><div>
					<input type="button" value="목록보기" onclick="location.href='/jejuana/review/reviewLists">
					<input type="submit" value="등록하기"/>
				</div>
			</li>
		</ul>
	</form>
</div>