Chart$methods(

    # Set the default parameters
    get_params = function(){
        params$port <<- params$port %or% 8000
        params$font <<- params$font %or% "Rockwell, Helvetica, Arial, sans"

        params$title <<- params$title %or% params$main %or% internal$file$names$template # alias (main)
        params$subtitle <<- params$subtitle %or% ""

        params$padding <<- validate_padding(params$padding)

        params$palette <<- params$palette %or% params[["col"]] # alias (col)
        params$rotate_y_title <<- params$rotate_y_title %or% TRUE
        params$show_sidebar <<- params$show_sidebar %or% TRUE
    },

    # Ensure there are four padding values named top, right, left and bottom
    validate_padding = function(padding){
        padding <- as.list(padding)
        valid_padding_names <- c("top", "right", "bottom", "left")

        if (any(names(padding) %notin% valid_padding_names)){
            bad_padding_elements <- padding[names(padding) %notin% valid_padding_names]
            stop(sprintf("\nWrong padding elements:\n%s", enumerate(bad_padding_elements)), call. = FALSE)
        } else {
            padding$top <- padding$top       %or% 150
            padding$right <- padding$right   %or% 400
            padding$bottom <- padding$bottom %or% 70
            padding$left <- padding$left     %or% 100
        }

        padding
    }

)