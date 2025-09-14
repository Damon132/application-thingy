function love.load()
    fill = "fill"
    FOV = 140
    player = {x = 10,y = 10}
    player_direction = {x = 1,y = 0}
    test = {x=4,y=4}
    grid = {{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
            {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}}
    size = 4
    changed = true
    windowx, windowy = love.graphics.getDimensions()
    
    -- functions here
    function rotate_target(target,center_of_orbit,angle) --  target is the point you are rotating, center_of_orbit is what the target is rotating around, angle is the angle that target is being rotated by
        theta = angle*2*math.pi/360
        target.x = target.x - center_of_orbit.x
        target.y = target.y - center_of_orbit.y
        target = {x = math.cos(theta)*target.x + math.sin(theta)*target.y*-1 ,y = math.sin(theta)*target.x + math.cos(theta)*target.y}
        target.x = target.x + center_of_orbit.x
        target.y = target.y + center_of_orbit.y

        local dis_point = target
        return dis_point
    end



    function move_player(dt)
        local speed = 4
        local rotate_speed = 2.3
        local mouseX = love.mouse.getX()/size
        local mouseY = love.mouse.getY()/size
        if love.keyboard.isDown("a") then -- changes the position of the player and end of the raycast
        player_direction = rotate_target(player_direction,{x = 0,y = 0},-1*rotate_speed)

        end
        if love.keyboard.isDown("d") then -- changes the position of the player and end of the raycast
            player_direction = rotate_target(player_direction,{x = 0,y = 0},rotate_speed)
        
        end
        if love.keyboard.isDown("w") then -- changes the position of the player and end of the raycast

            player = {x =  player.x + speed*player_direction.x*dt,y = player.y + player_direction.y*speed*dt}
        end
        if love.keyboard.isDown("s") then -- changes the position of the player and end of the raycast

            player = {x =  player.x + speed*player_direction.x*dt*-1,y = player.y + player_direction.y*speed*dt*-1}
        end
        

       
       
    end



    function changeSquareState()
        local mouseX = love.mouse.getX()/size
        local mouseY = love.mouse.getY()/size
        
        
        
        if love.keyboard.isDown("e") then
            
            grid[math.ceil(mouseY)][math.ceil(mouseX)] = 1
            
        end
            
        
    end



    function drawSquares()
        for y,row in ipairs(grid) do
            for x,v in ipairs(row) do
                if grid[y][x] == 3 then
                    grid[y][x] = 0
                end
                love.graphics.setColor(0,0,1)
                love.graphics.line(size*x-2*size,size*y-2*size,size*x-2*size,size*y-size,size*x-size,size*y-size,size*x-size,size*y-2*size,size*x-2*size,size*y-2*size)
                if v == 1 then
                    love.graphics.setColor(1,1,0)
                    love.graphics.circle("fill",x*size-size/2,y*size-size/2,size/2)
                elseif v == 2 then
                    love.graphics.setColor(1,0,0)
                    love.graphics.circle("fill",x*size-size/2,y*size-size/2,size/2)
                elseif v == 3 then
                    love.graphics.setColor(0,1,0)
                    love.graphics.circle("fill",x*size-size/2,y*size-size/2,size/2,0.5)
                end
            end
        end
        love.graphics.setColor(1,0,1)
        love.graphics.circle("fill",player.x*size,player.y*size,1)
        
        love.graphics.line(player.x*size,player.y*size,(player_direction.x+player.x)*size,(player_direction.y+player.y)*size)
    end



    function normalise(vector,vectortwo)
        
        local new_vector = {x = vectortwo.x - vector.x,y = vectortwo.y - vector.y}
        local magnitude = (new_vector.x^2+new_vector.y^2)^0.5
        new_vector.x = new_vector.x/magnitude
        new_vector.y = new_vector.y/magnitude
        
        return new_vector
    end
    




    function raycast(vector)
        
        target = {x = player.x + vector.x,y = player.y + vector.y}
        local current_step = {x = player.x,y = player.y}

        if vector.x == 0 then-- prevents divide by 0 errors
            vector.x = 0.0000001
        end
        if vector.y == 0 then
            vector.y = 0.0000001
        end
      
        local direction = {x = vector.x / (math.abs(vector.x)), -- -1 if vector.x is positive, 1 if vector.x is negitave
                     y = vector.y / (math.abs(vector.y))} -- -1 if vector.y is positive, 1 if vector.y is negitave
       
        local hit = false
        local itterated = 0


        if current_step.x == target.x and current_step.y == target.y then
            hit = true
        end
        while hit == false do
            

            
            local maths_n_stuff = {}

            if direction.x == -1 then -- tbh i forgor how this works but it works
                maths_n_stuff.x = 1/math.abs(vector.x)*(  (current_step.x + - math.floor(current_step.x)))
            else 
                maths_n_stuff.x = 1/math.abs(vector.x)*( 1- (current_step.x - math.floor(current_step.x)))
            end

            if direction.y == -1 then
                maths_n_stuff.y = 1/math.abs(vector.y)*(  (current_step.y - math.floor(current_step.y)))
            else
                maths_n_stuff.y = 1/math.abs(vector.y)*( 1- (current_step.y - math.floor(current_step.y)))
            end
            


            local closest_cell = math.min(maths_n_stuff.x,maths_n_stuff.y)
        
            current_step.x = current_step.x + vector.x * closest_cell + 0.001*direction.x -- x coord of current step
            current_step.y = current_step.y + vector.y * closest_cell + 0.001*direction.y -- y coord of current step
            
            
            if grid[math.ceil(current_step.y)][math.ceil(current_step.x)] == 1 or grid[math.ceil(current_step.y)][math.ceil(current_step.x)] == 2 then
                
            
                love.graphics.setColor(1,1,1)
                love.graphics.circle(fill,(current_step.x)*size,-- point of intersection
                                      (current_step.y)*size,3)
                hit = true
                local distance_to_wall = ((current_step.x-player.x)^2 + (current_step.y-player.y)^2)^0.5
                return {x = current_step.x,y = current_step.y,distance = distance_to_wall}
            end

        
        end
    end



    function draw_seudo3D_scene(amount_of_rays)
        direction = {x = player_direction.x,y = player_direction.y}
        direction = rotate_target(direction,{x = 0,y = 0},FOV*-0.5)
        angle = 0
        for i = 1,amount_of_rays do
            direction = rotate_target(direction,{x = 0,y = 0},FOV/amount_of_rays)
            
            distance_to_wall = raycast(direction).distance
            wall_size = (1/distance_to_wall)
            love.graphics.setColor(1,1,1)
            love.graphics.line(i*windowx/(amount_of_rays+1),   windowy*0.5-(windowy*0.5*wall_size),                 
                               i*windowx/(amount_of_rays+1),   windowy*0.5+(windowy*0.5*wall_size))
            
            
        end
    end
end

function love.update(dt)
    move_player(dt)
    changeSquareState()
    love.wheelmoved = function(x,y)
        if y > 0 then
            FOV = FOV + 1
        elseif y < 0 then
            FOV = FOV - 1
        end
        if FOV < 5 then
            FOV = 5
        end
        if FOV > 180 then
            FOV = 180
        end
    end
    
end

function love.draw()
    love.graphics.print("hover mouse blue grid and press e to draw",220,10)
    love.graphics.print("WASD to move",220,30)
    
    love.graphics.print("scroll to change fov",220,50)
    draw_seudo3D_scene(700)
    drawSquares()
    
    
    
    
end