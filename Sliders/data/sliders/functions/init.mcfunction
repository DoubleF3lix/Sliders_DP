scoreboard objectives add const dummy
scoreboard objectives add sliders.rng dummy
scoreboard objectives add sliders.timer dummy
scoreboard objectives add sliders.config dummy
scoreboard players set $enabled sliders.timer 1
scoreboard players set 1103515245 const 1103515245
scoreboard players set 1200 const 1200
scoreboard players set 1000 const 1000
scoreboard players set 141 const 141
scoreboard players set 60 const 60
scoreboard players set 20 const 20
scoreboard players set 16 const 16
scoreboard players set 2 const 2
scoreboard players set $max sliders.config 600
scoreboard players set $min sliders.config 30
scoreboard players set $timer_done sliders.timer 0
scoreboard players set $waiting sliders.timer 0
scoreboard players set $tick sliders.timer 1
tellraw @a ["", {"text":"Sliders","bold":true,"color":"green"},{"text":" by","bold":false,"color":"white"},{"text":" DoubleFelix","color":"gold"},{"text":" was successfully installed","color":"white"}]