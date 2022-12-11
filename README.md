# MyCalendar
일정 관리 앱

## 프로젝트 소개
사용자가 일정을 보다 체계적으로 관리할 수 있도록 달력, 일정, 반복 루틴 탭을 구성하였습니다.  
일반적인 일정앱을 구현한 뒤, '오늘' '내일' 일정을 두드러지게 보여주며 ui를 업데이트 할 계획입니다.

### 달력탭
- 달력탭은 기본 달력, 공휴일 정보, 사용자가 추가한 일정에 대한 정보가 들어 있습니다.
- 공휴이 정보는 공공 데이터 포털 api를 이용하였고, XML 데이터를 파싱하였습니다.
  <img width="250" alt="스크린샷 2022-12-05 오후 8 54 26" src="https://user-images.githubusercontent.com/113229215/206906365-0c8d633c-de9b-4e6b-8a93-314c84df27d3.png">
  <img width="250" alt="스크린샷 2022-12-05 오후 8 55 48" src="https://user-images.githubusercontent.com/113229215/206907077-cc14c971-741d-4473-bf21-5cc8664019c2.png">

- 달력탭에서 일정 추가 버튼을 누르면 TextField와 DatePicker를 통해 일정을 작성할 수 있습니다.
<img width="250" alt="스크린샷 2022-12-05 오후 8 55 02" src="https://user-images.githubusercontent.com/113229215/206906470-22bbba9b-a411-4468-b236-0e77df9577e5.png">


### 일정탭
- 일정탭은 사용자가 추가한 일정과 해당 날짜를 보여줍니다.
<img width="250" alt="스크린샷 2022-12-05 오후 8 56 49" src="https://user-images.githubusercontent.com/113229215/206906411-b67573c3-a3ea-4ca7-a77d-54bc7ecbfa78.png">

### 반복루틴
- 해당 탭은 미완성 상태입니다. 헬스장, 온라인 강의 수강 등 반복되는 일상들을 작성할 수 있도록 구현할 것입니다.
