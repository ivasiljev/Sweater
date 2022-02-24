<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="row mb-3 mx-1">
        <div class="form-floating col p-0">
            <input type="text" class="form-control" id="floatingUsername" name="username" placeholder="User name"/>
            <label for="floatingUsername">User name</label>
        </div>
    </div>
    <div class="row mb-3 mx-1">
        <div class="form-floating col p-0">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password"/>
            <label for="floatingPassword">Password</label>
        </div>
    </div>
    <#if isRegisterForm>
    <div class="row mb-3 mx-1">
        <div class="form-floating col p-0">
            <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="Email"/>
            <label for="floatingEmail">Email</label>
        </div>
    </div>
    </#if>

    <input type="hidden" name="_csrf" value=${_csrf.token} />
    <div class="row mb-3 mx-1">
        <button type="submit" class="btn btn-primary col-auto"><#if isRegisterForm>Create<#else>Sign in</#if></button>
        <div class="ms-1 col-auto my-auto">
            <#if !isRegisterForm>
                <a href="/registration">Create account</a>
            <#else>
                <a href="/login">Sign in</a>
            </#if>
        </div>
    </div>
</form>
</#macro>

<#macro loginBtn>
<form action="/login" method="post">
	<input type="hidden" name="_csrf" value=${_csrf.token} />
    <button type="submit" class="btn btn-primary">Sign In</button>
</form>
</#macro>

<#macro logoutBtn>
<form action="/logout" method="post">
	<input type="hidden" name="_csrf" value=${_csrf.token} />
    <button type="submit" class="btn btn-primary">Sign Out</button>
</form>
</#macro>