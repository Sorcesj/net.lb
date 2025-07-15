<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 런치버디 지도 </title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a068d45da1ef205b551521b2e110821f&libraries=services&autoload=false"></script>

<script >

</script>


 <style>
    #map {
      width: 100%;
      height: 400px;
      margin-bottom: 10px;
    }
  </style>

</head>

<body>

<table>
      <tr>
         <td><input type="button" value="게시판" onclick="location.href=''">
         </td>
         <td><input type="button" value="공지사항" onclick="location.href=''">
         </td>
         <td><input type="button" value="자유게시판" onclick="location.href=''">
         </td>
         <td><input type="button" value="" onclick="location.href=''">
         </td>
      </tr>

      <tr>
         <td>
         <label for="category">🍽 음식 선택:</label> <br>
          <select name="category" id="category">
               <option value="">== 음식 선택 ==</option>
               <option value="백반,국수">백반,국수</option>
               <option value="국밥,찌개">국밥,찌개</option>
               <option value="분식">분식</option>
               <option value="중식">중식</option>
               <option value="패스트푸드">패스트푸드</option>
               <option value="양식">양식</option>
               <option value="도시락">도시락</option>
               <option value="돈까스,일식">돈까스,일식</option>
               <option value="카페,디저트">카페,디저트</option>
               <option value="쌀국수">쌀국수</option>
         </select>
         </td>   
         
         <td>
         <label for="category">★ 별점:</label> <br> 
         <select   name="category" id="category">
               <option value="">== 별점 선택 ==</option>
               <option value="1">별1</option>
               <option value="2">별2</option>
               <option value="3">별3</option>
               <option value="4">별4</option>
               <option value="5">별5</option>      
         </select>
         </td>   
                  
         <td>
         <label for="distance">거리:</label> 
         <select name="distance" id="distance">
               <option value="">== 거리 선택 ==</option>
               <option value="300">5분 이내</option>
               <option value="300">10분 이내</option>
               <option value="500">15분 이내</option>
               <option value="1000">15분 이상</option>
         </select>
         </td>
         
         <td>
         <label for="price">가격:</label> 
         <select name="price" id="price">
               <option value="">== 가격 선택 ==</option>
               <option value="300">10,000원 이하</option>
               <option value="300">10,000 이상 ~ 15,000원 이하</option>
               <option value="500">15,000 이상  </option>
         </select>
         </td>
      </tr>

   </table>

   <div class="map-area">
      <div id="map" class="map-box">
      <!-- 지도 -->   
      </div>
   </div>

</body>
</html>


<%--

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>주소로 좌표 찾기</title>
 
</head>
<body>

<h2>주소 → 위도/경도 변환</h2>

<input type="text" id="addressInput" placeholder="예: 서울특별시 중구 세종대로 110" size="50">
<button onclick="convertAddress()">변환</button>

<p id="result"></p>
<div id="map"></div>

<!-- ✅ Kakao Map SDK (services 포함) -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a068d45da1ef205b551521b2e110821f&libraries=services&autoload=false"></script>

<script>
  kakao.maps.load(function () {
    const mapContainer = document.getElementById('map');
    const mapOption = {
      center: new kakao.maps.LatLng(36.3250339877736, 127.408932253974), // 기본 중심
      level: 3
    };

    const map = new kakao.maps.Map(mapContainer, mapOption);
    const geocoder = new kakao.maps.services.Geocoder();
    const resultBox = document.getElementById('result');
    let marker = null;

    window.convertAddress = function () {
      const address = document.getElementById('addressInput').value;

      if (!address) {
        resultBox.textContent = '주소를 입력하세요.';
        return;
      }

      geocoder.addressSearch(address, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
          const lat = result[0].y;
          const lng = result[0].x;

          resultBox.innerHTML = `📍 위도: <b>${lat}</b><br>📍 경도: <b>${lng}</b>`;

          const coords = new kakao.maps.LatLng(lat, lng);
          map.setCenter(coords);

          // 기존 마커 제거
          if (marker) marker.setMap(null);

          // 새 마커 생성
          marker = new kakao.maps.Marker({
            map: map,
            position: coords
          });
        } else {
          resultBox.textContent = '좌표를 찾을 수 없습니다.';
        }
      });
    };
  });
</script>

</body>
</html>


 --%>
