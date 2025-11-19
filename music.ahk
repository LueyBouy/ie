#Persistent

mp3Path := "C:\Idiot\idiot.mp3"

SetTimer, LoopSound, -1
return

LoopSound:
{
SoundPlay, %mp3Path%, wait
SetTimer, LoopSound, -1
}
return