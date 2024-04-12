var likeList;

$(function (){
    if($('#userId').val()!=''){
        // 글쓰기 기능
        $('#fBoardWriteModalBtn').attr({
            'data-bs-toggle': "modal",
            'data-bs-target': "#fBoardWriteModal"
        });

        // 사용자의 좋아요를 누를 게시글 번호리스트를 가져온다.

        $.post({
            url: '/freeBoard/getUserLikeList'
            , data: 'userId='+$('#userId').val()
            , dataType: 'json'
            , success: function (data){
                console.log(JSON.stringify(data));  // 콘솔로 확인하려고
                likeList = data;
                $.each(data, function(index, number){
                    $('.likeBtn[data-number="'+number+'"]').addClass('active');
                })
            }
            , error: function(e){
                console.log(e)
            }
        })

        // 좋아요 버튼을 눌렀을 떄
        $(document).on('click', '.likeBtn', function(){
            var num = $(this).siblings('input[type="hidden"]'); // 해당 게시글 번호 가져오기
            var pressValue = $(this).hasClass('active');
            console.log(pressValue);
            var like = num.siblings('.likeValue').text();
            var likeCount;
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
       /* $('.likeBtn').click(function (){

        })*/
    }else {
        $('#fBoardWriteModalBtn').attr({
            'data-bs-toggle': "collapse",
            'data-bs-target': "#BbsCollapse",
            'aria-expanded': 'false',
            'aria-controls': 'BbsCollapse'
        });

    }
function checkLikeList(data) {
    $.each(data, function(index, number){
        $('.likeBtn[data-number="'+number+'"]').addClass('active');
    })
 }



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
        var elapsedTime = getTimeAgo(mysqlFormatDateTime);
        dateElement.text(elapsedTime);
    })
})
function getTimeAgo(mysqlDateTime){
    var now = new Date();
    var pastTime = new Date(mysqlDateTime);
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

$(document).ready(function(){
    // 무한 스크롤
    const options = {threshold: 0.5};
    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            // 화면에 보이면 새로운 내용을 추가
            if (entry.isIntersecting && !loading) {
                loading = true;
                page += 1;
                addNewContent(page,observer);
                observer.unobserve(entry.target);
            }
        })
    }, options);

// 자유게시판 게시글을 observer 객체에 넣기
    const fBoard = $('#fBoardContainer .content')
    observer.observe(fBoard[4])

})

var page = 1;
var loading = false;

function addNewContent(page,observer){
    $.post({
        url: '/freeBoard/getBoardList',
        data: 'page='+page,
        dataType: 'json',
        success: function (data){
            console.log(JSON.stringify(data))
            $.each(data, function(index, items){
                //시간 형식 설정
                var date = new Date(items.date);
                var dateResult = getTimeAgo(date);
                var result = `
                <div class="content row mt-4">
                    <div class="col-md-8">
                      <div class="card mb-3">
                        <div class="card-header">
                          <strong>`+items.title+`</strong>
                          <div class="text-end">
                            <small>작성자:`+ items.writer +` | 작성시간:</small>
                            <small class="text-muted">`+ dateResult + `</small>
                          </div>
                        </div>
                        <div class="card-body m-3">
                          <p class="card-text" id="contentValue">
                              `+items.content+`
                          </p>
                        </div>
                        <div class="card-footer text-end">
                          <i class="fa-regular fa-thumbs-up"></i>
                          <span class="likeValue">`+items.likes+`</span>
                          <button type="button" class="btn btn-primary likeBtn" data-number="`+items.fboard+`" data-bs-toggle="button" aria-pressed="false">좋아요</button>
                          <input type="hidden"  value="`+items.fboard+`">
                        </div>
                      </div>
                    </div>
                </div>`
                $('#fBoardContainer').append(result)
            })

            $.each(likeList, function(index, number){
                $('.likeBtn[data-number="'+number+'"]').addClass('active');
            })
            // 자유게시판 게시글을 observer 객체에 넣기
            const fBoard = $('#fBoardContainer .content')
            if(fBoard[page * 5 - 1] != null){
                observer.observe(fBoard[page * 5 - 1])
            }
            loading = false;
        },
        error: function (e){
            console.log(e);
        }
    })
}
