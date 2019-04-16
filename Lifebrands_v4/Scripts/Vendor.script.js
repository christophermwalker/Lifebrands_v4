$(function () {
    var grid = $("#VendorjqGrid");

    $("#VendorjqGrid").jqGrid({

        url: "/Vendor/GetVendors",
        datatype: 'json',
        mtype: 'Get',

        colNames: ['idVendor', 'Name', 'Address', 'City', 'State', 'Zip'],
        colModel: [
            { key: true, name: 'idPromo', index: 'idPromo', editable: true, hidden: true },
            { key: false, name: 'name', index: 'name', editable: true },
            { key: false, name: 'address', index: 'address', editable: true },
            { key: false, name: 'city', index: 'city', editable: true },
            { key: false, name: 'state', index: 'state', editable: true },
            { key: false, name: 'zip', index: 'zip', editable: true }],
        pager: jQuery('#VendorjqControls'),
        rowNum: 10,
        rowList: [10, 20, 30, 40, 50],
        height: '100%',
        viewrecords: true,
        caption: 'Vendors',
        emptyrecords: 'No Vendors are Available to Display',
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
    }).navGrid('#VendorjqControls', { edit: true, add: true, del: true, search: false, refresh: true },
        {
            zIndex: 100,
            url: '/Vendor/EditVendor',
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
            url: "/Vendor/CreateVendor",
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
            url: "/Vendor/DeleteVendor",
            closeOnEscape: true,
            closeAfterDelete: true,
            recreateForm: true,
            msg: "Are you sure you want to delete Vendor... ? ",
            afterComplete: function (response) {
                if (response.responseText) {
                    alert(response.responseText);
                }
            }
        });
}); 