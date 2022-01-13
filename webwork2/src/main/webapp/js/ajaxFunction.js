function ajaxMovie(){
    $.ajax({
        type: "post",
        url: "videoPartitionGet",
        data: {"pname":"影视"},
        datatype: "String",
        success: function() {
        },
        error: function() {
            alert("失败1");
        }
    });
}

function ajaxACG(){
    $.ajax({
        type: "post",
        url: "videoPartitionGet",
        data: {"pname":"ACG"},
        datatype: "String",
        success: function() {
        },
        error: function() {
            alert("失败2");
        }
    });
}

function ajaxStudy(){
    $.ajax({
        type: "post",
        url: "videoPartitionGet",
        data: {"pname":"学习"},
        datatype: "String",
        success: function() {
        },
        error: function() {
            alert("失败3");
        }
    });
}

function ajaxCom(){
    $.ajax({
        type: "post",
        url: "videoPartitionGet",
        data: {"pname":"综合"},
        datatype: "String",
        success: function() {
        },
        error: function() {
            alert("失败4");
        }
    });
}