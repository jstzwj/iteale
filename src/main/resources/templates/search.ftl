<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Post Example - Semantic</title>

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
        });
    </script>
</head>

<body>
    <#include "navi.ftl">
    <div class="ui centered grid">
        <div class="six wide tablet eight wide column">
            <div class="ui top attached tabular menu">
                <a class="active item" data-tab="first">Posts</a>
                <a class="item" data-tab="second">Users</a>
            </div>
            <div class="ui bottom attached active tab segment" data-tab="first">
                <#if post_search_result?size == 0>
                <div class="ui fluid card">
                    <div class="content">
                        <p>
                            No matched post.
                        </p>
                    </div>
                </div>
                </#if>
                <#list post_search_result as post>
                <div class="ui fluid card">
                    <div class="content">
                        <div class="header">${post.getTitle()}</div>
                        <div class="description">
                            <p></p>
                        </div>
                        <div class="ui clearing divider"></div>
                        <div>
                            ${post.getContent()}
                        </div>
                    </div>
                    <div class="extra content">
                        
                    </div>
                </div>
                </#list>
            </div>
            <div class="ui bottom attached tab segment" data-tab="second">
                <#if user_search_result?size == 0>
                <div class="ui fluid card">
                    <div class="content">
                        <p>
                            No matched user.
                        </p>
                    </div>
                </div>
                </#if>
                <#list user_search_result as user>
                <div class="ui fluid card">
                    <div class="content">
                        <div class="header">
                            <img class="ui avatar image" src="${user.getAvatar()}">
                            <span>${user.getName()}</span>
                        </div>
                        <div class="description">
                            <p>${user.getEmail()}</p>
                        </div>
                    </div>
                    <div class="extra content">
                        
                    </div>
                </div>
                </#list>
            </div>
        </div>
    </div>

    <#include "foot.ftl">

</body>
</html>