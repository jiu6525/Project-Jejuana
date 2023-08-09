<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e918783759197bca10fffa91fc3e5&libraries=services"></script>
<link href="<%=request.getContextPath()%>/css/planner.css" rel="stylesheet">
<script>
    let markers = []; //마커 담을 배열
    let polylines = []; // 경로 담을 배열
    let colors = [
        '#FFAE00', '#0022ff', '#aa00ff', '#ff003b',
        '#00ff0d', '#c8ff00', '#36fcff', '#480148',
        '#1f2c70', '#1f702a', '#42ff5c', '#42b7ff',
        '#424bff', '#ff42e6'
    ];
    let random_color = [];
    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({zIndex: 10});
    $(function () {
        // 저장 눌렀을 때 플랜 이름 있는지 확인
        $("#planner_Saver").submit(function () {
            if ($("#plan_name").val() === "") {
                alert("플랜 이름을 작성해주세요");
                return false;
            }
        });
        let start = {}; // 시작날짜를 연/월/일로 나눠서 담을 배열
        let startdate;  // 시작날짜를 담을 Date 객체
        let end = {};   // 종료날짜를 연/월/일로 나눠서 담을 배열
        let enddate;    // 종료 날짜를 담을 Date 객체
        let days = 0;   // 두 날짜의 차이를 담을 변수
        $("#start_date").change(function () { // 시작날짜의 변화가 생기면
            $("#schedule").empty(); // 먼저 초기화하고
            start = $("#start_date").val().split('-');  // 선택한 날짜를 '-' 를 기준으로 나눠서 배열에 넣고
            startdate = new Date(start[0], start[1], start[2]);// 그걸 다시 Data 객체로 만듬
            if (enddate != null) {// 만약 종료일이 선택되어있으면
                days = 1 + (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24);// 두 날짜의 차이를 구해서
                $("#days").val(days);
                showSchedule(days);// 일정을 선택할수있는 함수에 넣는다.
            }
        });
        $("#end_date").change(function () { // 시작일과 동일한 방식
            $("#schedule").empty();
            end = $("#end_date").val().split('-');
            enddate = new Date(end[0], end[1], end[2]);
            if (startdate != null) {
                days = 1 + (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24);
                $("#days").val(days);
                showSchedule(days);
            }
        });
        function colorSetup(days) {
            random_color = [];
            var num;
            do {
                num = Math.floor(Math.random() * colors.length);
                random_color.push(colors[num]);
                for (var i = 0; i < colors.length; i++) { // 중복된 값이 들어가지 않도록 result 배열에 저장된 값은 arr 배열에서 제거
                    if (random_color[random_color.length - 1] == colors[i]) {
                        colors.splice(i, 1);
                    }
                }
            } while (random_color.length != days); // result 배열의 요소가 6개가 될 때까지 반복
            random_color.sort(function (a, b) { // 오름차순으로 정렬
                return a - b;
            });
            return random_color;
        }
        // 일정을 작성했는데 날짜를 변경할 경우 예) 6월 3일부터 6월 9일(6박7일)까지 일정에서
        // 5월 3일에서 5월 5일로(2박3일) 변경 시 day1, day2, day3은 작성된 채로 남겨두고
        // day4~day7까지만 삭제되게끔 변경해야함!!!!!!!!!!!!!!!!!!!!
        function showSchedule(days) {
            colorSetup(days);// 시작일과 종료일의 차이로 여행 날짜수 구해준값을 파라미터로 넣고
            for (let i = 1; i <= days; i++) {// 날수+1 번 반복해서 코스를 짤 수 있는 블럭을 넣어줌
                let tag = "<div class='schedule_detail'>";
                tag += "<input type='hidden' class='day' value='" + i + "'/>";
                tag += "<div class='schedule_header'><div class='day' style='border-bottom-color:" + random_color[i - 1] + "' >Day" + i + "</div></div>";
                tag += "<div class='schedule_body' id='day" + i + "'></div>";
                tag += "<div class='schedule_footer'>";
                tag += "<div class='placeAdd' id='" + i + "'>";
                tag += "<img src='<%=request.getContextPath()%>/img/placeselect.png' width='50'/></div>";
                tag += "</div></div>";
                $("#schedule").append(tag);
            }
        }
        $(document).on("click", ".closeModal", function () { //모달 닫는 버튼
            $("#myModal").css("display", "none");
        });
        // 장소선택을 위해서 여행지 목록을 보여주는 창 OPEN
        $(document).on("click", ".placeAdd", function () { // 장소 추가 버튼을 누르면
            let placeModal = document.getElementById("myModal");
            placeModal.style.display = "block";
            // searchPlaces("제주특별자치도");
            searchPlaces_sv("제주특별자치도");
        });
        function searchPlaces_sv(keyword){
            let url = "searchPlace"
            let data = {"content" : keyword}
            $.ajax({
                url:url,
                data:data,
                type: "POST",
                dataType: "TEXT",
                success:function(result) {
                    console.log(JSON.parse(result));
                },error : function(e){
                    console.log(e.responseText);
                }
            })
        }
        // 모달 내 여행지 목록에서 여행지 선택 버튼을 눌렀을 때
        $(document).on("click", ".btn-primary", function () { //선택을 누르면
            let selected = $(this).parent().parent();
            $("#selectedPlace").append(selected[0].firstChild); //선택된 여행지를 selectedPlace 박스에 사진으로 올린다.
            selected.css("display", "none"); //선택된 여행지를 목록에서 안보이게 한다.
        });
        let lat1 = null, lat2 = null, lon1 = null, lon2 = null;
        // 스케줄러에 넣어준 장소를 제거했을 경우
        $(document).on("click", ".place_del", function () {
            let idName = $(this).attr("class").substring(10);
            $(this).parent(".place").remove();
            let target = document.getElementById(idName);
            deleteMarkers();
            deletePolylines();
            console.log(target.getElementsByClassName("place_no"));
            let selectedPlace = target.getElementsByClassName("place_no");
            let selectedNo = "";
            for (let i = 0; i < selectedPlace.length; i++) {
                selectedNo += "&places=" + selectedPlace[i].value
            }
            target.innerHTML = "";
            schedule_setup(selectedNo, idName);
        });
        $("#saveBtn").click(function () {  //장소를 다 고르고 저장 버튼을 누르면 선택된 여행지가 해당 날짜로 들어감
            // 저장을 누르면
            // 1. selectedPlace에 옮겨진 장소를 plannerbody의 일정부분에 옮기기
            let selectedNo = "";
            let selectedPlace = $("#selectedPlace input");
            for (let i = 0; i < selectedPlace.length; i++) {
                selectedNo += "&places=" + selectedPlace[i].value
            }
            let day = "day" + $("#day").val();
            deleteMarkers();
            deletePolylines();
            schedule_setup(selectedNo, day);
            // 2. modalbody에 내용 초기화
            $("#searchWord").val(""); //검색창 초기화
            $("#placeBox").empty();
            $("#selectedPlace").empty();
            // 3. modal을 닫는다.
            $("#myModal").css("display", "none");
        });
        function schedule_setup(selectedNo, day) {
            $.ajax({
                url: 'selectedPlace',
                data: selectedNo,
                traditional: true,
                type: 'POST',
                success(result) {
                    let target = document.getElementById(day);
                    let a = target.childElementCount;
                    $(result).each(function (i, dto) {
                        let places = {lat: dto.latitude, lon: dto.longitude}
                        displayMarker(places)
                        let tag = "";
                        tag += "<div class='place day1'>";
                        tag += "<input type='hidden' class='order' value='" + (i + 1 + a) + "'/>";
                        tag += "<div class='place_dis'>";
                        if ((i + 1 + a) == 1) {
                            lat1 = dto.latitude;
                            lon1 = dto.longitude;
                        } else {
                            lat2 = dto.latitude;
                            lon2 = dto.longitude;
                            tag += parseInt(distance(lat1, lon1, lat2, lon2)) + "KM";
                            let linePath = [
                                new kakao.maps.LatLng(lat1, lon1),
                                new kakao.maps.LatLng(lat2, lon2)
                            ]
                            console.log(random_color[parseInt(day.substring(3)) - 1]);
                            drawPath(linePath, random_color[parseInt(day.substring(3)) - 1]);
                            lat1 = lat2;
                            lon1 = lon2;
                        }
                        tag += "</div>";
                        tag += "<div class='place_name'>" + dto.place_name + "</div>";
                        tag += "<div class='place_del " + day + "'>삭제</div>";
                        tag += "<input type='hidden' class='place_no' value='" + dto.place_no + "'/>";
                        tag += "<input class='lat' type='hidden' value='" + dto.latitude + "'/>";
                        tag += "<input class='lon'  type='hidden' value='" + dto.longitude + "'/></div>";
                        target.innerHTML += tag;
                        //---------------------------------------
                        // 각 여행지 사이의 거리를 프론트단에서 계산하는 방법 생각해야함
                        // 여행지를 중간에 삭제하거나 위치를 바꿨을 때 거리가 다시 계산 되도록
                        //---------------------------------------
                    });
                }, error(e) {
                }
            })
        }
        $(".schedule_body").sortable();
        $("#selectedPlace").sortable();
    });
    function removeAllChildNode(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }
    function searchPlaces() {
        let keyword = document.getElementById('searchWord').value;
        if(keyword===""||keyword==null){
            keyword = "제주특별자치도";
        }
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB);
    }
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
            console.log(data);
            // 페이지 번호를 표출합니다
            // displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
        }
    }
    function displayPlaces(places) {
        let placeList = document.getElementById("placeBox"),
            fragment = document.createDocumentFragment();
                    //초기화
        removeAllChildNode(placeList);
        //여행지 목록 출력
        for (let i = 0; i < places.length; i++) {
            let placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getPlaceItem(i, places[i]);
            (function (marker, title) {
                itemEl.onmouseover = function () {
                    displayInfowindow(marker, title);
                    marker.setMap(map);
                };
                itemEl.onmouseout = function () {
                    infowindow.close();
                    marker.setMap(null);
                };
            })(marker, places[i].place_name);
            fragment.appendChild(itemEl);
        }
        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        placeList.appendChild(fragment);
        placeList.scrollTop = 0;
    }
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
        return new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage
        });
    }
    function displayInfowindow(marker, title) {
        let content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    function getPlaceItem(index, place) {
        let el = document.createElement("div"),
            tag = "";
        tag += "<div class='place_item'>";
        tag += "    <input type='hidden' class='id' value='" + place.id + "'/> ";
        tag += "    <input type='hidden' class='latitude'  value='" + place.y + "'/> ";
        tag += "    <input type='hidden' class='longitude'  value='" + place.x + "'/> ";
        tag += "    <input type='hidden' class=''  value='" + place.id + "'/> ";
        tag += "    <input type='hidden' class=''  value='" + place.id + "'/> ";
        tag += "    <input type='hidden' class=''  value='" + place.id + "'/> ";
        tag += "    <img src='<%=request.getContextPath()%>/img/123123.png' width='70' height='70'/></div>";
        tag += "<div class='place_item'>"+place.place_name + "</div>";
        tag += "<div class='place_item' style='font-size: 0.8em'>[" + place.category_group_name +"]";
        if (place.road_address_name) {
            tag += place.road_address_name + "</div>";
        } else {
            tag += place.address_name + "</div>";
        }
        tag += "<div class='place_item'>";
        tag += "<button type='button' class='btn btn-primary'>선택</button></div>";
        el.innerHTML = tag;
        el.className = 'place_container';
        return el;
    }
</script>

<div id="planner_body">
    <form id="planner_Saver" method="post" action="planSave">
        <ul>
            <li>
                <div class="label">플랜이름:</div>
                <input type="text" class="ib" id="plan_name" name="plan_name" placeholder="플랜 이름"/></li>
            <li>
                <div class="label">일정 :</div>
                <input type="date" id="start_date" name="start_date" value="2023-04-05"/>
                - <input type="date" id="end_date" name="end_date" value="2023-04-07"/></li>
            <li id="transport">
                <div class="label">교통수단 :</div>
                <div class="content ib" id="transport_radio">
                    <input type="radio" name="transport" value="public"/>대중교통<br>
                    <input type="radio" name="transport" value="ownCar"/>자차
                </div>
            </li>
            <li>
                <div class="label">인원수 :</div>
                <input type="number" class="ib" name="number_person" min="1" value="1" step="1"/></li>
            <li>
                <div class="label">일행 추가 :</div>
                <div class="content ib"></div>
            </li>
            <li><input type="hidden" id="days" name="days" value=""/></li>
            <li id="schedule">

            </li>
        </ul>
        <br/>

        <div id="buttons">
            <button type="submit">저장</button>
            <button type="reset">취소</button>
        </div>

    </form>
    <div class="myModal" id="myModal"> <!-- 모달로 쓸 블럭 -->
        <input type="hidden" id="day" value=""/>
        <div id="modalbody">

            <button type="button" class="closeModal" id="xbox"><img src="<%=request.getContextPath()%>/img/delete.png"
                                                                    width="20"></button>
            <%--검색--%>
            <div id="searchForm" style="background-color: bisque; height:50px;">
                <form onsubmit="searchPlaces(); return false;">
                    <input type="text" name="searchWord" id="searchWord"/>
                </form>
            </div>
            <%--선택한거 보여주는 박스--%>
            <div id="selectedPlace">

            </div>
            <div id="placeSave">
                <div id="saveBtn" class="btn button">저장</div>
                <%--이거 누르면 왜 --%>
                <div id="cancelBtn" class="btn button">취소</div>
            </div>
            <%--장소 목록 예시--%>
            <div id="placeBox">
            </div>

        </div>
        <div id="modalfooter">
            <button type="button" class="btn btn-danger closeModal" id="closeBtn" data-bs-dismiss="modal">Close</button>
        </div>
    </div>
</div>
<div id="map"></div>


<script>
    let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    let options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 9 //지도의 레벨(확대, 축소 정도)
    };
    let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    let mapTypeControl = new kakao.maps.MapTypeControl();
    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);
    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    let zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
    function displayMarker(places) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(places.lat, places.lon)
        });
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);
    }
    function deleteMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }
    function showAllMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
        markers = [];
    }
    function deletePolylines() {
        for (var i = 0; i < polylines.length; i++) {
            polylines[i].setMap(null);
        }
        polylines = [];
    }
    function showAllPolylines() {
        for (var i = 0; i < polylines.length; i++) {
            ploylines[i].setMap(map);
        }
        markers = [];
    }
    function distance(lat1, lon1, lat2, lon2) { // 거리 구하는 함수
        const R = 6371; // 지구 반지름 (단위: km)
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;// 두 지점 간의 거리 (단위: km)
    }
    function deg2rad(deg) {
        return deg * (Math.PI / 180);
    }
    // 지도에 표시할 선을 생성합니다
    function drawPath(linePath, color) {
        var polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 5, // 선의 두께 입니다
            strokeColor: color, // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        // 지도에 선을 표시합니다
        polyline.setMap(map);
        polylines.push(polyline);
    }
    var content = "";
    // 커스텀 오버레이가 표시될 위치입니다
    var position = new kakao.maps.LatLng(37.54699, 127.09598);
    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content,
        yAnchor: 1
    });
    customOverlay.setMap(map);
</script>