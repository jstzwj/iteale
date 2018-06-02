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
            $('.ui.form')
                .form({
                    fields: {
                        name: 'empty',
                        gender: 'empty',
                        username: 'empty',
                        password: ['minLength[6]', 'empty'],
                        skills: ['minCount[2]', 'empty'],
                        terms: 'checked'
                    }
                })
                ;
        });
    </script>
</head>

<body>
    <#include "navi.ftl">
        <form class="ui form segment">
        <div class="ui top attached tabular menu">
            <a class="item active" data-tab="first">Profile</a>
            <a class="item" data-tab="second">Account</a>
            <a class="item" data-tab="third">Payment Methods</a>
        </div>
        <div class="ui bottom attached tab segment active" data-tab="first">
            <div class="two fields">
                <div class="field">
                    <label>Username</label>
                    <input placeholder="Username" name="username" type="text">
                </div>
                <div class="field">
                    <label>Email</label>
                    <input placeholder="e-mail" name="email" type="text">
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>Username</label>
                    <input placeholder="Username" name="username" type="text">
                </div>
                <div class="field">
                    <label>Password</label>
                    <input type="password" name="password">
                </div>
            </div>
            <div class="field">
                <label>Skills</label>
                <select name="skills" multiple="" class="ui dropdown">
                    <option value="">Select Skills</option>
                    <option value="css">CSS</option>
                    <option value="html">HTML</option>
                    <option value="javascript">Javascript</option>
                    <option value="design">Graphic Design</option>
                    <option value="plumbing">Plumbing</option>
                    <option value="mech">Mechanical Engineering</option>
                    <option value="repair">Kitchen Repair</option>
                </select>
            </div>
            <div class="ui primary submit button">Submit</div>
            <div class="ui error message"></div>
            
        </div>
        <div class="ui bottom attached tab segment" data-tab="second">
            <div class="field">
                <div class="field">
                    <label>Old Password</label>
                    <input type="password" name="oldPassword">
                </div>
                <div class="field">
                    <label>New Password</label>
                    <input type="password" name="newPassword">
                </div>
                <div class="field">
                    <label>conform Password</label>
                    <input type="password" name="conformPassword">
                </div>
            </div>
            <div class="ui primary submit button">Submit</div>
            <div class="ui error message"></div>
        </div>
        <div class="ui bottom attached tab segment" data-tab="third">
            第三
        </div>
    </form>
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