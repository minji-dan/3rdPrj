# 3rdPrj _ 예약 관리 시스템 구축

## 1. 음식점 목록

### 1.2.1 조회조건

| 사업자등록번호 | [텍스트박스] ‘-’까지 equal 검색  |
| --- | --- |
| 지역 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 BIZ_LOC |
| 업종 | [콤보박스] |
| 음식점명 | [텍스트박스] |
| 업주 | 사용자조회 팝업 |
| 예약가능기간 | Datepicker, 필수, 기본값: 현재일 기준  - 6개월~+6개월 |
| 결재상태 | [콤보박스], 공통코드: 업무영역코드 CM, 그룹코드 APPR_STAT |

### 1.2.2 조회결과

-그리드: 읽기 전용

- 화면 이동 - **행 더블 클릭** 시 음식점 관리 화면으로 이동

## 2. 음식점 관리

### 1.2.1 조회조건

| 음식점 ID | 음식점목록조회 화면의 그리드에서 넘어온 음식점ID |
| --- | --- |

### 1.2.2 입력항목

### 👉 메뉴를 통해 접근한 경우

: 신규모드

- **음식점정보**

| 음식점 ID | [텍스트박스] 비활성화, 시스템 자동 채번 |
| --- | --- |
| 결재상태 | [콤보박스] 비활성화, 실제 결재상태에 따른 자동 세팅  |
| 사업자등록번호 | [텍스트박스] |
| 음식점명 | [텍스트박스] |
| 전화번호 | [텍스트박스] |
| 지역 | 공통코드 세팅 |
| 업종 | 공통코드 세팅 |
| 업주 | 사용자조회 팝업 |
| 영업시간 | [텍스트박스] |
| 최대수용인원 | [텍스트박스] |
| 예약가능기간 | Datepicker (YYYY-MM-DD) |
| 주소 | [텍스트박스] |
- **버튼영역**

| 목록, 저장, 결재요청 | 보임 |
| --- | --- |
| 승인, 반려 | 숨김 |

### 👉 목록을 통해 접근한 경우

: 필요에 따라 조회/수정/결재 모드 

- **예약가능정보**
- 그리드: 수정가능
  

| 예약가능시간 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_TIME_CD |
| --- | --- |
| 예약가능인원 | [텍스트박스] |
| 예약금발생여부 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_FEE_YN |
| 예약금 | [텍스트박스]  |
| 최대이용시간 | [텍스트박스] |
| 비고 | [텍스트박스] |

- **휴무정보**
- 그리드: 수정가능
    

-휴무일자: Datepicker

- **음식점설명 및 결재정보**

| 음식점설명 | [TextArea] |
| --- | --- |
| 편의시설 | [TextArea] |
| 결재의견 | [TextArea] 노출 여부는 상태에 따라 유동적 |

## 3. 예약가능음식점조회

### 1.2.1 조회조건

| 지역 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_LOC |
| --- | --- |
| 업종 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_TYPE_CD |
| 음식점명 | [텍스트박스] LIKE% 검색 |
| 예약일자 | Datepicker, 필수, 기본값: 현재일 |
| 예약가능시간 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_TIME_CD |
| 예약가능인원 | [텍스트박스] |
| 예약금발생여부 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_FEE_YN |

### 1.2.2 조회결과

-그리드: 읽기 전용

- 화면 이동 - **행 더블 클릭** 시 음식점 관리 화면으로 이동

## 4. 예약신청
### 1.2.1 조회조건

| 음식점ID | 예약가능음식점조회 화면의 그리드에서 넘어온 음식점ID |
| --- | --- |
| 예약가능시간ID | 예약가능음식점조회 화면의 그리드에서 넘어온 예약가능시간ID |
| 예약ID  | 예약신청내역조회 화면의 그리드에서 넘어온 예약ID |

### 1.2.2 조회결과

### 👉 메뉴를 통해 접근한 경우

| 지역, 업종 | [콤보박스] 공통코드 세팅 |
| --- | --- |
| 음식점명 | [콤보박스] 지역과 업종 모두 선택 시 일치하는 음식점 표출 |
| 전화번호, 영업시간, 주소  | [텍스트박스] 비활성화, 음식점 선택 시 해당 음식점 기준으로 세팅 |
| 예약일자 | Datepicker |
| 예약시간 | [콤보박스] 예약일자에 예약가능한 시간 표출  |
| 예약금발생여부, 예약금, 예약가능인원, 최대이용시간 | [텍스트박스] 비활성화, 예약시간 선택 시 해당시간 기준으로 세팅 |
| 예약인원 | [텍스트박스]  |
| 예약자명 | 사용자조회 팝업 |
| 화면 미노출 항목 | 결재상태, 결재의견, 승인, 반려 |

### 👉 예약가능음식점조회 화면에서 넘어오는 경우

-`음식점ID`와 `예약가능시간ID` **기준**으로 `지역`, `업종`, `음식점명`, `전화번호`, `영업시간`, `주소`, `예약금발생여부`, `예약금`, `예약시간`, `최대이용시간` 세팅

| 예약ID | [텍스트박스] 비활성화, 시스템 자동 채번  |
| --- | --- |
| 예약일자 | 예약가능음식점조회 화면의 검색조건인 예약일자 값 세팅  |
| 입력 가능 항목 | 예약인원, 예약자명 |
| 화면 미노출 항목 | 확정, 취소 |

### 👉 예약신청내역조회 화면에서 넘어오는 경우

-`예약ID` 기준으로 `예약ID`부터 `확정 메시지`까지 세팅

-`입력 가능 항목` 및 `화면 노출/미노출` 항목은 확정 단계 및 접근 사용자 권한에 따라 유동적 

### 👉 화면이동

-`목록` **클릭 시** 예약가능음식점조회 화면으로 이동

-`신청내역` **클릭 시** 예약신청내역조회 화면으로 이동 

## 5. 예약신청 내역 조회

### 1.2.1 조회조건

| 예약상태 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 REZ_STAT_CD |
| --- | --- |
| 지역 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 BIZ_LOC |
| 업종 | [콤보박스] 공통코드: 업무영역코드 RE, 그룹코드 BIZ_TYPE_CD |
| 음식점명 | [텍스트박스] LIKE% 검색 |
| 예약일자 | 필수, Datepicker, 기본값: 현재일 기준-한달~+한달 |
| 예약자 | 사용자조회팝업 |
| 나의신청내역 | [체크박스] |

### 1.2.2 조회결과

-그리드: 읽기 전용

- 화면 이동 - **행 더블 클릭** 시 음식점 관리 화면으로 이동

## 6. 미정의
