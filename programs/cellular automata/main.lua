local materials = require("materials")
love.window.setTitle("Cellular Automata")
love.graphics.setBackgroundColor(0.1,0.1,0.6,1)
winx,winy = 1200,720
love.window.setMode(winx, winy)

setatom = 1
drawsize = 1
gridinfo = {}
gridinfo.atomsize = 1
gridinfo.size = 700 
imageData = love.image.newImageData(gridinfo.size, gridinfo.size)

-- creating grid
grid = {}
gridupdated = {}
for x = 0,gridinfo.size-1 do
    grid[x] = {}
    gridupdated[x] = {}
    for y = 0,gridinfo.size-1 do
        grid[x][y] = math.random(0,2)
        gridupdated[x][y] = false
        
    end
end

drawing = false
function love.load()
    canvas = love.graphics.newCanvas(gridinfo.size,gridinfo.size)
    function add_atoms()
        
        -- determine where to draw
        drawx = love.mouse.getX() - (winx - 700) * 0.5
        drawy = (love.mouse.getY() - winy + 1 )* -1 - (winy - gridinfo.size)*0.5
        if love.mouse.isDown(1) then
            drawing = true
        else
            drawing = false
        end

        
        
        
        for x = drawx-drawsize,drawx+drawsize do
            for y = drawy-drawsize,drawy+drawsize do
                if drawing then
                    if grid[x] and grid[x][y] then
                        grid[x][y] = setatom
                    end
                end
            end
        end

    end
end

function love.update(dt)
    function love.wheelmoved(x, y)
        -- change material
        if love.keyboard.isDown("lshift") then
            setatom = setatom + y
            if setatom < 0 then
                setatom = #materials
            elseif setatom > #materials then
                setatom = 0
            end
        else
            -- change brush size
            if y > 0 then
                drawsize = drawsize +1
            elseif y < 0 and drawsize > 0 then
                drawsize = drawsize -1
            end
        end
    end
end

function love.draw()
    love.graphics.print("FPS: "..love.timer.getFPS(),50,100)
    love.graphics.print("brush size: "..drawsize,50,120)
    love.graphics.print("selected material: "..materials[setatom].name,50,140)
    love.graphics.print("scroll to togle brush size",50,80)
    love.graphics.print("scroll + Lshift to togle brush material",10,60)
    add_atoms()
    -- add atoms to image
    for x = 0,gridinfo.size-1 do
        for y = 0,gridinfo.size-1 do
            imageData:setPixel(materials[grid[x][y]].method(x,y))
            
        end
    end
    -- drawing to canvas then to screen
    Image = love.graphics.newImage(imageData)
    love.graphics.setCanvas(canvas)
    love.graphics.draw(Image, 0, 0)
    love.graphics.setCanvas()
    love.graphics.draw(canvas, (winx - 700) * 0.5, (winy - 700) * 0.5)
end