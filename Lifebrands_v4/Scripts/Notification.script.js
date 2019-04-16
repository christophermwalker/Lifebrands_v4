$(function () {
    var grid = $("#NotificationjqGrid");

    $("#NotificationjqGrid").jqGrid({

        url: "/Notification/GetNotifications",
        datatype: 'json',
        mtype: 'Get',

        colNames: ['idNotification', 'Date', 'Subject', 'Comments'],
        colModel: [
            { key: true, name: 'IdNotifications', index: 'IdNotifications', editable: true, hidden: true },
            { key: false, name: 'Note_Date', index: 'Note_Date', editable: true },
            { key: false, name: 'Subject', index: 'Subject', editable: true },
            { key: false, name: 'Comments', index: 'Comments', editable: true }],
        pager: jQuery('#NotificationjqControls'),
        rowNum: 10,
        rowList: [10, 20, 30, 40, 50],
        height: '100%',
        viewrecords: true,
        caption: 'Products',
        emptyrecords: 'No Notifications are Available to Display',
        jsonReader: {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: false,
            Id: "0"
        },
        autowidth: true,
        multiselect: false
    }).navGrid('#NotificationjqControls', { edit: true, add: true, del: true, search: false, refresh: true },
        {
            zIndex: 100,
            url: '/Notification/EditNotification',
            closeOnEscape: true,
            closeAfterEdit: true,
            recreateForm: true,
            afterComplete: function (response) {
                if (response.responseText) {
                    alert(response.responseText);
                }
            }
        },
        {
            zIndex: 100,
            url: "/Notification/CreateNotification",
            closeOnEscape: true,
            closeAfterAdd: true,
            afterComplete: function (response) {
                if (response.responseText) {
                    alert(response.responseText);
                }
            }
        },
        {
            zIndex: 100,
            url: "/Notification/DeleteNotification",
            closeOnEscape: true,
            closeAfterDelete: true,
            recreateForm: true,
            msg: "Are you sure you want to delete Notification... ? ",
            afterComplete: function (response) {
                if (response.responseText) {
                    alert(response.responseText);
                }
            }
        });
}); 