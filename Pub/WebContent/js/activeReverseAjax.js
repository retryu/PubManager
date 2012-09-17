function putInfo(data) {
    var MyName = document.getElementById("userName").value;
    if (data == null) {

        return;
    }
    var str = data.split(",");
    var time = str[0];
    var name = str[1];
    var message = str[2];
    if (MyName == name) {
        var d = decodeURI(data);
        var text = dwr.util.getValue("info");
        dwr.util.setValue('info', text + '/n' + d);
        InitMsgBox(time, name, message);
    }

}
//消息框初始化
function InitMsgBox(fileName, mun) {
    var messageBox = document.getElementById("myMessageBox");
    messageBox.style.width = 180;
    messageBox.style.height = 110;
    messageBox.style.border = "solid black 1px";
    messageBox.style.position = "absolute";
    messageBox.style.right = 0;
    messageBox.style.bottom = 0;
    messageBox.style.display = "none";

    var titleContent = "";// 消息框内容
    var CSStext = "margin:1px;color:black; border:2px outset;background-color:buttonface;width:16px;height:14px;font-size:12px;line-height:11px;cursor:hand;";

    titleContent = titleContent
            + "<table width=100% height=100% cellpadding=0 cellspacing=0 border=0 >";
    titleContent = titleContent
            + "<tr style=';font-size:12px;background:#0099CC;height:20px;cursor:default'>";
    titleContent = titleContent
            + "<td style='color:white;padding-left:5px'>消息提示</td>";
    titleContent = titleContent
            + "<td style='color:#ffffff;padding-right:5px;' align=right>";
   
    titleContent = titleContent + "</td></tr><tr><td colspan=2>";
    titleContent = titleContent
            + "<div id=include style='overflow:scroll;overflow-x:hidden;overflow-y:auto;HEIGHT:100%;padding-left:5px;padding-top:3px;font-size:12px;'>";
    titleContent = titleContent + "文件"+fileName ;
    titleContent = titleContent + "，有垃圾数据" + mun + "条";
    titleContent = titleContent + "请查看！<br>";
    titleContent = titleContent + "<br><br><br><br>";
    titleContent = titleContent + "</div>";
    titleContent = titleContent + "</td></tr></table>";
    messageBox.innerHTML = titleContent;
    // 消息框弹出方法
    $("#myMessageBox").slideDown(1000);
}

// 消息框关闭方法
function pophide() {
    $('#myMessageBox').slideUp(1000);
}
// 读取消息时提示信息内容更改
function readMessage() {
    document.getElementById("newMessage1").style.display = "none";
    document.getElementById("newMessage").style.display = "block";
}
// 页面body onload方法
function tempOnLoad() {
    dwr.engine.setActiveReverseAjax(true);
    readMessage();
    SendMessage.receiveMessage();
}