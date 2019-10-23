love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  l = 0
  t = 0
  w = 1000
  h = 1000
  hp = 100
  x = 400
  y = 300
  img = love.graphics.newImage('assets-1/player/base/naga_red_female.png')
  ex = 100
  ey = 100

  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  wall3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_6.png')
  wall4 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_8.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

  background = {
    {tile4, tile5, wall2, floor, floor, floor, wall2, tile5, tile6, tile7},
    {tile7, wall2, wall2, floor, floor, floor, wall2, wall2, wall2, tile6},
    {tile6, wall2, floor, floor, floor, floor, floor, floor, wall2, tile5},
    {tile5, wall2, floor, floor, floor, floor, floor, floor, wall2, tile4},
    {wall2, wall2, floor, floor, floor, floor, floor, floor, wall2, wall2},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, wall3},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, wall4},
    {wall2, wall2, floor, floor, floor, floor, floor, floor, wall2, wall2},
    {tile6, wall2, floor, floor, floor, floor, floor, floor, wall2, tile4},
    {tile7, wall2, floor, floor, floor, floor, floor, floor, wall2, tile5},
    {tile4, wall2, wall2, floor, floor, floor, wall2, wall2, wall2, tile6},
    {tile5, tile6, wall2, wall, wall, wall, wall2, tile5, tile6, tile7}
  }

  collision = {
    {wall2, 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
    {'nil', wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, 'nil'},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {wall2, wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, wall2},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall2, wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, wall2},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, tile4},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, tile5},
    {'nil', wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, tile6},
    {'nil', 'nil', wall2, wall, wall, wall, wall2, tile5, tile6, tile7}
  }


  --bkgrnd = Map:new(map)
  -- floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  --   background = {
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --   }
  --   wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  --     collision = {
  --       {tile, tile, tile, tile},
  --       {tile, 'nil', 'nil', tile},
  --       {tile, 'nil', 'nil', tile},
  --       {tile, 'nil', 'nil', tile},
  --     }
      background = Map:new(background)
        collision = Map:new(collision)

end





function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 7, 64, 64) == false then
      y = y - 7
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 7, 64, 64) == false then
      y = y + 7
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 7, y, 64, 64) == false then
      x = x + 7
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 7, y, 64, 64) == false then
      x = x - 7
    end
  end



  cam:setPosition(x, y)



  if x > ex then
    ex = ex + 2
  end
  if x < ex then
    ex = ex - 2
  end
  if y > ey then
    ey = ey + 2
  end
  if y < ey then
    ey = ey - 2
  end
end



function love.draw()
  cam:draw(function(l, t, w, h)
  collision:draw()
  background:draw()
  love.graphics.draw(img, x, y)
  love.graphics.draw(eimg, ex, ey)
end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end
