$(function (){
    // 사용자의 좋아요를 누를 게시글 번호리스트를 가져온다.
    $.post({
        url: '/freeBoard/getUserLikeList'
        , data: 'userId='+$('#userId').val()
        , dataType: 'json'
        , success: function (data){
            console.log(JSON.stringify(data));  // 콘솔로 확인하려고
            $.each(data, function(index, number){
                console.log(number)
                $('.likeBtn[data-number="'+number+'"]').addClass('active');
            })
        }
        , error: function(e){
            console.log(e)
        }

    })

    // 좋아요 버튼을 눌렀을 떄
    $('.likeBtn').click(function (){
        var num = $(this).siblings('input[type="hidden"]'); // 해당 게시글 번호 가져오기
        alert(num.val());
        var pressValue = $(this).hasClass('active');
        console.log(pressValue);
        var like = num.siblings('.likeValue').text();
        var likeCount
        if(pressValue){
            likeCount = parseInt(like) + 1;
            num.siblings('.likeValue').text(likeCount);
        }else{
            likeCount = parseInt(like) - 1;
            num.siblings('.likeValue').text(likeCount);
        }

        $.post({
            url: '/freeBoard/updateLike',
            data: 'num='+num.val()+"&userId="+$('#userId').val(),
            success: function (){
                console.log("성공")
            },
            error: function (e){
                console.log(e);
            }
        })
    })
    // 날짜 포멧 original : Tue Apr 09 16:49:50 KST 2024 -> 1분전..
    $('.card-header').each(function (){
        var dateElement = $(this).find('.text-muted');
        var mysqlDateTime = dateElement.text().split(' ');

        var monthMap = {
            'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 'May': '05', 'Jun': '06',
            'Jul': '07', 'Aug': '08', 'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
        };

        var year = mysqlDateTime[5];
        var month = monthMap[mysqlDateTime[1]];
        var day = mysqlDateTime[2];
        var time = mysqlDateTime[3];

        var mysqlFormatDateTime = year + '-' + month + '-' + day + ' ' + time;
        console.log(mysqlFormatDateTime);

        var elapsedTime = getTimeAgo(mysqlFormatDateTime);
        console.log(elapsedTime);

        dateElement.text("작성시간: " + elapsedTime);
        dateElement.textContent = "작성시간: " + elapsedTime;
    })
})
function getTimeAgo(mysqlDateTime){
    var now = new Date();
    var pastTime = new Date(mysqlDateTime);
    console.log("자바스크립트 date type으로 바꿈 : " + pastTime)
    var diffMillis = now - pastTime;
    var minutes = Math.floor(diffMillis / (1000 * 60));

    // 하루단위
    if(minutes >= 24*60 && minutes <= 24*60*7){
        return Math.floor(minutes/ (24*60)) + '일 전';
    }
//일주일이 지나면 그냥 날짜로 표시
    if(minutes > 24*60*7){
        var year = pastTime.getFullYear();
        var month = String(pastTime.getMonth() + 1).padStart(2, '0');
        var day = String(pastTime.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    if (minutes === 0) {
        return "방금 전";
    } else if (minutes === 1) {
        return "1분 전";
    } else if (minutes < 60) {
        return minutes + "분 전";
    } else {
        var hours = Math.floor(minutes / 60);
        return hours + "시간 전";
    }
}