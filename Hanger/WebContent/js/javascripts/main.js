var isModalOpened = false;
var prevState;

jQuery(document).ready(function() {
    var searchTags = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('tagName'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 8,
        remote: {
            url: '/search/tag/%QUERY'
        }
    });

    searchTags.initialize();

    jQuery('input.nav-search.typeahead').typeahead(
        {
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'tags',
            displayKey: 'tagName',
            source: searchTags.ttAdapter()
        }
    ).bind("typeahead:selected", function(obj, datum, name)
        {
            jQuery(this).parents('form:first').submit();
        }
    );

    jQuery('input.nav-search.typeahead').after("<i class='ion ion-android-search'></i>");

    jQuery("#sign-in-require-modal").on("click","a.close-button",function() {
        jQuery("#sign-in-require-modal").css("display","none");
    });

    jQuery(document).on("click",".sign-in-require-action",function() {
        signInRequireModal();
    });

    jQuery('#unpa-card-modal').on('hidden.bs.modal', function (e) {
        if(isModalOpened) {
            isModalOpened = false;
            if (History.enabled) {
                History.pushState(null, prevState.title, prevState.url);
            }
        }
    });

    jQuery(document).on("click","#unpa-card-modal-close",function(){
        jQuery("#unpa-card-modal .modal-body").html("");
        jQuery("#unpa-card-modal").modal('hide');
    });

    window.onpopstate = function(event) {
        jQuery("#unpa-card-modal .modal-body").html("");
        jQuery("#unpa-card-modal").modal('hide');
    };

    jQuery(document).on("click","#unpa-close-button > a", function(){
        jQuery("#unpa-banner-wrapper").addClass("animated bounceOutUp");
    });

    jQuery(document).on("click",".unpa-banner-wrapper .close > a", function(){
        jQuery(".unpa-banner-wrapper").addClass("animated bounceOutUp");
    });

    jQuery(document).on("click","a#unpa-banner-not-today", function(){
        jQuery("#unpa-banner-wrapper").addClass("animated bounceOutUp");
        jQuery(".unpa-banner-wrapper").addClass("animated bounceOutUp");
        jQuery.cookie("screen-banner-closed", 1, { expires: 1, path: '/' });
    });

    jQuery(document).on("click","div.navbar-banner > .close", function(){
        //jQuery.cookie("navbar-banner-closed", 1, { expires: 1, path: '/' });
        jQuery("body").removeClass("has-navbar-banner");
    });

    //jQuery(document).on("mouseenter",".navbar-brand",function() {
    //    jQuery(this).addClass('animated rubberBand');
    //});

    jQuery(document).on("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd",".navbar-brand",function() {
        jQuery(this).removeClass('animated rubberBand');
    });

    jQuery(document).on("click",".unpa-card .share-this",function(event) {
        event.stopPropagation();
        jQuery.ajax({
            type: "GET",
            url: "/review/share/"+jQuery(this).parents(".unpa-card").attr("id"),
            success: function (result, status, xhr) {
                jQuery("#share-this-modal .modal-body").html(result);
                jQuery("#share-this-modal").modal();
            },
            beforeSend:function(){
                jQuery("#unpa-ajax-loader").show();
            },
            complete:function(){
                jQuery("#unpa-ajax-loader").hide();
            }
        });
    });

    jQuery(document).on("click",".unpa-card .product-detail",function(event) {
        event.stopPropagation();
    });

    $('#share-this-modal').on('shown.bs.modal', function () {
        jQuery("#share-this-modal input").select();
    });

    jQuery(document).on("click","#modal-sign-in-button",function(){
        jQuery.ajax({
            type: "GET",
            url: "/signin",
            success: function (result, status, xhr) {
                jQuery("#modal-account-wrap").html(result);
                jQuery("#modal-account-wrap .modal").modal();
            },
            beforeSend:function(){
                jQuery("#unpa-ajax-loader").show();
                jQuery(".modal-backdrop").remove();
            },
            complete:function(){
                jQuery("#unpa-ajax-loader").hide();
            }
        });
    });

    jQuery(document).on("click","#modal-sign-up-button",function(){
        jQuery.ajax({
            type: "GET",
            url: "/signup",
            success: function (result, status, xhr) {
                jQuery("#modal-account-wrap").html(result);
                jQuery("#modal-account-wrap .modal").modal();
            },
            beforeSend:function(){
                jQuery("#unpa-ajax-loader").show();
                jQuery(".modal-backdrop").remove();
            },
            complete:function(){
                jQuery("#unpa-ajax-loader").hide();
            }
        });
    });

    jQuery(document).on("click",".unpa-card > .main-section", function(e){
        if(isModalOpened || !jQuery("#unpa-card-modal").length) {
            window.open(jQuery(this).parent().attr("data-unpa-url"), '_blank');
            //window.location.href = jQuery(this).parent().attr("data-unpa-url");
        } else {
            e.preventDefault();

            jQuery.ajax({
                type: "GET",
                url: jQuery(this).parent().attr("data-unpa-url"),
                success: function (result) {
                    prevState = History.getState();
                    History.pushState(null, '언니의파우치', this.url);

                    jQuery("#unpa-card-modal .modal-body").html(result);
                    jQuery("#unpa-card-modal").modal();
                },
                beforeSend:function(request){
                    request.setRequestHeader("isModal", true);

                    isModalOpened = true;
                    jQuery(".unpa-card").prop( "disabled", true );
                    jQuery("#unpa-ajax-loader").show();
                },
                complete:function(){
                    jQuery(".unpa-card").prop( "disabled", false );
                    jQuery("#unpa-ajax-loader").hide();
                }
            });
            ga('send', 'pageview', { 'page': jQuery(this).parent().attr("data-unpa-url") });
        }
    });

    jQuery(document).on("click", "#facebook-button", function() {
        jQuery("form#sign-in-form >fieldset").attr("disabled","disabled");
        jQuery("#unpa-ajax-loader").show();
    });

    jQuery(document).on("submit","form#sign-in-form",function() {
        var form = jQuery(this);
        jQuery.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function (result, status, xhr) {
                window.location.replace("/");
            },
            beforeSend: function () {
                jQuery("form#sign-in-form > fieldset").attr("disabled","disabled");
                jQuery("#unpa-ajax-loader").show();
            },
            complete: function(){
                jQuery("form#sign-in-form > fieldset").removeAttr("disabled");
                jQuery("#unpa-ajax-loader").hide();
            },
            error: function() {
                jQuery("form#sign-in-form div.message").html("<p class='animated tada'>로그인 정보를 확인해주세요.</p>");
            }
        });

        event.preventDefault();
    });

    jQuery(document).on("submit","form#sign-up-form",function() {
        var form = jQuery(this);
        jQuery.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function (result, status, xhr) {
                window.location.replace("/");
            },
            beforeSend: function () {
                jQuery("form#sign-up-form > fieldset").attr("disabled","disabled");
                jQuery("#unpa-ajax-loader").show();
            },
            complete: function(){
                jQuery("form#sign-up-form > fieldset").removeAttr("disabled");
                jQuery("#unpa-ajax-loader").hide();
            },
            error: function(result) {
                var message = jQuery.parseJSON(result.responseText);
                jQuery("form#sign-up-form div.message").html("<p class='animated tada'>"+message.error+"</p>");
            }
        });

        event.preventDefault();
    });

    jQuery(document).on("submit","form#facebook-sign-up-form",function() {
        jQuery("#unpa-ajax-loader").show();
    });


    dup_check_email = false;
    dup_check_name = false;
    jQuery(document).on("keyup","form#sign-up-form input#email",function() {
        var _this = jQuery(this);
        delay(function(){
            var email = _this.val();

            jQuery.ajax({
                type: 'GET',
                url: '/check/email/'+email,
                success: function() {
                    jQuery("form#sign-up-form #check-email").addClass("success");
                    dup_check_email = true;

                    if(dup_check_name && dup_check_email) {
                        jQuery("form#sign-up-form button[type=submit]").removeAttr('disabled');
                    }
                },
                error: function() {
                    jQuery("form#sign-up-form #check-email").addClass("error");
                    dup_check_email = false;

                    if(dup_check_name || dup_check_email) {
                        jQuery("form#sign-up-form button[type=submit]").attr('disabled','disabled');
                    }
                },
                beforeSend: function () {
                    jQuery("form#sign-up-form #check-email").removeClass("error");
                    jQuery("form#sign-up-form #check-email").removeClass("success");
                    jQuery("form#sign-up-form #mail-ajax-loader").show();
                },
                complete: function(){
                    jQuery("form#sign-up-form #mail-ajax-loader").hide();
                }
            });
        },500);
    });

    jQuery(document).on("keyup","form#sign-up-form input#name",function() {
        var _this = jQuery(this);
        delay(function(){
            var name = _this.val();

            jQuery.ajax({
                type: 'GET',
                url: '/check/nickname/'+name,
                success: function() {
                    jQuery("form#sign-up-form #check-nickname").addClass("success");
                    dup_check_name = true;

                    if(dup_check_name && dup_check_email) {
                        jQuery("form#sign-up-form button[type=submit]").removeAttr('disabled');
                    }
                },
                error: function() {
                    jQuery("form#sign-up-form #check-nickname").addClass("error");
                    dup_check_name = false;

                    if(dup_check_name || dup_check_email) {
                        jQuery("form#sign-up-form button[type=submit]").attr('disabled','disabled');
                    }
                },
                beforeSend: function () {
                    jQuery("form#sign-up-form #check-nickname").removeClass("error");
                    jQuery("form#sign-up-form #check-nickname").removeClass("success");
                    jQuery("form#sign-up-form #nickname-ajax-loader").show();
                },
                complete: function(){
                    jQuery("form#sign-up-form #nickname-ajax-loader").hide();
                }
            });
        },500);
    });

    jQuery(document).on("keyup","form#facebook-sign-up-form input#name",function() {
        var _this = jQuery(this);
        delay(function(){
            var name = _this.val();

            jQuery.ajax({
                type: 'GET',
                url: '/check/nickname/'+name,
                success: function() {
                    jQuery("form#facebook-sign-up-form #check-nickname").addClass("success");
                    jQuery("form#facebook-sign-up-form button[type=submit]").removeAttr('disabled');
                },
                error: function() {
                    jQuery("form#facebook-sign-up-form #check-nickname").addClass("error");
                    jQuery("form#facebook-sign-up-form button[type=submit]").attr('disabled','disabled');
                },
                beforeSend: function () {
                    jQuery("form#facebook-sign-up-form #check-nickname").removeClass("error");
                    jQuery("form#facebook-sign-up-form #check-nickname").removeClass("success");
                    jQuery("form#facebook-sign-up-form #facebook-nickname-ajax-loader").show();
                },
                complete: function(){
                    jQuery("form#facebook-sign-up-form #facebook-nickname-ajax-loader").hide();
                }
            });
        },500);
    });

    jQuery(document).on("click","a.review-delete-button", function(){
        var uuid = jQuery(this).attr("review-uuid");

        if(uuid) {
            return confirm("삭제하시겠습니까?");
        }
    });

    var isDoingLike = false;
    jQuery(document).on("click",".like-button",function(){
        if(isDoingLike) {
            return;
        }
        if(!window.UNPA_USER) {
            signInRequireModal();
            return;
        }
        var button = jQuery(this);
        var url = jQuery(this).parent().data("unpa-like-url");

        if(url) {
            console.log(url);
            jQuery.ajax({
                type: "POST",
                url: url,
                success: function (result) {
                    updateLike(result.isLiked, result.uuid);
                },
                beforeSend:function(){
                    isDoingLike = true;

                    if(jQuery(button).hasClass("liked")) {
                        jQuery(button).removeClass("liked");
                    } else {
                        jQuery(button).addClass("liked");

                        likeAnimation(button);
                    }
                },
                complete:function(){
                    isDoingLike = false;
                }
            });
        }
    });

    function likeAnimation(button) {
        var i = jQuery(button).find("i");

        var left = jQuery(i).offset().left;
        var top = jQuery(i).offset().top;
        var width = jQuery(i).width();
        var height = jQuery(i).height();

        var centerX = left + width / 2;
        var centerY = top + height /2;

        var anim_i = jQuery("<i>")
            .addClass("unpa-like-effect")
            .addClass("ion-heart")
            .css("position", "absolute")
            .css("display", "inline-block")
            .css("z-index", "9999");

        jQuery("body").append(anim_i);

        var x = centerX - jQuery(anim_i).width() / 2;
        var y = centerY - jQuery(anim_i).height() / 2;

        jQuery(anim_i)
            .css("left", x+"px")
            .css("top", y+"px");

        jQuery(anim_i).one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function() {
            jQuery(this).remove();
        });
    }

    function updateLike(isLiked, uuid) {
        jQuery("[data-unpa-likable-uuid='"+uuid+"']").each(function (index, value) {
            var like_span = jQuery(value);
            var count = parseInt(jQuery(like_span.children(".like-button")).children(".count").text());

            if(isLiked) {
                jQuery(like_span.children(".like-button")).addClass("liked");
                jQuery(like_span.children(".like-button")).children(".count").text(count+1);
            } else {
                jQuery(like_span.children(".like-button")).removeClass("liked");
                jQuery(like_span.children(".like-button")).children(".count").text(count-1);
            }
        });
    }

    jQuery(document).on('click', '.followable .user-follow-button', function() {
        if(!window.UNPA_USER) {
            signInRequireModal();
            return false;
        }
        var follow_button = jQuery(this);
        var followable = jQuery(follow_button).parents('.followable');
        var user_uuid = jQuery(followable).attr('data-unpa-user-uuid');

        if(user_uuid) {
            jQuery.ajax({
                url: '/@'+user_uuid+'/follow',
                type: 'POST',
                success: function(result) {
                    if(result.isFollowed) {
                        jQuery(followable).addClass('followed');
                        unpaMessage("info", "팔로우를 하였습니다");
                    }
                    else {
                        jQuery(followable).removeClass('followed');
                        unpaMessage("info", "팔로우를 취소합니다");
                    }
                },
                error: function(xhr) {
                },
                beforeSend:function(){
                    jQuery("#unpa-ajax-loader").show();
                },
                complete:function(){
                    jQuery("#unpa-ajax-loader").hide();
                }
            });
        }
        else { }
    });

    var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
    })();

    function signInRequireModal() {
        $('#sign-in-require-modal').css("display", "block");
    }

    // offsetRelative (or, if you prefer, positionRelative)
    (function($){
        $.fn.offsetRelative = function(top){
            var $this = $(this);
            var $parent = $this.offsetParent();
            var offset = $this.position();
            if(!top) return offset; // Didn't pass a 'top' element
            else if($parent.get(0).tagName == "BODY") return offset; // Reached top of document
            else if($(top,$parent).length) return offset; // Parent element contains the 'top' element we want the offset to be relative to
            else if($parent[0] == $(top)[0]) return offset; // Reached the 'top' element we want the offset to be relative to
            else { // Get parent's relative offset
                var parent_offset = $parent.offsetRelative(top);
                offset.top += parent_offset.top;
                offset.left += parent_offset.left;
                return offset;
            }
        };
        $.fn.positionRelative = function(top){
            return $(this).offsetRelative(top);
        };
    }(jQuery));

    jQuery(document.body).on('click', '.loadable .unpa-load-more-button', function() {
        var load_more_button = jQuery(this);
        var loadable = jQuery(load_more_button).parents('.loadable');
        var loadable_url = jQuery(loadable).attr('data-unpa-loadable-url');

        if(loadable_url) {
            jQuery.ajax({
                url: loadable_url,
                type: 'GET',
                success: function(result) {
                    if(result.body && result.url) {
                        jQuery(load_more_button).before(result.body);
                        jQuery(loadable).attr('data-unpa-loadable-url', result.url);

                        if(result.hasNext === false) {
                            jQuery(load_more_button).remove();
                        }
                    }
                },
                error: function() {
                    jQuery(load_more_button).remove();
                },
                beforeSend:function(){
                    jQuery("#unpa-ajax-loader").show();
                },
                complete:function(){
                    jQuery("#unpa-ajax-loader").hide();
                }
            });
        }
    });

    //jQuery('div.raty.unpa-product-rating').raty({
    //    half     : true,
    //    starType : 'i'
    //});

    jQuery(document).on("click", "div.raty.unpa-product-rating > img", function(e) {
        e.stopPropagation();

        if(!window.UNPA_USER) {
            signInRequireModal();
            return;
        }

        var rating = jQuery(this).attr("alt");
        var isHalf = jQuery(this).attr("src").indexOf("half") > 0;
        var url = jQuery(this).parents(".raty").data("unpa-rating-url");

        if(isHalf) {
            rating = rating - 0.5;
        }

        var data = {};
        data.rating = rating;

        if(url) {
            jQuery.ajax({
                url: url,
                type: 'POST',
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: 'application/json',
                cache: false,
                processData: false,
                success: function(result) {
                    if(result.success) {
                        jQuery("#unpa-ajax-loader").hide();
                        if(result.message) {
                            unpaMessage("rating", result.message);
                        }
                        jQuery("#unpa-product-rating-modal").hide();
                    }
                },
                error: function() {
                },
                beforeSend:function(){
                    jQuery("#unpa-ajax-loader").show();
                },
                complete:function(){
                    jQuery("#unpa-ajax-loader").hide();
                }
            });
        }
    });

    jQuery(document).on("click", ".unpa-feed-detail-wrap.product .action.rating", function(e) {
        jQuery("#unpa-product-rating-modal").show();
    });

    jQuery(document).on("click", "#unpa-product-rating-modal .close", function(e) {
        jQuery("#unpa-product-rating-modal").hide();
    });

    jQuery(document).on("click", ".user-action-box .action.like.product", function(e) {
    });

    jQuery(document).on("click", ".unpa-card.unpa-product .rating-action-box", function(e) {
        e.stopPropagation();
    });

    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('#unpa-scroll-to-top-button').fadeIn();
        } else {
            $('#unpa-scroll-to-top-button').fadeOut();
        }
    });

    $('#unpa-scroll-to-top-button').click(function(){
        $('html, body').animate({scrollTop : 0}, 1000);
        return false;
    });
});

function unpaMessage(type, message) {
    var div = jQuery("<div>")
        .attr('class', 'unpa-flash-alert')
        .css("display", "none")
        .html(message);

    if(type==="error") {
        div.addClass("error");
    } else if(type==="info") {
        div.addClass("info");
    } else if(type==="rating") {
        div.addClass("rating");
    }

    jQuery("body").append(div);

    jQuery(div).slideDown(500).delay(5000).slideUp(500);
}