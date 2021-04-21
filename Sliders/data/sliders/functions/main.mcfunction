execute if score $enabled sliders.timer matches 1 if score $waiting sliders.timer matches 0 if score $tick sliders.timer matches 1.. run scoreboard players set $waiting sliders.timer 1
execute if score $waiting sliders.timer matches 1 if score $timer_done sliders.timer matches 1 run function sliders:timer/finished
execute if score $tick sliders.timer matches 1.. run function sliders:timer/main