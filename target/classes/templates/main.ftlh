<#import "parts/common.ftlh" as c>

<@c.page>
<form class="row mb-3" method="get" action="/main">
    <div class="col-md-4">
        <input type="text" 
               class="form-control" 
               name="filter" value="${filter?ifExists}" placeholder="Search by tag">
    </div>
    <button type="submit" class="col-md-1 btn btn-primary">Search</button>
</form>

<div class="mb-2">
    <button type="button" 
            class="btn btn-primary" 
            data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        New message
    </button>
    <div class="row collapse <#if message??>show</#if> mt-2 mx-0" id="collapseExample">
        <form class="col-md-5 px-0" method="post" enctype="multipart/form-data">
            <input type="text" name="text" 
                   class="row mx-0 mb-2 form-control ${(textError??)?string('is-invalid', '')} text-break" 
                   placeholder="Enter message" value="<#if message??>${message.text}</#if>">
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
            <input type="text" name="tag" 
                   class="row mx-0 mb-2 form-control ${(tagError??)?string('is-invalid', '')}" 
                   placeholder="Tag" value="<#if message??>${message.tag}</#if>">
            <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
            <input type="file" name="file" 
                   class="row mx-0 mb-2 form-control" 
                   id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
            <input type="hidden" name="_csrf" value=${_csrf.token} />
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>

<#list messages as mes>
<div class="card my-2" style="width: 18rem;">
    <#if mes.filename??>
        <img class="card-img-top" src="/img/${mes.filename}">
    </#if>
    <div class="card-body">
        <p class="card-text">${mes.text}</span>
        <i>${mes.tag}</i>
    </div>
    <div class="card-footer text-muted">${mes.authorName}</div>
</div>
<#else>
    No messages
</#list>
</@c.page>