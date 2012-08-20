/**
 * @depends jquery
 * @name jquery.scrollto
 * @package jquery-scrollto {@link http://balupton.com/projects/jquery-scrollto}
 */

/**
 * jQuery Aliaser
 */
(function (window, undefined) {
    // Prepare
    var jQuery, $, ScrollTo;
    jQuery = $ = window.jQuery;

    /**
     * jQuery ScrollTo (balupton edition)
     * @version 1.2.0
     * @date July 9, 2012
     * @since 0.1.0, August 27, 2010
     * @package jquery-scrollto {@link http://balupton.com/projects/jquery-scrollto}
     * @author Benjamin "balupton" Lupton {@link http://balupton.com}
     * @copyright (c) 2010 Benjamin Arthur Lupton {@link http://balupton.com}
     * @license MIT License {@link http://creativecommons.org/licenses/MIT/}
     */
    ScrollTo = $.ScrollTo = $.ScrollTo || {
        /**
         * The Default Configuration
         */
        config:{
            duration:400,
            easing:'swing',
            callback:undefined,
            durationMode:'each',
            offsetTop:0,
            offsetLeft:0
        },

        /**
         * Configure ScrollTo
         */
        configure:function (options) {
            // Apply Options to Config
            $.extend(ScrollTo.config, options || {});

            // Chain
            return this;
        },

        /**
         * Perform the Scroll Animation for the Collections
         * We use $inline here, so we can determine the actual offset start for each overflow:scroll item
         * Each collection is for each overflow:scroll item
         */
        scroll:function (collections, config) {
            // Prepare
            var collection, $container, container, $target, $inline, position,
                containerScrollTop, containerScrollLeft,
                containerScrollTopEnd, containerScrollLeftEnd,
                startOffsetTop, targetOffsetTop, targetOffsetTopAdjusted,
                startOffsetLeft, targetOffsetLeft, targetOffsetLeftAdjusted,
                scrollOptions,
                callback;

            // Determine the Scroll
            collection = collections.pop();
            $container = collection.$container;
            container = $container.get(0);
            $target = collection.$target;

            // Prepare the Inline Element of the Container
            $inline = $('<span/>').css({
                'position':'absolute',
                'top':'0px',
                'left':'0px'
            });
            position = $container.css('position');

            // Insert the Inline Element of the Container
            $container.css('position', 'relative');
            $inline.appendTo($container);

            // Determine the top offset
            startOffsetTop = $inline.offset().top;
            targetOffsetTop = $target.offset().top;
            targetOffsetTopAdjusted = targetOffsetTop - startOffsetTop - parseInt(config.offsetTop, 10);

            // Determine the left offset
            startOffsetLeft = $inline.offset().left;
            targetOffsetLeft = $target.offset().left;
            targetOffsetLeftAdjusted = targetOffsetLeft - startOffsetLeft - parseInt(config.offsetLeft, 10);

            // Determine current scroll positions
            containerScrollTop = container.scrollTop;
            containerScrollLeft = container.scrollLeft;

            // Reset the Inline Element of the Container
            $inline.remove();
            $container.css('position', position);

            // Prepare the callback
            callback = function (event) {
                // Check
                if (collections.length === 0) {
                    // Callback
                    if (typeof config.callback === 'function') {
                        config.callback.apply(this, [event]);
                    }
                }
                else {
                    // Recurse
                    ScrollTo.scroll(collections, config);
                }
                // Return true
                return true;
            };

            // Handle if we only want to scroll if we are outside the viewport
            if (config.onlyIfOutside) {
                // Determine current scroll positions
                containerScrollTopEnd = containerScrollTop + $container.height();
                containerScrollLeftEnd = containerScrollLeft + $container.width();

                // Check if we are in the range of the visible area of the container
                if (containerScrollTop < targetOffsetTopAdjusted && targetOffsetTopAdjusted < containerScrollTopEnd) {
                    targetOffsetTopAdjusted = containerScrollTop;
                }
                if (containerScrollLeft < targetOffsetLeftAdjusted && targetOffsetLeftAdjusted < containerScrollLeftEnd) {
                    targetOffsetLeftAdjusted = containerScrollLeft;
                }
            }

            // Determine the scroll options
            scrollOptions = {};
            if (targetOffsetTopAdjusted !== containerScrollTop) {
                scrollOptions.scrollTop = targetOffsetTopAdjusted + 'px';
            }
            if (targetOffsetLeftAdjusted !== containerScrollLeft) {
                scrollOptions.scrollLeft = targetOffsetLeftAdjusted + 'px';
            }

            // Perform the scroll
            if (scrollOptions.scrollTop || scrollOptions.scrollLeft) {
                $container.animate(scrollOptions, config.duration, config.easing, callback);
            }
            else {
                callback();
            }

            // Return true
            return true;
        },

        /**
         * ScrollTo the Element using the Options
         */
        fn:function (options) {
            // Prepare
            var collections, config, $container, container;
            collections = [];

            // Prepare
            var $target = $(this);
            if ($target.length === 0) {
                // Chain
                return this;
            }

            // Handle Options
            config = $.extend({}, ScrollTo.config, options);

            // Fetch
            $container = $target.parent();
            container = $container.get(0);

            // Cycle through the containers
            while (($container.length === 1) && (container !== document.body) && (container !== document)) {
                // Check Container for scroll differences
                var scrollTop, scrollLeft;
                scrollTop = $container.css('overflow-y') !== 'visible' && container.scrollHeight !== container.clientHeight;
                scrollLeft = $container.css('overflow-x') !== 'visible' && container.scrollWidth !== container.clientWidth;
                if (scrollTop || scrollLeft) {
                    // Push the Collection
                    collections.push({
                        '$container':$container,
                        '$target':$target
                    });
                    // Update the Target
                    $target = $container;
                }
                // Update the Container
                $container = $container.parent();
                container = $container.get(0);
            }

            // Add the final collection
            collections.push({
                '$container':$(
                    ($.browser.msie || $.browser.mozilla) ? 'html' : 'body'
                ),
                '$target':$target
            });

            // Adjust the Config
            if (config.durationMode === 'all') {
                config.duration /= collections.length;
            }

            // Handle
            ScrollTo.scroll(collections, config);

            // Chain
            return this;
        }
    };

    // Apply our jQuery Prototype Function
    $.fn.ScrollTo = $.ScrollTo.fn;

})(window);

