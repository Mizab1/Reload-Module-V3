#built using mc-build (https://github.com/IanSSenne/mcbuild), Datapack by Mizab

scoreboard players set @s leave 0
scoreboard players operation temp0 rng = state rng
scoreboard players operation temp0 rng *= a rng
scoreboard players operation temp0 rng += c rng
scoreboard players operation temp0 rng %= m rng
scoreboard players operation state rng = temp0 rng
scoreboard players operation $reload rng_reload = temp0 rng
scoreboard players operation $reload rng_reload /= #100000 rng
scoreboard players set min rng 0
scoreboard players set max rng 5
scoreboard players operation size rng = max rng
scoreboard players operation size rng -= min rng
scoreboard players operation $reload rng_reload %= size rng
scoreboard players operation $reload rng_reload += min rng
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score $reload rng_reload matches 0 run function reload:__generated__/conditional/0
execute if score #execute LANG_MC_INTERNAL matches 0 if score $reload rng_reload matches 1 run function reload:__generated__/conditional/1
execute if score #execute LANG_MC_INTERNAL matches 0 if score $reload rng_reload matches 2 run function reload:__generated__/conditional/2
execute if score #execute LANG_MC_INTERNAL matches 0 if score $reload rng_reload matches 3 run function reload:__generated__/conditional/3
execute if score #execute LANG_MC_INTERNAL matches 0 if score $reload rng_reload matches 4 run function reload:__generated__/conditional/4
scoreboard players set $reload rng_reload 0
tag @s add reload.joined
schedule function reload:clicked 3s