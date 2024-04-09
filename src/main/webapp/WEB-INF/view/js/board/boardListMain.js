$(function (){
    $.ajax({
        type:'post',
        url:'boardListGet',
        dataType:'json',
        success:function(data){
            alert('글 불러오기 완료');
            console.log(JSON.stringify(data));
            $.each(data,function(index,items){

                var result=
                    `<a href="boardListDetail" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">`
                    +`<div class=" gap-2 w-100 justify-content-between">`
                    +`<div>`
                    +`<small class="opacity-50 text-nowrap ms-3">`+items.UserId+`</small>&emsp;<small class="opacity-50 text-nowrap">`+items.DATE+`</small>&emsp;<small class="opacity-50 text-nowrap">좋아요</small><small class="opacity-50 text-nowrap">`+items.HIT+`</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">`
                    +`<h6 class="mb-0 ms-3" >`+items.subject+`</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 중(4/5)</h6>`
                    +`<button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button><button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>`
                    +`</div>`
                    +`</div>`
                    +`</a>`
                    +`<br>`;

                $('#list-group').append(result);
            });



        },
        error:function(e){
            console.log(e);
        }

    });
});