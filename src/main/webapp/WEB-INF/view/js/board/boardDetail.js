$(function (){
    $.ajax({
        type:'post',
        url:'checkBoardScrap',
        async:false,
        data:{'boardid':$('#boardid').val(),
            'userId':$('#sessionId').val()},
        dataType:'text',
        success:function (data){
            console.log(data);
            if(data=='non_exist'){
                $('#bookmark').attr('src','/image/bookmark2.png');
            }else{
                $('#bookmark').attr('src','/image/bookmark1.png');
            }



        },
        error:function (e){
            console.log(e);
        }

    });

    $.ajax({
        type:'post',
        url:'loadReply',
        data:{'boardid':$('#boardid').val()},
        dataType:'json',
        success:function (data){
            console.log(JSON.stringify(data));
            $.each(data,function(index,items){

                if(items.ref == items.no) {
                    console.log("same");
                    var result =`
                    <div class="row" style="width: 95%; margin-top: 3px; margin-left: 10px">
                        <div class="col-sm-1 dropdown "  style="width: 50px;">
                            <img src="/image/icons8-동물-30.png"
                                 class="rounded  dropdown-toggle" role="button" data-bs-toggle="dropdown"
                                 aria-expanded="false" style=" vertical-align: middle;" alt="profile"/>
                            <div >
                                <small style="margin-left: 5px;">` +  items.userId+`</small>
                            </div>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">프로필 보기</a></li>
                                <li><a class="dropdown-item" href="#">채팅하기</a></li>
                                <li><a class="dropdown-item" href="#">신고하기</a></li>
                            </ul>
                        </div>
                        <div class=" col card  rounded-3 bg-body-white " style="width: 90%;"> `+ items.text+`
                        </div>
                        <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                            <div>
                                <img src="/image/edit.png" class="rounded "
                                     alt="edit"/>
                            </div>
                            <img src="/image/remove.png" class="rounded "
                                 alt="remove"/>
                        </div>
                    </div>`;
                } else {
                    console.log("diff");
                    var result=`
                    <div class="row" style="width: 100%;">
                        &emsp;&emsp;
                        <div class="col-sm-1 dropdown" style="width: 50px; margin-left: 10px">
                            <img src="/image/icons8-테디-베어-30.png"
                                 class="rounded dropdown-toggle" role="button" data-bs-toggle="dropdown"
                                 aria-expanded="false" style="vertical-align: middle;" alt="profile"/>
                            <div>
                                <small style="margin-left: 5px;">`+items.userId+`</small>
                            </div>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">프로필 보기</a></li>
                                <li><a class="dropdown-item" href="#">채팅하기</a></li>
                                <li><a class="dropdown-item" href="#">신고하기</a></li>
                            </ul>
                        </div>
                        <div class=" col card  rounded-3 bg-body-white " style="width: 100%;margin-top: 5px;">`+ items.text+`
                        </div>
                        <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                            <div><img src="/image/edit.png" class="rounded "
                                      alt="edit"/></div>
                            <img src="/image/remove.png" class="rounded "
                                 alt="remove"/>
                        </div>
                    </div>`;
                }

                $('#replyDiv').append(result);
            });

        },
        error: function (e) {
            console.log(e);
        }

    });


});

function boardScrap() {

    if($('#sessionId').val()==''){
        alert("로그인 후 이용가능합니다.");
    }else{
        $.ajax({
            type: 'post',
            url: 'boardScrap',
            data: {
                'boardid': $('#boardid').val(),
                'userId': $('#sessionId').val()
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
                if (data == 'non_exist') {
                    alert("스크랩 완료!!");
                    window.location.reload();
                } else {
                    if (confirm('스크랩을 해제하시겠습니까?')) {
                        $.ajax({
                            type: 'post',
                            url: 'removeBoardScrap',
                            data: {
                                'boardid': $('#boardid').val(),
                                'userId': $('#sessionId').val()
                            },
                            success: function (data) {
                                console.log(data);
                                alert("스크랩 해제완료!!");
                                window.location.reload();

                            },
                            error: function (e) {
                                console.log(e);
                            }

                        });
                    }
                }

            },
            error: function (e) {
                console.log(e);
            }

        });
    }
}


function removeBoard(){
    if(confirm('정말 게시글을 삭제하시겠습니까?')){
        $.ajax({
            type:'post',
            url:'removeBoard',
            data:{'boardid':$('#boardid').val(),
                'userId':$('#userId').val()},
            success:function (data){
                console.log(data);
                alert('게시글 삭제 완료!!');
                location.href="boardListMain?pg=1";

            },
            error:function (e){
                console.log(e);
            }

        });
    }
}

var ref=0;
$('#replyBtn').click(function(){
    // alert($('#reply').val());

    if($('#sessionId').val()==''){
        alert("로그인 후 이용가능합니다.");
    }else if($('#reply').val()==''){
        alert("댓글을 입력하세요.");
    }else{
        $.ajax({
            type:'post',
         url:'addReply',
         data:{'boardid':$('#boardid').val(),
                'userId':$('#sessionId').val(),
             'text':$('#reply').val(),
             'ref':ref},
         success:function (data){
               console.log(data);
               alert("댓글 작성 완료!!");
               window.location.reload();

            },
           error:function (e){
               console.log(e);
           }

     });
    }
});