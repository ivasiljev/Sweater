<#import "parts/common.ftlh" as c>

<@c.page>
<form class="row mb-3" method="get" action="/main">
    <div class="col-md-4"><input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search by tag"></div>
    <button type="submit" class="col-md-1 btn btn-primary">Search</button>
</form>

<div class="mb-2">
    <button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        New message
    </button>
    <div class="row collapse mt-2 mx-0" id="collapseExample">
        <form class="col-md-5 px-0" method="post" enctype="multipart/form-data">
            <input type="text" name="text" class="row mx-0 mb-2 form-control" placeholder="Enter message">
            <input type="text" name="tag" class="row mx-0 mb-2 form-control" placeholder="Tag">
            <input type="file" name="file" class="row mx-0 mb-2 form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
            <input type="hidden" name="_csrf" value=${_csrf.token} />
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>

<#list messages as message>
<div class="card my-2" style="width: 18rem;">
    <#if message.filename??>
    <img class="card-img-top" src="/img/${message.filename}">
    </#if>
    <div class="card-body">
        <p class="card-text">${message.text}</span>
        <i>${message.tag}</i>
    </div>
    <div class="card-footer text-muted">${message.authorName}</div>
</div>
<#else>
    No messages
</#list>
</@c.page>