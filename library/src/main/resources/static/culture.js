// 기본 구성


$(function() {
	$("#class_period_start").datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(selectedDate) {
			$("#class_period_end").datepicker("option", "minDate", selectedDate);
		}
	});

	$("#class_period_end").datepicker({
		dateFormat: 'yy-mm-dd'
	});
});

$(function() {
	$("#reservation_period_start").datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(selectedDate) {
			$("#reservation_period_end").datepicker("option", "minDate", selectedDate);
		}
	});

	$("#reservation_period_end").datepicker({
		dateFormat: 'yy-mm-dd'
	});
});

function culture_check() {
	var title = document.getElementsByName('title');
	var class_period_start = document.getElementById('class_period_start').value;
	var class_period_end = document.getElementById('class_period_end').value;
	var reservation_period_start = document.getElementById('reservation_period_start').value;
	var reservation_period_end = document.getElementById('reservation_period_end').value;
	var target = document.getElementsByName('target');
	var event_area = document.getElementsByName('event_area');
	var reception_area = document.getElementsByName('reception_area');
	var people = document.getElementsByName('people');
	var teacher = document.getElementsByName('teacher');
	var contents = document.getElementsByName('contents');

	if (title[0].value == "") {
		alert('제목을 입력해주세요.');
	}else if(class_period_start == ""){
		alert('행사 시작일을 입력해주세요.');
	}else if(class_period_end == ""){
		alert('행사 종료일을 입력해주세요.');
	}else if(reservation_period_start == ""){
		alert('신청 시작일을 입력해주세요.');
	}else if(reservation_period_end == ""){
		alert('신청 종료일을 입력해주세요.');
	}else if(target[0].vlaue == ""){
		alert('수강대상을 입력해주세요');
	}else if(event_area[0].value == ""){
		alert('행사 장소를 입력해주세요.');
	}else if(reception_area[0].value == ""){
		alert('접수장소를 입력해주세요.');
	}else if(people[0].value == ""){
		alert('모집인원을 입력해주세요.');
	}else if(teacher[0].value == ""){
		alert('강사명을 입력해주세요.');
	}else if(contents[0].value == ""){
		alert('내용을 입력해주세요.');
	} else { document.getElementById('f').submit(); }
}

