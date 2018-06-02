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

        body>.grid {
            height: 100%;
        }

        .main.container {
            margin-top: 7em;
        }
    </style>
</head>

<body>
    <#include "navi.ftl">

        <div class="ui main three column doubling stackable grid container">
            <div class="four wide column">
                <div class="ui link cards">
                    <div class="card">
                        <div class="image">
                            <img src="https://semantic-ui.com/images/avatar2/large/matthew.png">
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
                                Joined in 2013
                            </span>
                            <span>
                                <i class="user icon"></i>
                                75 Friends
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="eight wide column">
                <#if curPost?size == 0>
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
                        <div class="ui comments">
                            <div class="comment">
                                <a class="avatar">
                                    <img src="../images/avatar/small/matt.jpg">
                                </a>
                                <div class="content">
                                    <a class="author">Matt</a>
                                    <div class="metadata">
                                        <span class="date">Today at 5:42PM</span>
                                    </div>
                                    <div class="text">
                                        How artistic!
                                    </div>
                                </div>
                            </div>
                            <div class="comment">
                                <a class="avatar">
                                    <img src="../images/avatar/small/joe.jpg">
                                </a>
                                <div class="content">
                                    <a class="author">Joe Henderson</a>
                                    <div class="metadata">
                                        <span class="date">5 days ago</span>
                                    </div>
                                    <div class="text">
                                        Dude, this is awesome. Thanks so much
                                    </div>
                                </div>
                            </div>
                            <form class="ui reply form">
                                <div class="ui grid">
                                    <div class="twelve wide column">
                                        <div class="field">
                                            <div class="ui input">
                                                <input type="text" placeholder="comment...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="four wide column">
                                        <div class="ui blue labeled submit icon button">
                                            <i class="icon edit"></i>Reply
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
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
                        <p>Secondary Content</p>
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