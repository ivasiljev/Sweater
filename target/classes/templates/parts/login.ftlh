<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="row mb-3 mx-1">
        <div class="form-floating col p-0">
            <input type="text" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}" 
                   id="floatingUsername" name="username" placeholder="User name"/>
            <label for="floatingUsername">User name</label>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="row mb-3 mx-1">
        <div class="form-floating col p-0">
            <input type="password" 
                   class="form-control ${(passwordError??)?string('is-invalid', '')}" 
                   id="floatingPassword" name="password" placeholder="Password"/>
            <label for="floatingPassword">Password</label>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="row mb-3 mx-1">
            <div class="form-floating col p-0">
                <input type="password"
                    class="form-control ${(password2Error??)?string('is-invalid', '')}" 
                    id="floatingPassword" name="password2" placeholder="Retype password"/>
                <label for="floatingPassword">Retype password</label>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
        <div class="row mb-3 mx-1">
            <div class="form-floating col p-0">
                <input type="email" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}" 
                       id="floatingEmail" name="email" placeholder="Email"/>
                <label for="floatingEmail">Email</label>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
    </#if>

    <div class="row mb-3 mx-1">
        <input type="hidden" name="_csrf" value=${_csrf.token} />
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
    <button type="submit" class="btn btn-primary">Sign In</button>
</form>
</#macro>

<#macro logoutBtn>
<form action="/logout" method="post">
	<input type="hidden" name="_csrf" value=${_csrf.token} />
    <button type="submit" class="btn btn-primary">Sign Out</button>
</form>
</#macro>