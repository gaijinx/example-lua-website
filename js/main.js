$("#test").on("click", function(){
    $("#data").html(
        "JQuery works!"
    );
});

// https://api.jquery.com/jquery.getjson/
$("#jsonTest").on("click", function(){
    $.getJSON("/test/some_json", function(data){
        var items = [];
        $.each(data, function(key, val){
            items.push("<li class='list-group-item'>" + key + ": " + val + "</li>");
        });
       
        $("#data").html(
            $("<ul/>", {
                "class": "list-group",
                html: items.join("")
            })
        );
    });
});