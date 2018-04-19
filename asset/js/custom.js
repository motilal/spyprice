$(document).ready(function () {
    $("img.lazy").lazyload({effect: "fadeIn", threshold: 100, skip_invisible: false});
    $('img.lazy').on('contextmenu', function (e) {
        return false;
    });

    $(".res_searchbox").hide(), $(".sbtn1").click(function () {
        $(".res_searchbox").toggle(), $(".sbox1").focus()
    }), $(".mobileMenu").click(function () {
        $("nav").slideToggle(500)
    })

    $("#filter-wrapper-hide").click(function () {
        $(this).hide(), $("#filter-wrapper").hide(), $("#filter-wrapper-show").show()
    }), $("#filter-wrapper-show").click(function () {
        $(this).hide(), $("#filter-wrapper").show(), $("#filter-wrapper-hide").show()
    }), $("#view-all-feature").click(function () {
        $(".hide-feature").show(), $(this).hide(), $("#hide-other-feature").show()
    }), $("#hide-other-feature").click(function () {
        $(".hide-feature").hide(), $(this).hide(), $("#view-all-feature").show()
    }), $("#view-all-brand").click(function () {
        $(".hide-brand").show(), $(this).hide(), $("#hide-other-brand").show()
    }), $("#hide-other-brand").click(function () {
        $(".hide-brand").hide(), $(this).hide(), $("#view-all-brand").show()
    }), $("#view-all-merchant").click(function () {
        $(".hide-merchant").show(), $(this).hide(), $("#hide-other-merchant").show()
    }), $("#hide-other-merchant").click(function () {
        $(".hide-merchant").hide(), $(this).hide(), $("#view-all-merchant").show()
    });


    $('form#filter_form input,form#filter_form select').on('change', function (event) {
        $('#page').val(1);
        $("form#filter_form").loadILEle({
            link: $("form#filter_form").attr('action'),
            query: $('form#filter_form').serialize(),
            method: 'get',
            type: "search"
        });
    });

    $(document).on('click', 'ul.pagination li a', function (e) {
        e.preventDefault();
        $('#page').val(Number($(this).attr('data-pagenumber')));
        $("form#filter_form").loadILEle({
            link: $("form#filter_form").attr('action'),
            query: $('form#filter_form').serialize(),
            method: 'get',
            type: "search"
        });
    });

});

/*reload page on back history*/
window.addEventListener('popstate', function (event) {
    window.location.reload();
});

(function ($) {
    $.fn.loadILEle = function (params, func) {
        var _this = this;
        $[typeof params.method == 'string' ? params.method : 'get'](params.link, $.inArray(typeof params.query, ['string', 'object']) > -1 ? params.query : {}).always(function (response) {
            var data = {};
            try {
                data = response;
            } catch (e) {
                console.log("AJAX ERROR ===> " + e.toLocaleString());
            }
            if (params.loadType == 'page') {
                $("#product_listing").append(data.result);
            } else {
                $("#product_listing").html(data.result);
            }
            $("#product_listing").find('img.lazy').lazyload({effect: "fadeIn", threshold: 100, skip_invisible: false}).scroll();
            if (typeof history.pushState == "function") {
                window.history.pushState({}, null, typeof params.query == "string" && params.method == "get" ? params.link + "?" + params.query : params.link);
            }
            window.scrollTo(0, 0);
        });
    };
})($, jQuery);