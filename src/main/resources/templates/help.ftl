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
                <div class="ui styled fluid accordion">
                    <div class="title">
                        <i class="dropdown icon"></i>
                        什么是狗？
                    </div>
                    <div class="content">
                        <p class="transition hidden">狗算是一种家畜。以其忠诚与忠心广受人类欢迎, 可以在世界各地的许多家庭里发现这个受欢迎的客人。</p>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        狗有哪些种类？
                    </div>
                    <div class="content">
                        <p>狗有许多品种，每个品种都有不同的大小及性格，饲主通常选择适合自己生活方式的品种当作自已的伙伴，其中最受欢迎的品种绝对是吉娃娃。</p>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        如何获得一只狗?
                    </div>
                    <div class="content">
                        <p>通常有三种方式可以取得一只狗狗，宠物店、私人饲主或是动物之家。 (请以领养代替购买)</p>
                        <p>你可以在动物之家内领养一只健康的小狗，比起在宠物店买，收容所中的宠物比较不容易有近亲交配出现的缺陷问题，而且领养一只小狗的费用远比你在宠物店中购买便宜得多。</p>
                    </div>
                </div>
            </div>
        </div>

        <#include "foot.ftl">

</body>

</html>