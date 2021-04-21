scoreboard players remove $tick sliders.timer 1
scoreboard players operation $seconds sliders.timer = $tick sliders.timer
scoreboard players operation $seconds sliders.timer /= 20 const
scoreboard players operation $seconds sliders.timer %= 60 const
scoreboard players operation $minutes sliders.timer = $tick sliders.timer
scoreboard players operation $minutes sliders.timer /= 1200 const
scoreboard players operation $minutes sliders.timer %= 60 const
execute if score $seconds sliders.timer matches 0..9 run title @a actionbar ["",{"text":"Time: ","color":"yellow"},{"score":{"name":"$minutes","objective":"sliders.timer"},"bold":true,"color":"yellow"},{"text":":","bold":true,"color":"yellow"},{"text":"0","color":"yellow","bold":true},{"score":{"name":"$seconds","objective":"sliders.timer"},"bold":true,"color":"yellow"}]
execute if score $seconds sliders.timer matches 10.. run title @a actionbar ["",{"text":"Time: ","color":"yellow"},{"score":{"name":"$minutes","objective":"sliders.timer"},"bold":true,"color":"yellow"},{"text":":","bold":true,"color":"yellow"},{"score":{"name":"$seconds","objective":"sliders.timer"},"bold":true,"color":"yellow"}]
execute if score $tick sliders.timer matches 0 run scoreboard players set $timer_done sliders.timer 1