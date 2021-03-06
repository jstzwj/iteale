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
        });
    </script>
</head>

<body>
    <#include "navi.ftl">
        <div class="ui centered grid">
            <div class="six wide tablet eight wide column">
                <div class="ui segments">
                    <div class="ui segment">
                        <div class="ui celled list">
                        <#if followerList?size==0>
                            No follower.
                        </#if>
                        <#list followerList as follower>
                            <div class="item">
                                <div class="content">
                                    <div class="header">
                                    <a href="/user?id=${user.getId()}">
                                        <img class="ui avatar image" src="${follower.getAvatar()}">
                                        ${follower.getName()}
                                    </a>
                                    </div>
                                    ${follower.getEmail()}
                                </div>
                            </div>
                        </#list>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <#include "foot.ftl">

</body>

</html>