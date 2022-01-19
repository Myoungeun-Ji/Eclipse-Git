<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel=stylesheet type=text/css href=CafeStyle.css>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="shortcut icon" href="#">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>카페 메인 관리메뉴</title>
</head>
<body>

	<table>
		<tr>
			<td valign=top>
				<table class='bound'>
					<caption>메뉴목록</caption>
					<tr>
						<td colspan=2 align=center>
							<button id=btnMenu>메뉴관리</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><select id=selMenu size=13></select></td>
					</tr>
					<tr>
						<td>메뉴명</td>
						<td><input type=text id=menuname readonly></td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type=number id=count min=1 style='width: 50px'>잔</td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input type=number id=menuprice readonly>원</td>
					</tr>
					<tr>
						<td><button id=btnReset>비우기</button></td>
						<td align=right><button id=btnAdd>메뉴추가</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound'>
					<caption>주문내역</caption>
					<tr>
						<td colspan=2><select id=selOrder size=13></select></td>
					</tr>
					<tr>
						<td>총액</td>
						<td><input type=number id=total style='width: 100px'>원</td>
					</tr>
					<tr>
						<td>모바일</td>
						<td><input type=phone id=mobile size=13></td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td><button id=btnCancel>주문취소</button></td>
						<td align=right><button id=btnDone>주문완료</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound'>
					<caption>매출내역</caption>
					<tr>
						<td colspan=2><select id=selSales size=15></select></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div align=center id=dlgMenu style='display:none;' title="메뉴관리">
        <table align=center>
            <tr>
                <td>
                    <select id=selMenu1 size=10></select>
                </td>
                <td>
                    <table>
                    <tr>
                        <td>코드</td><td><input type=text id=code style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>메뉴명</td><td><input type=text id=name style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>단가(가격)</td><td><input type=number id=price min=500 step=500 style='width:50px'>원</td>
                    </tr>
                    <tr>
                        <td>
                            <button id=btnGo>작성완료</button>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>    
            </table>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	
	$(document)
	.ready(function() {
		loadMenu();
		$('#total').val()
		return false;
	})
	 
	 .on('change','#selMenu',function(){
        str=$('#selMenu option:selected').text();
		let ar=str.split(' ');
        $('#menuname').val(ar[1]);
        $('#count').val(1);
        $('#menuprice').val(ar[2]);
    })

    .on('change','#count',function(){
        str=$('#selMenu option:selected').text();
        let ar=str.split(' ');
        bb=$('#count').val();
        $('#menuprice').val(ar[2]*bb);
    })

    .on('click','#btnReset',function(){
        $('#menuname, #menuprice, #count').val('')
    })

    .on('click','#btnAdd',function(){
        Addprice=$('#menuprice').val();
        strOrder='<option>'+$('#menuname').val()+' x'+$('#count').val()+' '+$('#menuprice').val()+'</option>';
        $('#selOrder,#selOrder1').append(strOrder);
        Addprice=parseInt(Addprice);
        nTotal+=Addprice
        $("#total").val(nTotal)
    })

    .on('click','#btnCancel',function() {
        $('#selOrder').empty();
        $('#mobile').empty();
        $('#total').val('');
    })

    .on('click','#btnDone',function(){
        Smobile=$('#mobile').val()
        Stotal=$('#total').val()
        if($('#total').val() == 0) {
        	alert("메뉴를 추가해주세요!");
        	return false;
        } else {
        	strSales='<option>'+$('#mobile').val()+' '+$('#total').val()+'원'+'</option>';
        }
        $("#selSales").append(strSales);
        $('#selOrder').empty();
        nTotal=0;
        $('#mobile').val(null);
        $('#total').val(nTotal);
    })
    
    // -------------------------------------------------------- 메뉴관리(다이얼로그)
    
	.on('click','#btnMenu',function() {
		$('#dlgMenu').dialog({
			width:560,
			open:function() {
			$.get('select', {}, function(txt) {
			       if (txt == "")
			          return false;
			       let rec = txt.split(';');
			       for (i = 0; i < rec.length; i++) {  /*위에서 구한 값들을 여기서 처리한다..각셀에 집어넣는다는 뜻*/
			          let field = rec[i].split(',');
			          let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			          $('#selMenu1').append(html);
			          console.log(html);
			       }
			    })
			 },
			 close:function() {
				 $('#selMenu').empty();
				 $('#selMenu1').empty();
				 loadMenu();
			}
			});
		})
		
		.on('change','#selMenu1',function() {
            let strr=$('#selMenu1 option:selected').text();
            let arr=strr.split(' ');
            $('#code').val(arr[0]);
            $('#name').val(arr[1]);
            $('#price').val(arr[2]);

        })
        
        .on('click','#btnGo',function() {
			let operation = '';
			if ($('#code').val() == '') {
				if ($('#name').val() != '' && $('#price').val() != '') {
					operation = "insert";   //insert
				} else {
					alert('입력값이 모두 채워지지 않았습니다.');
					return false;
				}
				} else {
					if ($('#code').val() != '' && $('#name').val() != '' && $('#price').val() != '') {
						operation = "update";   //update
					} else {
						operation = "delete";   //delete
					}
				}	
				$.get(operation, {code : $('#code').val(),name : $('#name').val(),price : $('#price').val()}, function(txt) {
					$('#code,#name,#price').val("");
					loadMenu();
					loadMenu1();
				}, 'text');
				return false;
        	})
        
	function loadMenu() {
		$('#selMenu').empty();
		$.get('select', {}, function(txt) {
		       if (txt == "") {
		          return false;
		       }
		       let rec = txt.split(';');
		       for (i = 0; i < rec.length; i++) {
		          let field = rec[i].split(',');
		          let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
		          $('#selMenu').append(html);
		          console.log(html);
		       }
		    })
		    nTotal=0;
	        nTotal=parseInt(nTotal);
	}
	
	function loadMenu1() {
		$('#selMenu1').empty();
		$.get('select', {}, function(txt) {
		       if (txt == "") {
		          return false;
		       }
		       let rec = txt.split(';');
		       for (i = 0; i < rec.length; i++) {
		          let field = rec[i].split(',');
		          let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
		          $('#selMenu1').append(html);
		          console.log(html);
		       }
		    })
	}
		

</script>
</html>





























