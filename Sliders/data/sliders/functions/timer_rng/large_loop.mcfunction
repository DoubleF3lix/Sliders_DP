function sliders:timer_rng/lcg

execute store success score #temp sliders.rng if score $output2 sliders.rng < $min sliders.config
execute if score #temp sliders.rng matches 0 store success score #temp sliders.rng if score $output2 sliders.rng > $max sliders.config
execute unless score #temp sliders.rng matches 0 run function sliders:timer_rng/large_loop