var laosong_login =
    '<!-- 弹出登录层 -->' +
        '<!--end弹出登录层-- >';

function bindLoginFrameEvent() {
    $("#close_btn").click(function () {
        popwindow_close();
    })

    $("#login_btn").click(function () {
        var username = $("#usernameInput").val();
        var userpwd = $("#userpwdInput").val();

        $.callOrderAction("POST", "/orderAction/login", {respDataType:"json", username:username, userpwd:userpwd},
            function (data) {
                popwindow_close();
                submitAfterLogin();
            },
            function (data) {
                alert("error login");
            }
        );
    })
}

var pending_type = null;
var pending_url = null;
var pending_params = null;
var pending_successCallback = null;
var pending_failCallback = null;

function submitAfterLogin() {
    if (pending_type != null && pending_url != null && pending_successCallback != null) {
        var options = {
            type:pending_type,
            data:pending_params,
            success:function (data, textStatus, jqXHR) {
                var respCT = jqXHR.getResponseHeader("content-type");
                if (respCT != null && respCT.indexOf("text/json") >= 0) {
                    if (data.success == false) {
                        if (pending_failCallback) {
                            pending_failCallback(data);
                        } else {
                            alert(data.message);
                        }
                    } else {
                        pending_successCallback(data);
                    }
                } else {
                    pending_successCallback(data);
                }
            },
            error:function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        };
        return $.ajax(pending_url, options);
    }
}

jQuery.extend({
    callOrderAction:function (type, url, params, successCallback, failCallback) {
        url += "?requestType=ajax";
        var options = {
            type:type,
            data:params,
            success:function (data, textStatus, jqXHR) {
                var respCT = jqXHR.getResponseHeader("content-type");
                if (respCT != null && respCT.indexOf("text/json") >= 0) {
                    if (data.success == false) {
                        //noinspection JSUnresolvedVariable
                        if (data.needRole != null) {
                            alert(getLocaleMessage("client.ajax.NeedLogin"));
                        } else if (failCallback) {
                            failCallback(data);
                        } else {
                            alert(getLocaleMessage(data.message));
                        }
                    } else {
                        successCallback(data);
                    }
                } else {
                    successCallback(data);
                }
            },
            error:function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        };
        return $.ajax(url, options);
    }
})