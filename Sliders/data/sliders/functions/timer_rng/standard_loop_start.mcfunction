scoreboard players operation #temp3 sliders.rng = #range sliders.rng
scoreboard players remove #temp3 sliders.rng 1
function sliders:timer_rng/standard_loop
scoreboard players operation $output2 sliders.rng += $min sliders.config