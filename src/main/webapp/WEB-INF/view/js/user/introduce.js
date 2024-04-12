$(function(){
    $('#insertBtn').click(function(){
            $.ajax({
                type: 'post',
                url: '/user/introduceForm',
                data: $('#introduceForm').serialize(), //변수=값&변수=값
                success: function(){
                    location.href='/user/myPage';
                },
                error: function(e){
                    console.log(e);
                }
            });
    });
});