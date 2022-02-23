<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="row justify-content-center">
        <div class="col-sm-4">
            <div class="fs-4 mb-3 ms-1">Sign in</div>
            <@l.login "/login" false/>
        </div>
    </div>
</@c.page>