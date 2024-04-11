$(function(){

    $('#boardInputFormBtn').click(function(){

        $.ajax({
            type:'post',
            url:'/board/boardInputData',
            data:$('#boardInputForm').serialize(),
            dataType: 'json',
            success:function(data){
                alert('글쓰기 완료');
                location.href='boardListMain';

            },
            error:function(e){
                console.log(e);
            }

        });
    });

});