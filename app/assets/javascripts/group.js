$(function(){

  function buildInvitationUserHTML(user_name,user_id){
    var html = `
      <div class="group__new--group-user">
        <div class="group__new--group-user-name">
         ${user_name}
        </div>
        <div class="group__new--group-user-input">
        <input multiple="multiple" value="${user_id}" type="hidden" name="group[user_groups_attributes][][user_id]" id="group_user_ids">
        </div>
        <div class="group__new--group-user-button-return" user_id="${user_id}" user_name="${user_name}">
          戻す
        </div>
      </div>
    `
    return html;
  }

  function buildInvitationUserReturnHTML(user_name,user_id){
    var html = `
    <div class="group__new--invitation-user">
      <div class="group__new--invitation-user-name">
        ${user_name}
      </div>
      <div class="group__new--invitation-user-input">
      </div>
      <div class="group__new--invitation-user-button" user_id="${user_id}" user_name="${user_name}">
        追加
      </div>
    </div>
    `
    return html;
  }

  function buildMemberUserHTML(user_name,user_id,user_group_id){
    var html = `
    <div class="group__new--delete-user">
      <div class="group__new--delete-user-name">${user_name}</div>
      <div class="group__new--delete-user-input">
        <input multiple="multiple" value="${user_group_id}" type="hidden" name="group[user_groups_attributes][][_destroy]" id="group_user_ids">
        <input multiple="multiple" value="${user_group_id}" type="hidden" name="group[user_groups_attributes][][id]" id="group_user_ids">
      </div>
      <div class="group__new--delete-user-button" user_id="${user_id}" user_name="${user_name}">
        戻す
      </div>
    </div>
    `
    return html;
  }

  function buildMemberUserReturnHTML(user_name,user_id,user_group_id){
    var html = `
      <div class="group__new--group-user">
        <div class="group__new--group-user-name">
         ${user_name}
        </div>
        <div class="group__new--group-user-input">
        </div>
        <div class="group__new--group-user-button" user_id="${user_id}" user_name="${user_name}" user_group_id="${user_group_id}">
          戻す
        </div>
      </div>
    `
    return html;
  }

  $(document).on("click",".group__new--invitation-user-button",function(){
    var user_id = $(this).attr("user_id");
    var user_name = $(this).attr("user_name");
    $(this).parent().remove();
    var html = buildInvitationUserHTML(user_name,user_id)
    $(".group__new--group-users").append(html);
  });

  $(document).on("click",".group__new--group-user-button-return",function(){
    var user_id = $(this).attr("user_id");
    var user_name = $(this).attr("user_name");
    $(this).parent().remove();
    var html = buildInvitationUserReturnHTML(user_name,user_id);
    $(".group__new--invitation-users").append(html);
  });

  $(document).on("click",".group__new--group-user-button",function(){
    var user_id = $(this).attr("user_id");
    var user_name = $(this).attr("user_name");
    var user_group_id = $(this).attr("user_group_id");
    $(this).parent().remove();
    var html = buildMemberUserHTML(user_name,user_id,user_group_id);
    $(".group__new--delete-users").append(html);
  });

  $(document).on("click",".group__new--delete-user-button",function(){
    var user_id = $(this).attr("user_id");
    var user_name = $(this).attr("user_name");
    var user_group_id = $(this).attr("user_group_id");
    $(this).parent().remove();
    var html = buildMemberUserReturnHTML(user_name,user_id,user_group_id)
    $(".group__new--group-users").append(html);
  });

  $(window).ready(function(){
    var member_ids = []
    $(".group__new--group-user-button").each(function(){
      var user_id = ($(this).attr("user_id"));
      return member_ids.push(user_id);
    });
    member_ids.forEach(function(value){
      $(".group__new--invitation-user-button").each(function(){
        var user_id = ($(this).attr("user_id"));
        if (user_id == value){
          $(this).parent().remove();
        };
      });
    });
  });

});
