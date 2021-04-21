function sliders:timer_rng/lcg_raw
execute if score $output2 sliders.rng matches 0.. run scoreboard players operation $output2 sliders.rng /= 2 phiconst
execute if score $output2 sliders.rng matches ..-1 run function sliders:timer_rng/unsigned_right_shift_1
scoreboard players operation $output2 sliders.rng /= 16 const
scoreboard players operation #temp2 sliders.rng = $output2 sliders.rng
scoreboard players operation $output2 sliders.rng %= #range sliders.rng
scoreboard players operation #temp2 sliders.rng -= $output2 sliders.rng
scoreboard players operation #temp2 sliders.rng += #temp3 sliders.rng
execute if score #temp2 sliders.rng matches ..-1 run function sliders:timer_rng/standard_loop