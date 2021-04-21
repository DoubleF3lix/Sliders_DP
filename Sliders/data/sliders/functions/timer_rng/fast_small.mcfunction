function sliders:timer_rng/lcg
scoreboard players operation $output2 sliders.rng %= #range sliders.rng
scoreboard players operation $output2 sliders.rng += $min sliders.config