$(document).ready(function() {

    $('#member_entry_btn').on('click', function() {
    	debugger
    	alert("asa");
        $('#member_modal').modal('show')
    });

    $('#member_submit').on('click', function() {
         if ($('#memberid').val() == "") {
            alert("Please enter customer id to proceed.");
            return;
        }

        $("#memberForm").submit();
        alert("inside memner");


        // var user_id = $('#memberid').val();

        // $.ajax({
        //     type: 'get',
        //     url: '/users/' + user_id,
        //     data: { tabClick: true },
        //     async: false,
        //     success: function(data) {
        //         window.location.href = 'deals/todays_deal'
        //         debugger
        //     },
        //     error: function(data) {
        //         // alert("error")
        //     }
        // }).always(function() {
        //     $('#member_modal').modal('hide')
        // });;
    })

});