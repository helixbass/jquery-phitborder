(( $ ) ->
  $.fn
   .phitBorder =
    ( options ) ->
     $window = $ window
     settings = $.extend minWidth:
                          Number
                           .NEGATIVE_INFINITY
                         maxWidth:
                          Number
                           .POSITIVE_INFINITY
                         sides:
                          [ "top",
                            "bottom",
                            "left",
                            "right" ]
                         container:
                          ""
                        ,
                         options

     @.each ->
        $this = $ @
        (( f ) ->
          f()
          $window[ settings.resizeEvent ?
                    ( "smartresize" if $window.smartresize ) ?
                    "resize" ] f
        )( $.proxy ->
                    $this = $ @
                    (( side ) ->
                      $this
                       .css "border-#{ side }-width",
                            Math.max( Math.min(( settings
                                                  .ratio ?
                                                  $this
                                                   .data( "phitBorder.#{ side }.ratio" ) ?
                                                  (( ratio ) ->
                                                     $this
                                                      .data( "phitBorder.#{ side }.ratio",
                                                             ratio )
                                                     ratio ) parseFloat( $this
                                                                          .css "border-#{ side }-width" ) /
                                                              settings
                                                               .refWidth ) *
                                                 ( settings
                                                    .container?() ?
                                                    $this
                                                     .parents settings
                                                               .container )
                                                  .width(),
                                                parseFloat settings
                                                            .maxWidth ),
                                      parseFloat settings
                                                  .minWidth ))( side ) for side in settings
                                                                                    .sides
                  ,
                   $this )
     @
) jQuery
