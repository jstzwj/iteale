<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Help Example - Semantic</title>

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

            $('.ui.accordion').accordion();
        });

    </script>
</head>

<body>
    <#include "navi.ftl">
        <div class="ui centered grid">
            <div class="six wide tablet eight wide column">
                <div class="ui styled fluid accordion">
                    <div class="title">
                        <i class="dropdown icon"></i>
                        What is Iteale？
                    </div>
                    <div class="content">
                        <p class="transition hidden">Iteale is a platform where you can share anything for free or paid.</p>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        How to see the posts of creators?
                    </div>
                    <div class="content">
                        <p>If the post is free, you can browser it anytime. Otherwise, you should pay enough reward for these posts every month.</p>
                    </div>
                </div>
            </div>
        </div>

        <#include "foot.ftl">

</body>

</html>