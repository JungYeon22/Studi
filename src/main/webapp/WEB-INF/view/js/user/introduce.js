$(function(){
    $('#insertBtn').click(function(){
            $.ajax({
                type: 'post',
                url: 'introduce',
                data: $('#introduceForm').serialize(), //변수=값&변수=값
                success: function(){
                    location.href='myPage';
                },
                error: function(e){
                    console.log(e);
                }
            });
    });
});