$(document)
	.ready(function() {
		Menu();
		selsales();
		$('#total').val();
		return false;
		
	})
	
	.on('change','#selMenu',function(){
       str=$('#selMenu option:selected').text();
       let ar=str.split(' ');
       $('#menuname').val(ar[1]);
       $('#count').val(1);
       $('#menuprice').val(ar[2]);
   })
   
   .on('change','#count',function() {
	   str=$('#selMenu option:selected').text();
	   let ar=str.split(' ');
	   bb=$('#count').val();
	   $('#menuprice').val(ar[2]*bb);
   })
   
   .on('click','#btnReset',function() {
	   $('#menuname, #menuprice, #count').val('')
   })
   
    .on('click','#btnReset1',function() {
	   $('#code, #name, #price').val('')
   })
   
   .on('click','#btnAdd',function(){
        Addmenuprice=$('#menuprice').val();
	   str = $('#selMenu option:selected').text();
        let ar=str.split(' ');
        strOrder='<option>'+ar[0]+' '+$('#menuname').val()+' '+$('#count').val()+' '+$('#menuprice').val()+'</option>';
        $('#selOrder,#selOrder1').append(strOrder);
        Addmenuprice=parseInt(Addmenuprice);
        nTotal+=Addmenuprice;
        $("#total").val(nTotal);
    })
    
    .on('click','#btnCancel',function() {
    	$('#selOrder').empty();
    	$('#total').val('');
    	$('#mobile').empty();
    })
	
	.on('click','#btnDone',function(){
		if($('#mobile').val() == '') $('#mobile').val('없음');
		$('#selOrder option').each(function(){
			if($('#total').val() == 0) {
				alert('메뉴를 선택하세요!');
				return false;
			} else {
				str='<option>'+$('#mobile').val()+' '+$(this).text()+'</option>'
				$('#selSales').append(str);
			}
			
	   		let a=$(this).text();
	   		let rec=a.split(' ');
	   		console.log(rec);
			$.get('third_insert',{menu_code:rec[0],mobile : $('#mobile').val(),qty : rec[2],total : rec[3]},function(txt){},'text');
		})
		$('#selOrder').empty();
		$('#total,#mobile').val('');
	})
	
     // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴관리(다이얼로그)
     
	.on('click','#btnMenu',function() {
		$('#dlgMenu').dialog({
			width:560,
			open:function() {
			$.get('first_select', {}, function(txt) {
			       if (txt == "")
			          return false;
			       let rec = txt.split(';');
			       for (i = 0; i < rec.length; i++) {  /*위에서 구한 값들을 여기서 처리한다..각셀에 집어넣는다는 뜻*/
			          let field = rec[i].split(',');
			          let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			          $('#selMenu1').append(html);
			       }
			    })
			 },
			 close:function() {
				 $('#selMenu').empty();
				 $('#selMenu1').empty();
				 Menu();
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
					operation = "first_insert";   //insert
				}
				} else {
					if ($('#code').val() != '' && $('#name').val() != '' && $('#price').val() != '') {
						operation = "first_update";   //update
					} else {
						operation = "first_delete";   //delete
					}
				}	
				$.get(operation, {code : $('#code').val(),name : $('#name').val(),price : $('#price').val()}, function(txt) {
					$('#code,#name,#price').val("");
					Menu();
					Menu1();
				}, 'text');
				return false;
        	})
        	
        
	.on('click','#btnSummary',function() {
		$('#Sales_menu').dialog({
			width:560,
			open:function() {
				$.get('sales_menu', {}, function(txt) {
					if (txt == "") return false;
				       	let rec = txt.split(';');
				       	for (i = 0; i < rec.length; i++) {
				          	let field = rec[i].split(',');
				          	let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
				          	$('#SalesMenu').append(html);
				       }
				    }, 'text')
				$.get('sales_mobile', {}, function(txt) {
		       		if (txt == "") return false;
		       		let rec = txt.split(';');
		       		for (i = 0; i < rec.length; i++) {
		          		let field = rec[i].split(',');
		          		let html ='<option>'+field[0]+' '+field[1]+'</option>';
		          		$('#SalesMob').append(html);
		       		}
		    	}, 'text')
			},
			 close:function() {
				
			 }
			});
		})
	
	function selsales(){
		$('#selSales').empty();
		$.get('selsales',{},function(txt){
			if (txt ==""){
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2]+ ' ' + field[3] + ' ' + field[4] +'</option>';
				$('#selSales').append(html);
			}
		})
	}
	function Menu() {
		$('#selMenu').empty();
		$.get('first_select', {}, function(txt) {
			if (txt == "") {
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2] + '</option>';
				$('#selMenu').append(html);
			}
		})
	}
	
	function SalesMenu() {
		$('#selSales').empty();
		$.get('select_sales', {}, function(txt) {
			if (txt == "") {
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2] + ' ' + field[3] + ' ' + field[4] + ' ' + field[5] + '</option>';
				$('#selSales').append(html);
			}
		})
	}
	
 
	function Menu1() {
		$('#selMenu1').empty();
		$.get('first_select', {}, function(txt) {
			if (txt == "") {
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2] + '</option>';
				$('#selMenu1').append(html);
			}
		})
	}
	function salesmenu() {
		$('#SlaesMenu').empty();
		$.get('sales_menu', {}, function(txt) {
			if (txt == "") {
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2] + '</option>';
				$('#SalesMenu').append(html);
			}
		})
	}
	
	function salesmob() {
		$('#SlaesMob').empty();
		$.get('sales_mobile', {}, function(txt) {
			if (txt == "") {
				return false;
			}
			let rec = txt.split(';');
			for (i = 0; i < rec.length; i++) {
				let field = rec[i].split(',');
				let html = '<option>' + field[0] + ' ' + field[1] +'</option>';
				$('#SalesMob').append(html);
			}
		})
	}


	nTotal = 0;
	nTotal = parseInt(nTotal);
	
	var dt = new Date();
	dt.toLocaleDateString();