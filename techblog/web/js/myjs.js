


function doLike(uid, pid)
{
    console.log("pid: +" + uid, "uid: +" + pid);

    const d = {
        uid: uid,
        pid: pid,
        operation: "like"
    };

    $.ajax({

        url: "likeServlet",
        data: d,
        success: function (data, textStatus, jqXHR)
        {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {

            console.log("error");
        }
    });
}
