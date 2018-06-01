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
                            <div class="header">Matt Giampietro</div>
                            <div class="meta">
                                <a>Friends</a>
                            </div>
                            <div class="description">
                                Matthew is an interior designer living in New York.
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
                <div class="ui fluid card">
                    <div class="content">
                        <i class="right floated like icon"></i>
                        <i class="right floated star icon"></i>
                        <div class="header">Cute Dog</div>
                        <div class="description">
                            <p></p>
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="left floated like">
                            <i class="like icon"></i>
                            Like
                        </span>
                        <span class="right floated star">
                            <i class="star icon"></i>
                            Favorite
                        </span>
                    </div>
                </div>
            </div>
            <div class="four wide column">
                <div class="ui segment">
                    <img>
                </div>
            </div>
        </div>

</body>

</html>