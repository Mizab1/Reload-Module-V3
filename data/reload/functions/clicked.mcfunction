#built using mc-build (https://github.com/IanSSenne/mcbuild), Datapack by Mizab

tellraw @a {"text":"Remember to use Optifine and Texture Pack"}
execute as @a[tag=reload.joined] at @s run function reload:__generated__/execute/1
function main:load