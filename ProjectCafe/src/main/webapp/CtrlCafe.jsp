<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel=stylesheet type=text/css href=CtrlCafe.css>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="shortcut icon" href="#">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CtrlCafe</title>
</head>
<style>
table{  margin-left: auto;
    	margin-right: auto;
    	}
</style>
<h2 align="center" style="font-family: 'Gowun Dodum', sans-serif; color:#454C53;" >카페 메뉴관리</h2>
<hr>
<body style="background-color:#999999">

    <table width=“600”>
        <tr>
            <td valign=top>
                <table class='bound' style="background-color: #e9ecef; align=center;" >
                   
                    <caption>메뉴목록</caption>
                    <tr>
                        <td colspan=2 align=right>
                            <button id=btnMenu class="w-btn-outline w-btn-gray-outline ">메뉴관리</button>
                        </td>
                    </tr>
               
            <tr>
                <td colspan=2 align=center>
                    <select id=selMenu size=24 width=400px></select>
                </td>
            </tr>
            <tr>
                    <td>메뉴명</td>
                    <td><input type=text id=menuname readonly></td>
                </tr>
                <tr>
                    <td>수량</td>
                    <td><input type=number id=count min=1>잔</td>
                </tr>
                <tr>
                    <td>금액</td>
                    <td><input type=number id=menuprice readonly>원</td>
                </tr>
                <tr>
                    <td><button id=btnReset class="w-btn-outline w-btn-gray-outline ">비우기</button></td>
                   
                  
                        
                    <td align="right"><button id=btnAdd class="w-btn-outline w-btn-gray-outline">메뉴추가</button></td>
                </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' style="background-color: #adb5bd;"  >
                    <caption>주문목록</caption>
                    <tr>
                        <td colspan=2 align=center>
                            <select id=selOrder size=26></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액</td>
                        <td><input type=number id=total></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><input type=phone id=mobile></td>
                    </tr>
                    <tr>
                        <td colspan=2 >&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel class="w-btn-outline w-btn-gray-outline">주문취소</button></td>
                        <td align=right><button id=btnDone class="w-btn-outline w-btn-gray-outline">주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td  valign=top>
                <table class='bound' style="background-color: #343a40;">
                    <caption>판매내역</caption>
                    
                    <tr>
                        <td align=center>
                            <select id=selSales size=30></select>
                        </td>
                    </tr>
                    <tr>
                        <td align=right><button id=btnSummary class="w-btn-outline w-btn-gray-outline">Summary</button></td>
                    </tr>
                </table>
            
            </td>
        </tr>
        </table>
        
        <div id=dlgMenu title="메뉴관리"  style="background-color:#CCCCCC; display:none; font-family: 'Gowun Dodum', sans-serif;" >
            <table>
                <tr>
                    <td>
                        <select id=selMenu1 size=10></select>
                    </td>
                    <td>
                        <table>
                        <tr>
                            <td>코드</td><td><input type=text id=code style='width:110px'></td>
                        </tr>
                        <tr>
                            <td>메뉴명</td><td><input type=text id=name style='width:110px'></td>
                        </tr>
                        <tr>
                            <td>단가(가격)</td><td><input type=number id=price min=500 step=500 style='width:110px'>원</td>
                        </tr>
                        <tr >
                            	<td ><button id=btnReset1 class="w-btn-outline w-btn-gray-outline ">비우기</button></td>
                                <td ><button id=btnGo class="w-btn-outline w-btn-gray-outline ">작성완료</button></td>
                        </tr>
                        </table>
                    </td>
                </tr>    
                </table>
        </div>
        <div id=Sales_menu  style="background-color:#CCCCCC; display:none; font-family: 'Gowun Dodum', sans-serif;" title="메뉴별 매출금액/고객별 매출금액 ">
        	<table align="left" >
        		<tr><td align=center> [ 메뉴별 매출금액 ]  </td></tr>
        		<tr>
        			<td>
        			<select id=SalesMenu size=20></select>
        			</td>
        		</tr>
        	</table>
        	<table align="right"  >
        		<tr><td align=center>  [ 고객별 매출금액 ]  </td></tr>
        		<tr>
        			<td>
        			<select id=SalesMob size=20></select>
        			</td>
        		</tr>
        	</table>
        </div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src=CtrlCafe.js>

	
	// --------------------------------------------------------------------- Summary
</script>
</html>