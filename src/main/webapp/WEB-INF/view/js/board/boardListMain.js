

$(function (){
    $.ajax({
        type:'post',
        url:'boardListGet',
        dataType:'json',
        success:function(data){
            alert('글 불러오기 완료');
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
                    var userCnt="모집 마감("+userTotCnt+"/"+userTotCnt+")";
                }else{
                    var userCnt="모집 중("+userCurCnt+"/"+userTotCnt+")";
                }



                var result=
                    `<a href="boardListDetail" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">`
                    +`<div class=" gap-2 w-100 justify-content-between">`
                    +`<div>`
                    +`<small class="opacity-50 text-nowrap ms-3">`+items.userId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+hours+`</small>&emsp;<small class="opacity-50 text-nowrap">조회수</small><small class="opacity-50 text-nowrap">`+items.hit+`</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">`
                    +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">`+userCnt+`</h6>`
                ;

                tagInsert(result,items);

            });



        },
        error:function(e){
            console.log(e);
        }

    });
});

function tagInsert(result, items){
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
        },
        error:function(e){
            console.log(e);
        }
    });
}