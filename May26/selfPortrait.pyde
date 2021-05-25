size(500,500)
fill(255)

# head
fill(0)
arc(250,120,150,185,PI,PI*2)
fill(255)
arc(250,120,150,150,PI,PI*2)
arc(250,120,150,185,0,PI)

# shoulders
fill(100)
arc(250,315,300,200,PI+HALF_PI,2*PI)
arc(250,315,300,200,PI,PI++HALF_PI)
fill(255)

# arms out
noStroke()
fill(100)
rect(100,315,300,185)
stroke(0)
line(100,315,100,500)
line(400,315,400,500)

# arms in
line(160,320,160,500)
line(340,320,340,500)

fill(255)
rect(100,360,60,150)
rect(340,360,60,150)

# face
line(235,80,200,76)
line(265,80,300,76)
fill(255)
arc(220,100,40,15,PI,2*PI)
arc(220,100,40,15,0,PI)
arc(280,100,40,15,PI,2*PI)
arc(280,100,40,15,0,PI)
fill(0)
ellipse(220,100,10,10)
ellipse(280,100,10,10)
fill(255)
line(250,110,240,135)
line(240,135,250,135)
arc(250,160,40,20,0,PI)
