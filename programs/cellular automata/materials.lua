local materials = {}
materials[0] = {name = "air",weight = 0, kineticenergy = 0,method = function(x,y)
    return x,(gridinfo.size-1) - y, 0, 0, 0,1
end} -- air
materials[1] = {name = "sand",weight = 100,colour = {r = 0.8,g = 0.9, b =0.2}, kineticenergy = 0,method = function(x,y)
    
    local direction = math.random(1,2)
    local atom_weight = materials[grid[x][y]].weight
    local atom_weight = materials[grid[x][y]].weight

    if grid[x][y-1] and atom_weight > materials[grid[x][y-1]].weight then
        grid[x][y] = grid[x][y-1]
        grid[x][y-1] = 1

    elseif grid[x+1] and grid[x+1][y-1] and atom_weight > materials[grid[x+1][y-1]].weight and direction == 1 then
        grid[x][y] = grid[x+1][y-1]
        grid[x+1][y-1] = 1

    elseif grid[x-1] and grid[x-1][y-1] and atom_weight > materials[grid[x-1][y-1]].weight then
        grid[x][y] = grid[x-1][y-1]
        grid[x-1][y-1] = 1
    end
    return x,(gridinfo.size-1) - y, materials[1].colour.r, materials[1].colour.g, materials[1].colour.b, 1
    
end} -- sand   
materials[2] = {name = "water",weight = 50,colour = {r = 0.1,g = 0.1,b = 1},method = function(x,y)
    local direction = math.random(1,2)
    local atom_weight = materials[grid[x][y]].weight


    if grid[x][y-1] and atom_weight > materials[grid[x][y-1]].weight then
        grid[x][y] = grid[x][y-1]
        grid[x][y-1] = 2

    elseif grid[x+1] and grid[x+1][y-1] and atom_weight > materials[grid[x+1][y-1]].weight and direction == 1 then
        grid[x][y] = grid[x+1][y-1]
        grid[x+1][y-1] = 2

    elseif grid[x-1] and grid[x-1][y-1] and atom_weight > materials[grid[x-1][y-1]].weight then
        grid[x][y] = grid[x-1][y-1]
        grid[x-1][y-1] = 2

    elseif grid[x-1] and grid[x-1][y] and atom_weight > materials[grid[x-1][y]].weight and direction == 1 then
        grid[x][y] = grid[x-1][y]
        grid[x-1][y] = 2

    elseif grid[x+1] and grid[x+1][y] and atom_weight > materials[grid[x+1][y]].weight then
        grid[x][y] = grid[x+1][y]
        grid[x+1][y] = 2
    end


    return x,(gridinfo.size-1) - y, materials[2].colour.r, materials[2].colour.g, materials[2].colour.b, 1
end} -- water
materials[3] = {name = "graval",weight = 90,colour = {r = 0.1,g = 0.12,b = 0.15},method = function(x,y)
    return x,(gridinfo.size-1) - y, materials[3].colour.r, materials[3].colour.g, materials[3].colour.b, 1
end} -- water
materials[4] = {name = "rock",weight = 110,colour = {r = 0.7,g = 0.7, b =0.7}, kineticenergy = 0,method = function(x,y)
    return x,(gridinfo.size-1) - y, materials[4].colour.r, materials[4].colour.g, materials[4].colour.b, 1
    
end} -- plant







return materials