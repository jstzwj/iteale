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
            
            document.getElementById('submit').addEventListener('click', function () {
                $("#hidden_editor").val(editor.txt.html());
            }, false);

            $(document).ready(function () {
                $('.ui.form').form({
                    fields: {
                    title     : 'empty',
                    editor   : 'empty'
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
            <div class="ui horizontal divider">New Post</div>
            <form class="ui form segment" method="post">
                <div class="two fields">
                    <div class="field">
                        <label>Title</label>
                        <input placeholder="Your title" name="title" type="text">
                    </div>
                    <div class="field">
                        <label>price</label>
                        <select class="ui dropdown" name="price">
                            <option value="free">free</option>
                            <option value="paid">paid</option>
                            <#list rewardList as reward>
                                <option value="${reward.getId()}">${reward.getRewardName()+":"+reward.getRewardPrice()}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="field">
                    <div id="editor">
                    </div>
                    <input type="text" id="hidden_editor" name="editor" style="display:none"/>
                </div>
                <div class="ui primary submit button" id="submit">Submit</div>
                <div class="ui error message"></div>
            </form>
        </div>
    </div>

    <#include "foot.ftl">

</body>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')

    editor.customConfig.menus = [
        'bold',
        'fontSize',
        'fontName',
        'italic',
        'underline',
        'strikeThrough',
        'foreColor',
        'backColor',
        'link',
        'list',
        'justify',
        'quote',
        'emoticon',
        'image',
        'table',
        'video',
        'code'
    ]
    editor.create()
</script>

</html>