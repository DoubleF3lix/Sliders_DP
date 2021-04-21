scoreboard players operation #range sliders.rng = $max sliders.config
scoreboard players operation #range sliders.rng -= $min sliders.config
execute if score #range sliders.rng matches ..-1 run function sliders:timer_rng/large_loop
execute if score #range sliders.rng matches 0.. run function sliders:timer_rng/standard_loop_start