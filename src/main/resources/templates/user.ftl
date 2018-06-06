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

    <style type="text/css">
        body {
            background-color: #DADADA;
        }

        .main.container {
            margin-top: 3em;
            margin-bottom: 7em;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#follow_button').click(function () {
                if ($(this).hasClass('red')) {
                    html_dom = $(this);
                    $.ajax(
                    {
                        url: "/follow/remove",
                        data: { "followed_user": ${ curUser.getId() }},
                        type: "get",
                        dataType: "json",
                        success: function(data) {
                            html_dom.removeClass("red");
                        },
                        error: function() {
                            alert("error");
                        }
                    });
                }else {
                    html_dom = $(this);
                    $.ajax(
                    {
                        url: "/follow/add",
                        data: { "followed_user": ${ curUser.getId() }},
                        type: "get",
                        dataType: "json",
                        success: function (data) {
                            html_dom.addClass("red");
                        },
                        error: function () {
                            alert("error");
                        }
                    });
                }
            });

            $('.support_button').click(function(){
                title = $(this).prev().find('.header').html();
                content = $(this).prev().find('.description').html();
                $('#support_modal_name').html(title);
                $('#support_modal_content').html(content);
                $('#support_modal').modal('show');
            });

            $('.dropdown').dropdown();
        });
    </script>
</head>

<body>
    <#include "navi.ftl">

        <div class="ui main three column doubling stackable grid container">
            <div class="four wide column">
                <div class="ui link cards">
                    <div class="card">
                        <div class="image">
                            <img src="${curUser.getAvatar()}">
                        </div>
                        <div class="content">
                            <div class="header">${curUser.getName()}</div>
                            <div class="meta">
                                <a>${curUser.getEmail()}</a>
                            </div>
                            <div class="description">
                                ${curUser.getBio()}
                            </div>
                        </div>
                        <div class="extra content">
                            <span class="right floated">
                                Joined in 2018
                            </span>
                            <#if curUser.getId()!=user.getId()>
                                <#if isFollowed>
                                    <i class="right floated like red icon" id="follow_button"></i>
                                    <#else>
                                        <i class="right floated like icon" id="follow_button"></i>
                                </#if>
                            </#if>
                            <span>
                                <i class="user icon"></i>
                                ${followerNum} Followers
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="eight wide column">
                <#if curPost?size==0>
                    <div class="ui fluid card">
                        <div class="content">
                            <p>
                                No Post.
                            </p>
                        </div>
                    </div>
                </#if>
                <#list curPost as post>
                    <div class="ui fluid card">
                        <div class="content">
                            <i class="right floated like icon"></i>
                            <i class="right floated star icon"></i>
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
            <div class="four wide column">
                <div class="ui segments">
                    <div class="ui segment">
                        <p>Rewards</p>
                    </div>
                    <div class="ui secondary segment">
                        <#if curReward?size==0>
                            <div class="ui fluid card">
                                <div class="content">
                                    <p>
                                        No Rewards.
                                    </p>
                                </div>
                            </div>
                        </#if>
                        <#list curReward as reward>
                            <div class="ui card">
                                <div class="content">
                                    <div class="header">${reward.getRewardName()}</div>
                                    <div class="description">
                                        ${reward.getRewardContent()}
                                    </div>
                                </div>
                                <#if user.getId()!=curUser.getId()>
                                    <div class="ui bottom attached button support_button">
                                        <i class="add icon"></i>
                                        support
                                    </div>
                                </#if>
                            </div>
                            <p></p>
                            <div class="ui clearing divider"></div>
                        </#list>
                        <div class="ui modal" id="support_modal">
                            <i class="close icon"></i>
                            <div class="header">
                                support creator
                            </div>
                            <div class="content">
                                <div class="description">
                                    <div class="ui header" id="support_modal_name"></div>
                                    <p id="support_modal_content"></p>
                                    <div class="ui selection dropdown">
                                        <input type="hidden" name="time">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">time</div>
                                        <div class="menu">
                                            <div class="item" data-value="1">1 Monthes</div>
                                            <div class="item" data-value="3">3 Monthes</div>
                                            <div class="item" data-value="6">6 Monthes</div>
                                            <div class="item" data-value="12">1 Year</div>
                                            <div class="item" data-value="24">2 Year</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="actions">
                                <div class="ui red cancel inverted button">
                                    <i class="remove icon"></i>
                                    No
                                </div>
                                <div class="ui green ok inverted button">
                                    <i class="checkmark icon"></i>
                                    Yes
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui segments">
                    <div class="ui segment">
                        <p>SUPPORTED BY</p>
                    </div>
                    <div class="ui secondary segment">
                        <p>Secondary Content</p>
                    </div>
                </div>
            </div>
        </div>
        <#include "foot.ftl">
</body>

</html>