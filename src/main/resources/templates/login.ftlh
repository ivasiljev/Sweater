<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="row justify-content-center">
        <div class="col-sm-4">
            <div class="fs-4 mb-3 ms-1">Sign in</div>

            <#if Session?? & Session.SPRING_SECURITY_LAST_EXCEPTION??>
            <div class="alert alert-danger" role="alert">
                ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
            </div>
            </#if>

            <#if message??>
                <div class="alert ${(messageType??)?string(messageType, '')}" role="alert">
                    ${message}
                </div>
            </#if>
            <@l.login "/login" false/>
        </div>
    </div>
</@c.page>