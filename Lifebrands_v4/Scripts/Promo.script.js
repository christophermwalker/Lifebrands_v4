$(function () {
    var grid = $("#PromojqGrid");

    $("#PromojqGrid").jqGrid({

        url: "/Promo/GetPromos",
        datatype: 'json',
        mtype: 'Get',

        colNames: ['idPromo', 'Name', 'Description', 'Date', 'Discount'],
        colModel: [
            { key: true, name: 'IdPromo', index: 'IdPromo', editable: true, hidden: true },
            { key: false, name: 'Name', index: 'Name', editable: true },
            { key: false, name: 'Promo_Description', index: 'Promo_Description', editable: true },
            { key: false, name: 'Promo_Date', index: 'Promo_Date', editable: true },
            { key: false, name: 'Promo_Discount', index: 'Promo_Discount', editable: true }],
        pager: jQuery('#PromojqControls'),
        rowNum: 10,
        rowList: [10, 20, 30, 40, 50],
        height: '100%',
        viewrecords: true,
        caption: 'Promotions',
        emptyrecords: 'No Promotions are Available to Display',
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
    }).navGrid('#PromojqControls', { edit: true, add: true, del: true, search: false, refresh: true },
        {
            zIndex: 100,
            url: '/Promo/EditPromo',
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
            url: "/Promo/CreatePromo",
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
            url: "/Promo/DeletePromo",
            closeOnEscape: true,
            closeAfterDelete: true,
            recreateForm: true,
            msg: "Are you sure you want to delete Product... ? ",
            afterComplete: function (response) {
                if (response.responseText) {
                    alert(response.responseText);
                }
            }
        });
}); 