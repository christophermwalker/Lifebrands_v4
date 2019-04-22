$(function () {
    var grid = $("#ProductjqGrid");

    $("#ProductjqGrid").jqGrid({
       
         url: "/Product/GetProducts",
         datatype: 'json',
         mtype:'Get',

colNames: ['IdProduct', 'Name', 'Cost', 'Wholesale Cost', 'Retail Price'],
colModel: [
    { key: true, name: 'IdProduct', index: 'IdProduct', editable: true, hidden: true },
    { key: false, name: 'Prod_Name', index: 'Prod_Name', editable: true},
    { key: false, name: 'Cost', index: 'Cost', editable: true},
    { key: false, name: 'Wholesale_Cost', index: 'Wholesale_Cost', editable: true},
    { key: false, name: 'Retail_Price', index: 'Retail_Price', editable: true}],
pager: jQuery('#ProductjqControls'),
rowNum: 10,
rowList: [10, 20, 30, 40, 50],
height:'100%',
viewrecords: true,
caption: 'Products',
emptyrecords: 'No Products are Available to Display',
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
    }).navGrid('#ProductjqControls', { edit: true, add: true, del: true, search: false, refresh: true },
        {
            zIndex: 100,
            url: '/Product/EditProduct',
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
            url: "/Product/CreateProduct",
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
            url: "/Product/DeleteProduct",
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