<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Login Example - Semantic</title>

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/semantic-ui/2.3.1/semantic.min.css">
    <script src="https://cdn.bootcss.com/semantic-ui/2.3.1/semantic.min.js"></script>

    <script src="https://unpkg.com/wangeditor/release/wangEditor.min.js"></script>

    <style type="text/css">
        body {
            background-color: #DADADA;
        }

        body>.grid {
            height: 100%;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".close").click(function () {
                $(this).parent().hide();
            });

            $('.menu .item').tab();
            $('.ui.form').form({
                fields: {
                    username: {
                        identifier: 'username',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter your user name'
                            }
                        ]
                    },
                    email: {
                        identifier: 'email',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter your e-mail'
                            },
                            {
                                type: 'email',
                                prompt: 'Please enter a valid e-mail'
                            }
                        ]
                    },
                    oldPassword: {
                        identifier: 'oldPassword',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter your old password'
                            }
                        ]
                    },
                    newPassword: {
                        identifier: 'newPassword',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter your new password'
                            },
                            {
                                type: 'length[6]',
                                prompt: 'Your password must be at least 6 characters'
                            }
                        ]
                    }
                }
            });
        });
    </script>
</head>

<body>
    <#include "navi.ftl">
        <div class="ui centered grid">
            <div class="twelve wide tablet eight wide column">
                <div class="ui top attached tabular menu">
                    <a class="item active" data-tab="first">Profile</a>
                    <a class="item" data-tab="second">Account</a>
                    <a class="item" data-tab="third">Payment Methods</a>
                    <a class="item" data-tab="fourth">Rewards</a>
                </div>
                <div class="ui bottom attached tab segment active" data-tab="first">
                    <form class="ui form segment" method="post" action="/setting?action=profile">
                        <div class="inline field">
                            <label>User name</label>
                            <input placeholder="Username" name="username" type="text">
                        </div>
                        <div class="inline field">
                            <label>E-mail</label>
                            <input placeholder="e-mail" name="email" type="text">
                        </div>
                        <div class="ui primary submit button">Submit</div>
                        <div class="ui error message"></div>
                    </form>
                </div>
                <div class="ui bottom attached tab segment" data-tab="second">
                    <form class="ui form segment" method="post" action="/setting?action=account">
                        <div class="field">
                            <div class="field">
                                <label>Old Password</label>
                                <input type="password" name="oldPassword" placeholder="old password">
                            </div>
                            <div class="field">
                                <label>New Password</label>
                                <input type="password" name="newPassword" placeholder="new password">
                            </div>
                            <div class="field">
                                <label>conform Password</label>
                                <input type="password" name="confirmPassword" placeholder="confirm password">
                            </div>
                        </div>
                        <div class="ui primary submit button">Submit</div>
                        <div class="ui error message"></div>
                    </form>
                </div>
                <div class="ui bottom attached tab segment" data-tab="third">
                    第三
                </div>
                <div class="ui bottom attached tab segment" data-tab="fourth">
                    第三
                </div>
                <#if failure?? && failure!="">
                    <div class="ui error message">
                        <i class="close icon"></i>
                        <div class="header">
                            ${failure}
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    <#include "foot.ftl">

</body>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')

    editor.customConfig.menus = [
        'bold',
        'fontSize',
        'fontName',
        'italic',
        'underline',
        'strikeThrough',
        'foreColor',
        'backColor',
        'link',
        'list',
        'justify',
        'quote',
        'emoticon',
        'image',
        'table',
        'video',
        'code'
    ]
    editor.create()
</script>

</html>