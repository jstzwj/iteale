<div class="ui fixed inverted menu">
    <div class="ui container">
        <a class="active item" href="/">Iteale</a>
        <div class="right menu">
            <div class="item">
                <div class="ui icon input">
                    <input type="text" placeholder="Search...">
                    <i class="search link icon"></i>
                </div>
            </div>
            <#if user??>
                <div class="ui simple dropdown item">
                    <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/matthew.png">
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="header">Sign in as ${user.getName()}</div>
                        <div class="divider"></div>
                        <a class="item" href="user">Profile</a>
                        <a class="item" href="#">Follower</a>
                        <div class="divider"></div>
                        <a class="item" href="#">Help</a>
                        <a class="item" href="#">Setting</a>
                        <a class="item" href="signout">Sign out</a>
                    </div>
                </div>
            <#else>
                <div class="item">
                    <a href="login">Log in</a>
                </div>
                <div class="item">
                    <a href="register">Sign Up</a>
                </div>
            </#if>
            
            
        </div>
    </div>
</div>