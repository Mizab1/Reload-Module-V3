import ./rngV2.mcm

function load{
    scoreboard objectives add LANG_MC_INTERNAL dummy
    scoreboard objectives add rng_reload dummy
    scoreboard objectives add leave minecraft.custom:minecraft.leave_game
}

function tick{
    execute as @a at @s unless score @s leave matches 0 run{
        scoreboard players set @s leave 0

        # Reload custom message           
        rng range 0 5 $reload rng_reload
        execute(if score $reload rng_reload matches 0){
            tellraw @a [{"selector":"@s ","color":"green"},{"text":" just hopped on.","color":"white"}]
        }else execute(if score $reload rng_reload matches 1){
            tellraw @a [{"selector":"@s ","color":"green"},{"text":" joined the map, hope you enjoy.","color":"white"}]
        }else execute(if score $reload rng_reload matches 2){
            tellraw @a [{"selector":"@s ","color":"green"},{"text":" just landed.","color":"white"}]
        }else execute(if score $reload rng_reload matches 3){
            tellraw @a [{"text":"Welcome ","color":"white"},{"selector":"@s.","color":"green"}]
        }else execute(if score $reload rng_reload matches 4){
            tellraw @a [{"text":"YAY! ","color":"white"},{"selector":"@s ","color":"green"},{"text":" joined the game.","color":"white"}]
        }
        
        scoreboard players set $reload rng_reload 0
        tag @s add reload.joined

        schedule function reload:clicked 3s
    }
}

function clicked{
    tellraw @a {"text":"Remember to use Optifine and Texture Pack"}
    execute as @a[tag=reload.joined] at @s run{
        tp @s 131 64 -55 90 0
        tag @s remove reload.joined
    }

    function main:load
}
