$(function(){

    $('#boardInputFormBtn').click(function(){



        $('#subjectDiv').empty();
        $('#userTotCntDiv').empty();

        if($('#UserId').val()==''){
            alert("로그인 후 이용가능합니다.");
        }else if($('#subject').val()==''){
            $('#subjectDiv').text('제목을 입력하세요');

        }else if($('#userTotCnt').val()==''){
            $('#userTotCntDiv').html('<font color="red">모집인원을 입력해주세요.</font>');
        }else if($('#projectType').val()=='default'){
            $('#userTotCntDiv').html('<font color="blue">모집유형을 선택해주세요.</font>');
        }else if($('#projectField').val()=='default'){
            $('#userTotCntDiv').html('<font color="green">모집분야을 선택해주세요.</font>');
        }else if(!$('input:checked[name="lang"]').is(":checked")){
            $('#langDiv').text('언어를 선택해주세요');
        }else  {
            $.ajax({
                type: 'post',
                url: 'boardInputData',
                data: $('#boardInputForm').serialize(),
                success: function (data) {
                    alert('글쓰기 완료');
                    location.href = 'boardListMain?pg=1';

                },
                error: function (e) {
                    console.log(e);
                }

            });
        }

    });

});