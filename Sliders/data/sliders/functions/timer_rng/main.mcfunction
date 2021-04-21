execute if score $max sliders.config = $min sliders.config run scoreboard players operation $output2 sliders.rng = $max sliders.config
execute unless score $max sliders.config = $min sliders.config run function sliders:timer_rng/lcg_range_uniform2
