<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-04-19
  Time: 오후 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--모달--%>
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" data-bs-backdrop="static" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Modal 1</h1>
      </div>
      <div class="modal-body">
        <div class="input-form-background row mb-0 mt-0">
          <div class="input-form col-md-12 mx-auto">
            <label for="position"><span>주요 포지션</span></label>
            <input type="text" class="form-control" id="position" placeholder="back-end" required >
          </div>
          <div class="input-form col-md-12 mx-auto">
            <label for="career"><span>경력/신입</span></label>
            <input type="text" class="form-control" id="career" name="career" placeholder="경력" required >
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="moadl1" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">다음</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" data-bs-backdrop="static" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Modal 2</h1>
      </div>
      <div class="modal-body">
        <div class="input-form col-md-12 mx-auto mb-0 mt-0 p-1">
          <label for="skill"><span>사용가능 언어(다중선택)</span></label>
          <div class="skill" id="skill" role="group" aria-label="Basic checkbox toggle button group">
            <input type="hidden" id="arrayParam" name="arrayParam"/>
            <c:forEach var="item" items="${skillList}" varStatus="status">
              <input type="checkbox" class="btn-check" name="skill" id="skill${status.index}" value="${item}">
              <label class="btn btn-outline-dark" for="skill${status.index}">${item}</label>
            </c:forEach>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="moadl2" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">다음</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" data-bs-backdrop="static"  aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel3">Modal 3</h1>
      </div>
      <div class="modal-body">
        <div class="input-form col-md-12 mx-auto">
          <label for="introduce"><span>간단한 소개</span></label>
          <input type="text" class="form-control" id="introduce" name="introduce" required >
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="moadl3" class="btn btn-primary" data-bs-dismiss="modal">완료</button>
      </div>
    </div>
  </div>
</div>
