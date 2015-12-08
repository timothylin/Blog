var uri = "/api/staticpageapi/";

$(document).ready(function () {
    loadStaticPages();
});

function loadStaticPages() {
    $.getJSON(uri)
        .done(function (data) {
            $('#staticpages li').remove();

            $.each(data, function (index, staticpage) {
                $(createLink(staticpage)).appendTo($('#staticpages'));
            });
        });
};

function createLink(staticpage) {
    return '<li><a href="/Page/ViewStaticPage/' + staticpage.StaticPageId + '" title="' + staticpage.StaticPageTitle + '">'
        + staticpage.StaticPageTitle + '</a></li>';

}