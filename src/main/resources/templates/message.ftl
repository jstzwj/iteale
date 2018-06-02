<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Message Example - Semantic</title>

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

            document.getElementById('submit').addEventListener('click', function () {
                $("#hidden_editor").val(editor.txt.html());
            }, false);

            $(document).ready(function () {
                $('.ui.form').form({
                    fields: {
                        title: 'empty',
                        editor: 'empty'
                    }
                });
            });
        });

    </script>
</head>

<body>
    <#include "navi.ftl">
        <div class="ui centered grid">
            <div class="six wide tablet eight wide column">
                <div class="ui segment">
                    <div class="ui feed">
                        <div class="event">
                            <div class="label">
                                <img src="../images/avatar/small/elliot.jpg">
                            </div>
                            <div class="content">
                                <div class="summary">
                                    <a class="user">
                                        Elliot Fu
                                    </a> added you as a friend
                                    <div class="date">
                                        1 Hour Ago
                                    </div>
                                </div>
                                <div class="meta">
                                    <a class="like">
                                        <i class="like icon"></i> 4 Likes
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="event">
                            <div class="label">
                                <img src="../images/avatar/small/helen.jpg">
                            </div>
                            <div class="content">
                                <div class="summary">
                                    <a>Helen Troy</a> added
                                    <a>2 new illustrations</a>
                                    <div class="date">
                                        4 days ago
                                    </div>
                                </div>
                                <div class="extra images">
                                    <a>
                                        <img src="../images/wireframe/image.png">
                                    </a>
                                    <a>
                                        <img src="../images/wireframe/image.png">
                                    </a>
                                </div>
                                <div class="meta">
                                    <a class="like">
                                        <i class="like icon"></i> 1 Like
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="event">
                            <div class="label">
                                <img src="../images/avatar/small/jenny.jpg">
                            </div>
                            <div class="content">
                                <div class="summary">
                                    <a class="user">
                                        Jenny Hess
                                    </a> added you as a friend
                                    <div class="date">
                                        2 Days Ago
                                    </div>
                                </div>
                                <div class="meta">
                                    <a class="like">
                                        <i class="like icon"></i> 8 Likes
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="event">
                            <div class="label">
                                <img src="../images/avatar/small/joe.jpg">
                            </div>
                            <div class="content">
                                <div class="summary">
                                    <a>Joe Henderson</a> posted on his page
                                    <div class="date">
                                        3 days ago
                                    </div>
                                </div>
                                <div class="extra text">
                                    Ours is a life of constant reruns. We're always circling back to where we'd we started, then starting all over again. Even
                                    if we don't run extra laps that day, we surely will come back for more of the same another
                                    day soon.
                                </div>
                                <div class="meta">
                                    <a class="like">
                                        <i class="like icon"></i> 5 Likes
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="event">
                            <div class="label">
                                <img src="../images/avatar/small/justen.jpg">
                            </div>
                            <div class="content">
                                <div class="summary">
                                    <a>Justen Kitsune</a> added
                                    <a>2 new photos</a> of you
                                    <div class="date">
                                        4 days ago
                                    </div>
                                </div>
                                <div class="extra images">
                                    <a>
                                        <img src="../images/wireframe/image.png">
                                    </a>
                                    <a>
                                        <img src="../images/wireframe/image.png">
                                    </a>
                                </div>
                                <div class="meta">
                                    <a class="like">
                                        <i class="like icon"></i> 41 Likes
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <#include "foot.ftl">

</body>

</html>