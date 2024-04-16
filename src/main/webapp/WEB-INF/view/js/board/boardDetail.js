$(function (){
    $.ajax({
        type:'post',
        url:'checkBoardScrap',
        data:{'boardid':$('#boardid').val(),
            'userId':$('#userId').val()},
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


});

function boardScrap(){

    $.ajax({
        type:'post',
        url:'boardScrap',
        data:{'boardid':$('#boardid').val(),
            'userId':$('#userId').val()},
        dataType:'text',
        success:function (data){
            console.log(data);
            if(data=='non_exist'){
                alert("스크랩 완료!!");
                window.location.reload();
            }else{
                if(confirm('스크랩을 해제하시겠습니까?')){
                    $.ajax({
                        type:'post',
                        url:'removeBoardScrap',
                        data:{'boardid':$('#boardid').val(),
                            'userId':$('#userId').val()},
                        success:function (data){
                            console.log(data);
                            alert("스크랩 해제완료!!");
                            window.location.reload();

                        },
                        error:function (e){
                            console.log(e);
                        }

                    });
                }
            }

        },
        error:function (e){
            console.log(e);
        }

    });
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
