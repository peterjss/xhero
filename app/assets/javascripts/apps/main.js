
(function ($) {
    $.fn.exform = function(){
        this.each(function () {
            var form = $(this);
            for (var i = $.fn.exform.renders.length - 1; i >= 0; i--) {
                $.fn.exform.renders[i](form)
            };
            form.addClass('rended');
        })
    }
    $.fn.exform.renders = [];
    $(function() {
        $('.exform:not(.rended)').exform();
    });

    $.getCookie = function(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
// Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    $('body').on('click.xa.togglebtn.data-api', '[data-toggle=class]', function (e) {
        var $this = $(this), href
        var target = $this.attr('data-target')
            || e.preventDefault()
            || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, ''); //strip for ie7
        var className = $this.attr('data-class-name');
        $(target).toggleClass(className);
    });


})(jQuery);

