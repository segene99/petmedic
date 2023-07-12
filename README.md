# petmedic
동물병원 예약사이트 프로젝트(Korean animal hospital reservation website project)
- 프로젝트 기간: 2023.04 - 2023.05(4주) / / 2023-.06 - 2023.06(개인유지보수)
- 목표: 증가하는 반려인구의 편의성을 위한 맞춤 동물병원 예약사이트 개발
- 역할: 팀장(팀원 8명)
- 그외업무: 프로젝트 발표

# 사용기술/툴:
- 백엔드(Java, Spring MVC), 프론트(JS, HTML, CSS),데브옵스(MariaDB,Tomcat, AWS EC2), 협업(Slack, notion)
# 기술업무
1. 일반유저와 병원회원 리뷰검색, 리뷰목록, 리뷰상세보기, 리뷰작성/수정/삭제 프론트 및 백엔드 구현
   - ajax를 활용한 비동기 처리, 마리아DB와 연결 하여 데이터 검색/수정/삭제, controller,service, serviceImpl, Mapper MVC구성
   - 일반회원
     - ![리뷰총합 (1)](https://github.com/segene99/petmedic/assets/112309011/2d51007b-fdc3-4e58-9d28-35015c8e0b97)
   - 병원회원: 병원에서 관리하는 계정. 여행사이트의 호스트계정과 동일. 부적절한 리뷰신고 가능.
     - ![병원리뷰신고 (1)](https://github.com/segene99/petmedic/assets/112309011/33404027-d34d-4f3f-8596-bd32052e628f)

2. 메인페이지 프론트 유튜브 영상 슬라이더 구현
   - swiper 외부라이브러리와 유튜브 embedded 코드 활용
   - ![유튜브 (1)](https://github.com/segene99/petmedic/assets/112309011/b83f7bad-15ea-4abe-a0ef-680114d7171d)

3. 카카오 맵 API를 활용한 동물병원 지도검색 프론트 및 백엔드 구현
   - ajax를 활용한 비동기 처리, 마리아DB와 연결 하여 키워드 데이터 검색
   - tooltip으로 검색된 병원 위치 확인
   - 병원정보 요약 목록 출력
   - ![지도검색 (1)](https://github.com/segene99/petmedic/assets/112309011/ead8cb6d-5d45-45ef-8866-cf8589e08e22)

5. 병원검색 프로트 및 백엔드 구현
   - ajax를 활용한 비동기 처리, 마리아DB와 연결 하여 키워드 데이터 검색
   - ![병원검색 (1)](https://github.com/segene99/petmedic/assets/112309011/b7746cfa-b315-463c-bb84-64b2d44696db)

6. AWS EC2를 활용한 웹사이트 도메인 배포
   
7. 프로젝트 통합/시스템테스트 총괄
   - git 사용을 할 줄 모르는 상태여서 직접 파일을 받아 수행함. 현재는 git활용하여 commit/pull/push/merge 수행
   - ![image](https://github.com/segene99/petmedic/assets/112309011/281365a0-27f9-4671-80fa-e335aa113b5f)
  
# 참조
- 일반계정: subin1234/12341234
- 병원회원계정: daonhos/12341234
- 관리자계정: jason/123
