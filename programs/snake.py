import time
import random
import pygame
pygame.init()

#variables
screen = pygame.display.set_mode((690,420))
ran = False
grid = [
    [0,0,0,0,0,0,0,0,0,0,0,0,0],#0
    [0,0,0,0,0,1,0,0,0,0,0,0,0],#1
    [0,0,0,0,0,0,0,0,0,0,0,0,0],#2
    [0,0,0,0,0,0,0,0,0,0,0,0,0],#3
    [0,0,1,0,0,0,0,0,0,0,0,0,0],#4
    [0,0,0,0,0,0,0,0,0,0,0,0,0],#5
    [0,0,0,0,0,0,0,0,0,0,0,0,0],#6
    [0,1,0,0,0,0,0,0,0,0,0,0,0] #7 ahh
]
player_body = [[7,5],[7,6],[7,7]]
player_head = [[7,4],"down"]
eaten_apple = False
hit = 0
#functions
def render_world(): # 1 = apple, 2 = body, 4 = head
    e = -1
    for i in grid: 
        e+=1
        r = -1
        for j in grid[e]:
            r +=1
            cell = pygame.Rect((r*50+20,e*50+20,50,50))
            if j == 1:
                pygame.draw.rect(screen,(255,0,0),cell) 
            elif j == 0:
                pygame.draw.rect(screen,(0,10,0),cell)
            elif j == 2:
                pygame.draw.rect(screen,(0,255,0),cell)
            elif j == 4:
                pygame.draw.rect(screen,(0,150,0),cell)
            pygame.display.update() # refreshes screen

def spawn_apple():
    spawned_apple = False
    
    if eaten_apple == True:
        applex = random.randint(0,12)
        appley = random.randint(0,7)
        while spawned_apple == False:
            if grid[appley][applex] == 0:
                grid[appley][applex] = 1
                spawned_apple = True
            else:
                applex = random.randint(0,12)
                appley = random.randint(0,7)
                



def move_player_head():
    ######################## code for moving player head ##################################################
    if player_head[1] == "up":
        grid[player_head[0][1]][player_head[0][0]] = 0
        if not player_head[0][1] == 0:
            player_head[0][1] -= 1
            
        else:
            player_head[0][1] = 7
           

    elif player_head[1] == "down":
        grid[player_head[0][1]][player_head[0][0]] = 0
        if not player_head[0][1] == 7:
            player_head[0][1] += 1
            
        else:
            player_head[0][1] = 0
            
    
    elif player_head[1] == "left":
        grid[player_head[0][1]][player_head[0][0]] = 0 #same for all
        if not player_head[0][0] == 0:
            player_head[0][0] -= 1
            
        else:
            player_head[0][0] = 12
            
    
    elif player_head[1] == "right":
        grid[player_head[0][1]][player_head[0][0]] = 0 #same for all
        if not player_head[0][0] == 12:
            player_head[0][0] += 1
            
        else:
            player_head[0][0] = 0

def move_player_body(body,head):
    
    
    new_player_body = [[head[0][0],head[0][1]]]
    e = -1
    for i in player_body:
        e += 1
        new_player_body.append([player_body[e][0],player_body[e][1]])
        grid[player_body[e][1]][player_body[e][0]] = 2

    if eaten_apple == False:
        grid[body[-1][1]][body[-1][0]] = 0
        new_player_body.pop()

    return new_player_body
    

def player_action():
    if pygame.key.get_pressed()[pygame.K_UP]:
        player_head[1] = "up"
    if pygame.key.get_pressed()[pygame.K_DOWN]:
        player_head[1] = "down"
    elif pygame.key.get_pressed()[pygame.K_LEFT]:
        player_head[1] = "left"
    elif pygame.key.get_pressed()[pygame.K_RIGHT]:
        player_head[1] = "right"


# main game lool
gameupdate = True
while gameupdate:
    time.sleep(.1)

    player_action()
    render_world()
    move_player_head()
    if grid[player_head[0][1]][player_head[0][0]] == 1:
        eaten_apple = True
    if grid[player_head[0][1]][player_head[0][0]] == 2:
        hit += 1
        if hit == 2:
            gameupdate = False
    
    
    grid[player_head[0][1]][player_head[0][0]] = 4
    player_body = move_player_body(player_body,player_head)
    spawn_apple()
    eaten_apple = False
    

        

    
    ran = True

    #checking for user input
    




    for event in pygame.event.get(): # quits if you press the x to close the window
        if event.type == pygame.QUIT:
            gameupdate = False

    
pygame.quit()
