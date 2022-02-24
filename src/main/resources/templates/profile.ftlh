<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="row justify-content-center">
        <div class="col-sm-4">
            <div class="fs-4 mb-3 ms-1">${username}</div>
            <div class="fs-6 mb-2 ms-1 text-danger">${message?ifExists}</div>
            <form method="post">
                <div class="row mb-3 mx-1">
                    <div class="form-floating col p-0">
                        <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password"/>
                        <label for="floatingPassword">Password</label>
                    </div>
                </div>
                <div class="row mb-3 mx-1">
                    <div class="form-floating col p-0">
                        <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="Email" value="${email!''}"/>
                        <label for="floatingEmail">Email</label>
                    </div>
                </div>
            
                <input type="hidden" name="_csrf" value=${_csrf.token} />
                <div class="row mb-3 mx-1">
                    <button type="submit" class="btn btn-primary col-auto">Save</button>
                </div>
            </form>
        </div>
    </div>
</@c.page>