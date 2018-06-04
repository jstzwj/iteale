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
            $('.reward_delete_submit').click(function(){
                html_component = $(this);
                id = $(this).prev().text();
                $.ajax(
                {
                    url:"/setting/reward/delete",
                    data:{"id": id},
                    type:"get",
                    dataType:"json",
                    success:function(data)
                    {
                        html_component.parent().fadeOut("slow",function(){
                            html_component.parent().remove();
                        });
                    },
                    error: function() {
                        alert("error");
                    }
                });
            });
            $('.reward_add_submit').click(function(){
                html_component = $(this);
                title = html_component.prev().find("#reward_title").val();
                content = reward_editor.txt.html();
                price = html_component.prev().find("#reward_money").val();
                $.ajax(
                {
                    url:"/setting/reward/add",
                    data:{"reward_title": title,
                     "reward_content": content,
                     "reward_price":price},
                    type:"get",
                    dataType:"json",
                    success:function(data)
                    {
                        template = $("#reward_template").clone(true);
                        template.find(".header").html(data.reward_title);
                        template.find(".description").html(data.reward_content);
                        template.find(".reward_id").html(data.reward_id);
                        html_component.parent().before(template);

                        template.fadeIn("slow");
                    },
                    error: function() {
                        alert("error");
                    }
                });
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
                    <a class="item" data-tab="fifth">Thanks Words</a>
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
                    <div class="ui cards">
                        <div class="ui fluid card" id="reward_template" style="display: none">
                            <div class="content">
                                <div class="header">default title</div>
                                <div class="description">
                                    default content
                                </div>
                            </div>
                            <p hidden class="reward_id">default id</p>
                            <div class="ui bottom attached button reward_delete_submit">
                                <i class="minus icon"></i>
                                delete
                            </div>
                        </div>
                        <#list rewardList as reward>
                        <div class="ui fluid card">
                            <div class="content">
                                <div class="header">${reward.getRewardName()}</div>
                                <div class="description">
                                    ${reward.getRewardContent()}
                                </div>
                            </div>
                            <p hidden>${reward.getId()}</p>
                            <div class="ui bottom attached button reward_delete_submit">
                                <i class="minus icon"></i>
                                delete
                            </div>
                        </div>
                        </#list>
                        <div class="ui fluid card">
                            <div class="content">
                                <div class="header">New reward solution</div>
                                <div class="description">
                                    <div class="ui form" id="rewards_form">
                                        <div class="two fields">
                                            <div class="field">
                                                <label>Title</label>
                                                <input placeholder="Your title" name="title" id="reward_title" type="text">
                                            </div>
                                            <div class="field">
                                                <label>Money</label>
                                                <div class="ui right labeled input">
                                                    <div class="ui label">$</div>
                                                    <input type="text" placeholder="money" name="money" id="reward_money">
                                                    <div class="ui basic label">.00</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div id="reward_editor">
                                            </div>
                                        </div>
                                        <div class="ui error message"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui bottom attached button reward_add_submit">
                                <i class="add icon"></i>
                                Add
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui bottom attached tab segment" data-tab="fifth">
                    <form class="ui form segment" method="post">
                        <p>What supporters will see after payment?</p>
                        <div class="field">
                            <div id="thanks_editor">
                            </div>
                            <input type="text" id="hidden_editor" name="editor" style="display:none" />
                        </div>
                        <div class="ui primary submit button" id="submit">Submit</div>
                        <div class="ui error message"></div>
                    </form>
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
    var thanks_editor = new E('#thanks_editor')

    thanks_editor.customConfig.lang = {
        '字号': 'font size',
        '文字颜色': 'font color',
        '链接文字': 'link text',
        '链接': 'link',
        '上传图片': 'upload image',
        '上传': 'upload',
        '创建': 'init',
        '默认': 'default',
        '设置列表': 'list',
        '有序列表': 'ordered list',
        '无序列表': 'unordered list',
        '网络图片': 'web image',
        '图片link': 'image link'
    }

    thanks_editor.customConfig.menus = [
        'bold',
        'fontSize',
        'italic',
        'underline',
        'foreColor',
        'link',
        'list',
        'justify',
        'quote',
        'emoticon',
        'image'
    ]
    thanks_editor.create()

    var reward_editor = new E('#reward_editor')

    reward_editor.customConfig.lang = {
        '字号': 'font size',
        '文字颜色': 'font color',
        '链接文字': 'link text',
        '链接': 'link',
        '上传图片': 'upload image',
        '上传': 'upload',
        '创建': 'init',
        '默认': 'default',
        '设置列表': 'list',
        '有序列表': 'ordered list',
        '无序列表': 'unordered list',
        '网络图片': 'web image',
        '图片link': 'image link'
    }

    reward_editor.customConfig.menus = [
        'bold',
        'fontSize',
        'italic',
        'underline',
        'foreColor',
        'link',
        'list',
        'justify',
        'quote',
        'emoticon',
        'image'
    ]
    reward_editor.create()
</script>

</html>