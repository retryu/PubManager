$(document).ready(function() {

	var warning_lable = $('#warning_lable');
	var member_info = $('.member_info');
	var order = {};
	var dialog = $('.roomdialog');
	var items = $('.room_item');
	var a = $('.paging-button');

	var bill = $('#bill');
	var orderroom = $('#orderroom');
	var action = $("#action");
	bill.onclick = function() {
		alert("bill");
	}

	for (i = 0; i < items.length; i++) {
		items[i].onclick = function() {
			order.num = this.cells[0].innerText;
			order.state = this.cells[1].innerText;
			order.type = this.cells[2].innerText;
			order.floor = this.cells[3].innerText;
			order.price = this.cells[4].innerText;
			order.check_in = this.cells[5].innerText;
			order.check_out = this.cells[6].innerText;
			load(order);

			if (order.state == "住房") {
			 
				warning_lable.attr('hidden', false);
				warning_lable.text("房间工住xx天 花了xx");
				member_info.attr('hidden', true);
				bill.attr('hidden', false);
				orderroom.attr('hidden', true);
				var url = "http://localhost:8080/PubManager/room";
				$.post(url, {
					room_id : order.num,
					action : 'settlement'
				}, function(data, status) {
					warning_lable.text(data);
					// alert(status);
				});
			}
			if (order.state == "空净房") {
				$('#check_in').attr('placeholder','');
				$('#check_out').attr('placeholder','');
				warning_lable.attr('hidden', true);
				member_info.attr('hidden', false);

			}

			if (dialog.css('display') == "none") {
				dialog.fadeIn(300);
			} else {
				dialog.fadeOut(300);
			}
		}

	}
	$('#warning_lable').attr('hidden', true);

})

function load(order) {
	$('#room_number').val(order.num);
	$('#room_floor').val(order.floor);
	$('#room_type').val(order.type);
	$('#room_price').val(order.price);

}

function submit() {
	var idcard = $('#idcard');
	var warning_lable = $('#warning_lable');
	var check_in = $("#endto");
	var check_out = $("#from");
	if (check_in.val() == "" || check_out.val() == "") {
		warning_lable.text('请输入入住和离开的日期.亲');
		warning_lable.attr('hidden', false);
		return;
	}

	if (idcard.val().length < 15 || idcard.val().length > 18) {
		warning_lable.attr('hidden', false);
		$('#warning_lable').text('请输入真确的省份证号码，亲');
		return;
	}
	var form = $('#mf');
	var url = "http://localhost:8080/PubManager/room";

	// alert("check_in"+$('#check_in').val()+" out"+$('#check_in').val());
	// return ;

	$.post(url, {
		member_id : idcard.val(),
		action : 'checkmember',
		check_in : $('#check_in').val(),
		check_out : $('#check_out').val()
	}, function(data, status) {

		if (data == "exist") {

			warning_lable.text("该身份证已经被注册过，亲");
			warning_lable.attr('hidden', false);
			return;
		} else {
			form.submit();
			// window.location.href="/PubManager/room";
		}

	});

	// form.submit();
}

function cancel() {
	$('.roomdialog').fadeOut(300);
}
function bill() {

	var action = $("#action");
	action.val('bill');
	var form = $('#mf');
	form.submit();
}
