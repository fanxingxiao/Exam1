
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>正在跳转</title>
    <style tpe="text/css">
        .none {
            display: none;
        }
        
        .layout-root {
            position: fixed;
            height: 100%;
            width: 100%;
            z-index: 1000;
            top: 0;
            left: 0;
        }
        
        a,
        button {
            outline: none;
        }
        
        button {
            border: none;
            padding: 0.6em 1.2em;
            background: #95c7fa;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            display: block;
            margin: 3px auto;
            border-radius: 2px;
        }
        
        button:hover,
        button:active,
        button:focus {
            border: none;
        }
        /* ---------------------弹窗样式 -------------------*/
        
        .dialog-face {
            position: fixed;
            background: #9deefd;
            height: 100%;
            width: 100%;
            z-index: 1000;
            top: 0;
            left: 0;
            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
        }
        
        .dialog-face.slipBottom[opacity="0"] {
            display: none;
        }
        
        .dialog-face.slipUp {
            opacity: 0.7;
            -webkit-animation-name: dialogFaceSlipToUp;
            -moz-animation-name: dialogFaceSlipToUp;
            -o-animation-name: dialogFaceSlipToUp;
            animation-name: dialogFaceSlipToUp;
        }
        
        .dialog-face.slipBottom {
            opacity: 0;
            visibility: hidden;
            -webkit-animation-name: dialogFaceSlipToBottom;
            -moz-animation-name: dialogFaceSlipToBottom;
            -o-animation-name: dialogFaceSlipToBottom;
            animation-name: dialogFaceSlipToBottom;
        }
        
        .dialog-root {
            position: fixed;
            z-index: 2000;
            left: 50%;
            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-perspective: 1300px;
            -moz-perspective: 1300px;
            perspective: 1300px;
        }
        
        .dialog-root.slipUp {
            top: 50%;
            opacity: 1;
            -webkit-animation-name: dialogSlipToUp;
            -moz-animation-name: dialogSlipToUp;
            -o-animation-name: dialogSlipToUp;
            animation-name: dialogSlipToUp;
            -webkit-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        
        .dialog-root.slipBottom {
            top: 100%;
            opacity: 0.3;
            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-animation-name: dialogSlipToBottom;
            -moz-animation-name: dialogSlipToBottom;
            -o-animation-name: dialogSlipToBottom;
            animation-name: dialogSlipToBottom;
            -webkit-transform: translate(-50%, 0);
            -o-transform: translate(-50%, 0);
            -moz-transform: translate(-50%, 0);
            -ms-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
        }
        
        .dialog-wrapper {
            background: #95c7fa;
            width: 200px;
            height: 130px;
            overflow: hidden;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-transform-origin: 50% 100%;
            -moz-transform-origin: 50% 100%;
            -ms-transform-origin: 50% 100%;
            -o-transform-origin: 50% 100%;
            transform-origin: 50% 100%;
        }
        
        .dialog-wrapper.slipUp {
            -webkit-transform: rotateX(0deg);
            -moz-transform: rotateX(0deg);
            -ms-transform: rotateX(0deg);
            -o-transform: rotateX(0deg);
            transform: rotateX(0deg);
            -webkit-animation-name: contentSlipToUp;
            -moz-animation-name: contentSlipToUp;
            -o-animation-name: contentSlipToUp;
            animation-name: contentSlipToUp;
        }
        
        .dialog-wrapper.slipBottom {
            -webkit-transform: rotateX(90deg);
            -moz-transform: rotateX(90deg);
            -ms-transform: rotateX(90deg);
            -o-transform: rotateX(90deg);
            transform: rotateX(90deg);
            -webkit-animation-name: contentSlipToBottom;
            -moz-animation-name: contentSlipToBottom;
            -o-animation-name: contentSlipToBottom;
            animation-name: contentSlipToBottom;
        }
        
        span {
            font-size: 18px;
            line-height: 30px;
            color: #8655f4;
        }
        
        .dialog-content {
            font-weight: 300;
            font-size: 1.15em;
            color: #fff;
            padding: 15px 40px 20px 40px;
            margin: 0;
        }
        
        .dialog-content p {
            margin: 0;
            padding: 10px 0;
        }
        
        .dialog-footer {}
        /* ---------------------动画关键帧 -------------------*/
        
        @keyframes dialogFaceSlipToUp {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 0.7;
            }
        }
        
        @keyframes dialogFaceSlipToBottom {
            0% {
                opacity: 0.7;
                visibility: visible;
            }
            100% {
                visibility: hidden;
                opacity: 0;
            }
        }
        
        @keyframes dialogSlipToUp {
            0% {
                top: 100%;
                opacity: 0.3;
            }
            100% {
                top: 50%;
                opacity: 1;
            }
        }
        
        @keyframes dialogSlipToBottom {
            0% {
                top: 50%;
                opacity: 1;
                -webkit-transform: translate(-50%, -50%);
                -moz-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                -o-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
            }
            100% {
                top: 100%;
                opacity: 0.3;
                -webkit-transform: translate(-50%, 0);
                -moz-transform: translate(-50%, 0);
                -ms-transform: translate(-50%, 0);
                -o-transform: translate(-50%, 0);
                transform: translate(-50%, 0);
            }
        }
        
        @keyframes contentSlipToUp {
            0% {
                -webkit-transform: rotateX(90deg);
                -moz-transform: rotateX(90deg);
                -ms-transform: rotateX(90deg);
                -o-transform: rotateX(90deg);
                transform: rotateX(90deg);
            }
            100% {
                -webkit-transform: rotateX(0deg);
                -moz-transform: rotateX(0deg);
                -ms-transform: rotateX(0deg);
                -o-transform: rotateX(0deg);
                transform: rotateX(0deg);
            }
        }
        
        @keyframes contentSlipToBottom {
            0% {
                -webkit-transform: rotateX(0deg);
                -moz-transform: rotateX(0deg);
                -ms-transform: rotateX(0deg);
                -o-transform: rotateX(0deg);
                transform: rotateX(0deg);
            }
            60% {
                -webkit-transform: rotateX(60deg);
                -moz-transform: rotateX(60deg);
                -ms-transform: rotateX(60deg);
                -o-transform: rotateX(60deg);
                transform: rotateX(60deg);
            }
            100% {
                -webkit-transform: rotateX(90deg);
                -moz-transform: rotateX(90deg);
                -ms-transform: rotateX(90deg);
                -o-transform: rotateX(90deg);
                transform: rotateX(90deg);
            }
        }

    </style>
</head>

<body onload="toggleDialog(true)">
    <div id="dialog-face" class="none">
    </div>
    <div id="dialog" class="none">
        <div id="dialog-wrapper">
            <div class="dialog-header">
                <br><br><center><span>下载成功,默认路径:(E:\test\hdfsTest)</span></center>
            </div>
            <center><a href="index.jsp"><button onclick="toggleDialog(false)">关闭</button></a></center>
            <!-- <script type="text/javascript">
				window.location="index.jsp";
			</script> -->
        </div>
    </div>
    <script type="text/javascript">
        function toggleDialog(show) {
            var animationClass = show ? "slipUp" : "slipBottom";
            var animation = function() {
                var ele = document.getElementById("dialog-face");
                ele.className = "dialog-face " + animationClass;
                ele = document.getElementById("dialog");
                ele.className = "dialog-root " + animationClass;
                ele = document.getElementById("dialog-wrapper");
                ele.className = "dialog-wrapper " + animationClass;
            };

            setTimeout(animation, 100);
        }

    </script>
</body>

</html>
