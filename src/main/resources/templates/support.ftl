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
                <div class="ui cards">
                    <#if rewardList?size==0>
                        No reward
                    </#if>
                    <#list rewardList as reward>
                    <div class="card">
                        <div class="content">
                            <div class="header">
                                ${reward.getRewardName()}
                            </div>
                            <div class="meta">
                                ${reward.getRewardPrice()}$
                            </div>
                            <div class="description">
                                ${reward.getRewardContent()}
                            </div>
                        </div>
                        <div class="extra content">
                            <div class="ui two buttons">
                                <div class="ui basic green button">Approve</div>
                                <div class="ui basic red button">Decline</div>
                            </div>
                        </div>
                    </div>
                    </#list>
                </div>
            </div>
        </div>

        <#include "foot.ftl">

</body>

</html>