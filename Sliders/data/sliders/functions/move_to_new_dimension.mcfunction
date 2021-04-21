summon armor_stand 0 64 0 {Tags:["sliders.temp_entity"]}
spreadplayers 0 0 50 5000 true @e[tag=sliders.temp_entity]
teleport @a[tag=!sliders.exempt] ~ ~ ~
execute at @e[tag=sliders.temp_entity] run spreadplayers ~ ~ 2 500 true @a[tag=!sliders.exempt]
execute at @a[tag=!sliders.exempt] run setworldspawn ~ ~ ~
execute as @a[tag=!sliders.exempt] at @s run fill ~-2 ~-1 ~-2 ~2 ~3 ~2 air
execute as @a[tag=!sliders.exempt] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 grass_block
kill @e[tag=sliders.temp_entity]
function sliders:timer_rng/main
scoreboard players operation $tick sliders.timer = $output2 sliders.rng
scoreboard players operation $tick sliders.timer *= 20 const 
playsound minecraft:entity.enderman.teleport neutral @a ~ ~ ~ 1000000