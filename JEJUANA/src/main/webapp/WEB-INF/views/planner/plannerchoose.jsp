<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  .modal-content div[class=modal-body]{
    margin: 0 auto;
    align-content: center;
  }
</style>
<script>
  $(function(){
    $("#modalopen").trigger("click");
    $("#newPlannerChoose").click(function(){
      location.href="planner";
    })
  });
</script>
<body>
<!-- 새로만들기 or 기존 플래너 불러오기 선택 -->
<span style="display: none">
<input type="button" id="modalopen" data-bs-toggle="modal" data-bs-target="#myModal" value="모달열기"/>
</span>
<div class="modal fade modal-dialog-centered" id="myModal">
  <div class="modal-dialog ">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" >
        <input type="button" id="oldPlannerChoose" value="기존 플랜 불러오기">
      </div>
      <div class="modal-body" >
        <input type="button" id="newPlannerChoose" value="플랜 새로만들기" data-bs-dismiss="modal">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>