

$(function (){
    $.ajax({
        type:'post',
        data:{'pg':$('#pg').val()},
        url:'boardListGet',
        dataType:'json',
        success:function(data){
            /*alert('글 불러오기 완료');*/
            console.log(JSON.stringify(data));
            $.each(data.list,function(index,items){


                var date = new Date(items.date);
                var todayDate = new Date();
                var hours= (date.getHours()*60)+date.getMinutes();

                if(date.getDate()==todayDate.getDate()){
                    if(date.getHours()==todayDate.getHours()){
                        if(date.getMinutes()==todayDate.getMinutes()){
                            hours="지금";
                        }else{
                            hours=todayDate.getMinutes()-date.getMinutes()+"분 전";
                        }

                    }else{

                        if(((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes())<60){
                            hours=((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes())+"분 전";
                        }else{
                            hours=Math.floor((((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes()))/60)+"시간"+(((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes()))%60+"분 전";
                        }

                    }
                }else{
                    hours=todayDate.getDate()-date.getDate()+"일 전";
                }

                var userTotCnt = items.userTotCnt;
                var userCurCnt = items.userCurCnt;

                if(userTotCnt==userCurCnt){
                    // var userCnt="모집 마감("+userTotCnt+"/"+userTotCnt+")";
                    var userCnt="모집 마감이 된 프로젝트 입니다.";

                    var result=
                        `<a href="boardListDetail?boardid=`+items.boardid+`" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true" >`
                        +`<div class=" gap-2 w-100 justify-content-between">`
                        +`<div>`
                        +`<small class="opacity-50 text-nowrap ms-3">`+items.userId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+hours+`</small>&emsp;<small class="opacity-50 text-nowrap">조회수</small><small class="opacity-50 text-nowrap">`+items.hit+`</small>`
                    ;
                }else{
                    var userCnt="모집 중("+userCurCnt+"/"+userTotCnt+")";

                    var result=
                        `<a href="boardListDetail?boardid=`+items.boardid+`" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true" >`
                        +`<div class=" gap-2 w-100 justify-content-between">`
                        +`<div>`
                        +`<small class="opacity-50 text-nowrap ms-3">`+items.userId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+hours+`</small>&emsp;<small class="opacity-50 text-nowrap">조회수</small><small class="opacity-50 text-nowrap">`+items.hit+`</small>`
                    ;
                }


                $.ajax({
                    type:'post',
                    url:'checkBoardScrap',
                    async:false,
                    data:{'boardid':items.boardid,
                        'userId':$('#sessionId').val()},
                    dataType:'text',
                    success:function (data){
                        console.log(data);
                        if(data=='non_exist'){
                            result= result+`<img src="/image/bookmark2.png" id="bookmark"  class="rounded float-end"  alt="bookmark" style="width: 24px;height: 24px">`
                        +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">`+userCnt+`</h6>`
                        }else{
                            result= result+`<img src="/image/bookmark1.png" id="bookmark"  class="rounded float-end"  alt="bookmark" style="width: 24px;height: 24px">`
                                +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">`+userCnt+`</h6>`
                        }



                    },
                    error:function (e){
                        console.log(e);
                    }

                });






                tagInsert(result,items,data.boardPaging);

            });



        },
        error:function(e){
            console.log(e);
        }

    });
});

function tagInsert(result, items,boardPaging){
    $.ajax({
        type:'post',
        data:'boardid='+items.boardid,
        async:false,
        url:'boardTagGet',
        dataType:'text',
        success:function(data){
            console.log(data);
            if(data.indexOf(",")==-1){

                result=result
                    +`<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>`+data+`</button>`
                    +`<button type="button" class="btn btn-outline-info rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectType+`</button>`
                    +`<button type="button" class="btn btn-outline-success rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectField+`</button>`
                    +`</div>`
                    +`</div>`
                    +`</a>`
                    +`<br>`;

            }else{

                var tag = data.split(",");
                for(var i=0;i<tag.length;i++){
                    result=result+`<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>`+tag[i]+`</button>`;
                }
                result=result
                    +`<button type="button" class="btn btn-outline-info rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectType+`</button>`
                    +`<button type="button" class="btn btn-outline-success rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectField+`</button>`
                    +`</div>`
                    +`</div>`
                    +`</a>`
                    +`<br>`;
            }
            $('#list-group').append(result);
            $('#pagingDiv').html(boardPaging);
        },
        error:function(e){
            console.log(e);
        }
    });



}




var cnt=1;
var lang="";
$('#selectLang').change(function(){
    var val= $(this).val();
    cnt++;
    if(val!="default" && cnt<=3){

        var result= `<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" onclick="filterRemove(this)" value="`+val+`" >`+val+`</button>`
        if(cnt==3){
            lang=lang+","+val;
        }else{
            lang=lang+val;
        }

        $('#selectDiv').append(result);
        filterSelect();
        $(this).val('default').prop('selected',true);
    }else{
        alert("최대 2개까지만 선택 가능합니다.");
    }
});

var cnt1=1;
var type="";
$('#selectType').change(function(){
    var val= $(this).val();
    cnt1++;
    if(val!="default" && cnt1==2){

        var result= `<button type="button" class="btn btn-outline-info rounded-pill btn-sm ms-3 mt-2" onclick="filterRemove1(this)">`+val+`</button>`
        type=type+val;
        $('#selectDiv1').append(result);
        filterSelect();
        $(this).val('default').prop('selected',true);
    }else{
        alert("최대 1개까지만 선택 가능합니다.");
    }
});

var cnt2=1;
var field="";
$('#selectField').change(function(){
    var val= $(this).val();
    cnt2++;
    if(val!="default" && cnt2==2){
        var result= `<button type="button" class="btn btn-outline-success rounded-pill btn-sm ms-3 mt-2" onclick="filterRemove2(this)" >`+val+`</button>`
        field=field+val;
        $('#selectDiv2').append(result);
        filterSelect();
        $(this).val('default').prop('selected',true);
    }else{
        alert("최대 1개까지만 선택 가능합니다.");
    }
});

function filterRemove(my){
    var myvalue=$(my).val();
    my.remove();

    /*console.log("lang_before"+lang);*/
    if(cnt==2){
        lang="";
        cnt=1;
    }else{
        lang=lang.replace(myvalue,"");
        lang=lang.replace(",","");
        cnt=2;
    }
    /*console.log("lang_after"+lang);*/

    filterSelect();
}
function filterRemove1(my){
    my.remove();
    type="";
    cnt1=1;
    filterSelect();
}
function filterRemove2(my){
    my.remove();
    field="";
    cnt2=1;
    filterSelect();
}


function filterSelect(){
    $('#list-group').empty();
    $.ajax({
        data:{'type':type,
            'field':field
            },
        type:'post',
        url:'boardListGet1',
        dataType:'json',
        success:function(data){
            /*alert('글 불러오기 완료');*/
            console.log(JSON.stringify(data));
            $.each(data,function(index,items){


                var date = new Date(items.date);
                var todayDate = new Date();
                var hours= (date.getHours()*60)+date.getMinutes();

                if(date.getDate()==todayDate.getDate()){
                    if(date.getHours()==todayDate.getHours()){
                        if(date.getMinutes()==todayDate.getMinutes()){
                            hours="지금";
                        }else{
                            hours=todayDate.getMinutes()-date.getMinutes()+"분 전";
                        }

                    }else{

                        if(((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes())<60){
                            hours=((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes())+"분 전";
                        }else{
                            hours=Math.floor((((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes()))/60)+"시간"+(((todayDate.getHours()*60)+todayDate.getMinutes())-((date.getHours()*60)+date.getMinutes()))%60+"분 전";
                        }

                    }
                }else{
                    hours=todayDate.getDate()-date.getDate()+"일 전";
                }

                var userTotCnt = items.userTotCnt;
                var userCurCnt = items.userCurCnt;

                if(userTotCnt==userCurCnt){
                    // var userCnt="모집 마감("+userTotCnt+"/"+userTotCnt+")";
                    var userCnt="모집 마감이 된 프로젝트 입니다.";
                    var result=
                        `<a href="boardListDetail?boardid=`+items.boardid+`" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true" >`
                        +`<div class=" gap-2 w-100 justify-content-between">`
                        +`<div>`
                        +`<small class="opacity-50 text-nowrap ms-3">`+items.userId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+hours+`</small>&emsp;<small class="opacity-50 text-nowrap">조회수</small><small class="opacity-50 text-nowrap">`+items.hit+`</small>`
                    ;

                }else{
                    var userCnt="모집 중("+userCurCnt+"/"+userTotCnt+")";
                    var result=
                        `<a href="boardListDetail?boardid=`+items.boardid+`" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">`
                        +`<div class=" gap-2 w-100 justify-content-between">`
                        +`<div>`
                        +`<small class="opacity-50 text-nowrap ms-3">`+items.userId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+hours+`</small>&emsp;<small class="opacity-50 text-nowrap">조회수</small><small class="opacity-50 text-nowrap">`+items.hit+`</small>`
                    ;
                }


                $.ajax({
                    type:'post',
                    url:'checkBoardScrap',
                    async:false,
                    data:{'boardid':items.boardid,
                        'userId':$('#sessionId').val()},
                    dataType:'text',
                    success:function (data){
                        console.log(data);
                        if(data=='non_exist'){
                            result= result+`<img src="/image/bookmark2.png" id="bookmark"  class="rounded float-end"  alt="bookmark" style="width: 24px;height: 24px">`
                                +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">`+userCnt+`</h6>`
                        }else{
                            result= result+`<img src="/image/bookmark1.png" id="bookmark"  class="rounded float-end"  alt="bookmark" style="width: 24px;height: 24px">`
                                +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">`+userCnt+`</h6>`
                        }



                    },
                    error:function (e){
                        console.log(e);
                    }

                });


                tagInsert1(result,items);

            });



        },
        error:function(e){
            console.log(e);
        }

    });
}

function tagInsert1(result, items){
    $.ajax({
        type:'post',
        data:'boardid='+items.boardid,
        async:false,
        url:'boardTagGet',
        dataType:'text',
        success:function(data){
            console.log(data);
            if(data.indexOf(",")==-1){

                if(lang.includes(data) ==false && lang!="" || lang.indexOf(",")!=-1){
                    return ;
                }
                result=result
                    +`<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>`+data+`</button>`
                    +`<button type="button" class="btn btn-outline-info rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectType+`</button>`
                    +`<button type="button" class="btn btn-outline-success rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectField+`</button>`
                    +`</div>`
                    +`</div>`
                    +`</a>`
                    +`<br>`;


            }else{
                var lang1= lang.split(",");
                var tag = data.split(",");
                console.log("lang="+lang);
                for(var i=0;i<lang1.length;i++){
                    if(data.includes(lang1[i])== false && lang!=""){
                        return ;
                    }
                }
                for(var i=0;i<tag.length;i++){

                    result=result+`<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>`+tag[i]+`</button>`;

                }
                result=result
                    +`<button type="button" class="btn btn-outline-info rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectType+`</button>`
                    +`<button type="button" class="btn btn-outline-success rounded-pill btn-sm ms-3 mt-2" disabled>`+items.projectField+`</button>`
                    +`</div>`
                    +`</div>`
                    +`</a>`
                    +`<br>`;
            }
            $('#list-group').append(result);
            $('#pagingDiv').empty();
            if(lang=="" && field=="" && type=="" ){
                window.location.reload();
            }

        },
        error:function(e){
            console.log(e);
        }
    });
}


