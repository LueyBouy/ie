#Persistent

SetTimer, ShakeMouse, 25
return

ShakeMouse:
Random, randX, -5, 5
Random, randY, -5, 5
MouseMove, randX, randY, 0, R
return