"""water_controller controller."""


from controller import Robot, DistanceSensor, Motor, Receiver, Emitter
from math import sin
import struct

# create the Robot instance.
robot = Robot()
speed = 3.0
is_avoiding = False
time = 0 
wait = True
runRobot = False
# get the time step of the current world.
timestep = int(robot.getBasicTimeStep())

#Initialise wheels motors, each wheel has an independent motor
fr_wheel = robot.getMotor('fr_motor')
fl_wheel = robot.getMotor('fl_motor')
rr_wheel = robot.getMotor('rr_motor')
rl_wheel = robot.getMotor('rl_motor')
#Set poitioning for eacha wheel
fr_wheel.setPosition(float('inf'))
fl_wheel.setPosition(float('inf'))
rr_wheel.setPosition(float('inf'))
rl_wheel.setPosition(float('inf'))
#Initialise steering motors.
#Each wheel can steer independently
rl_steer = robot.getMotor('left_steer')
rr_steer = robot.getMotor('right_steer')
fr_steer = robot.getMotor('fr_steer')
fl_steer = robot.getMotor('fl_steer')
#Initialise the wareting arm motors
arm_base_motor = robot.getMotor('arm_base_motor')
water_motor = robot.getMotor('arm_water_motor')

#Initialise collision sensors
ds_r = robot.getDistanceSensor('sensor_right')
ds_l = robot.getDistanceSensor('sensor_left')
ds_fr = robot.getDistanceSensor('front_right')
ds_fl = robot.getDistanceSensor('front_left')
ds_r.enable(timestep)
ds_l.enable(timestep)
ds_fr.enable(timestep)
ds_fl.enable(timestep)

#Initialise side distance sensors
ds_r1 = robot.getDistanceSensor('right_1')
ds_r2 = robot.getDistanceSensor('right_2')
ds_r3 = robot.getDistanceSensor('right_3')
ds_r4 = robot.getDistanceSensor('right_4')

ds_l1 = robot.getDistanceSensor('left_1')
ds_l2 = robot.getDistanceSensor('left_2')
ds_l3 = robot.getDistanceSensor('left_3')
ds_l4 = robot.getDistanceSensor('left_4')

ds_r1.enable(timestep)
ds_r2.enable(timestep)
ds_r3.enable(timestep)
ds_r4.enable(timestep)

ds_l1.enable(timestep)
ds_l2.enable(timestep)
ds_l3.enable(timestep)
ds_l4.enable(timestep)

righ_sensors = [ds_r1, ds_r2, ds_r3, ds_r4]
left_sensors = [ds_l1, ds_l2, ds_l3, ds_l4]

#Initialise sender and receiver
receiver = robot.getReceiver('mobile_receiver')
emitter = robot.getEmitter('mobile_emitter')
receiver.enable(timestep)


#Steer left function
#Front wheels left, rear wheels right
def steer_left():
    rl_steer.setPosition(-0.5)
    rr_steer.setPosition(-0.5)
    fl_steer.setPosition(0.5)
    fr_steer.setPosition(0.5)
    #print('Turn left')

#Steer right function
#Front wheels right, rear wheels left
def steer_right():
    rl_steer.setPosition(0.5)
    rr_steer.setPosition(0.5)
    fl_steer.setPosition(-0.5)
    fr_steer.setPosition(-0.5)
    #print('Turn right')

#Straight wheels function
def straight():
    rl_steer.setPosition(0)
    rr_steer.setPosition(0)
    fl_steer.setPosition(0)
    fr_steer.setPosition(0)
#Stop funtions, velocity 0
def stop():
    fr_wheel.setVelocity(0)
    fl_wheel.setVelocity(0)
    rl_wheel.setVelocity(0)
    rr_wheel.setVelocity(0)
#Motors on, robot - go
def go():
    fr_wheel.setVelocity(speed)
    fl_wheel.setVelocity(speed)
    rl_wheel.setVelocity(speed)
    rr_wheel.setVelocity(speed)
#Robot going backward
def reverse():
    fr_wheel.setVelocity(-speed)
    fl_wheel.setVelocity(-speed)
    rl_wheel.setVelocity(-speed)
    rr_wheel.setVelocity(-speed)


#Funciton for react to the messages received from the base
def check_messages():
    global runRobot
    while receiver.getQueueLength() > 0 :
        message = receiver.getData()
        #data = struct.unpack("s", message)
        messageString = message.decode()
        #If start is received, go water
        if messageString == "Start" and not runRobot:
            print("Run received, go...")
            receiver.nextPacket()
            runRobot = True
            emitter.send(b"OK")
            go()
            robot.step(512)
            break
        elif messageString == "Stop":
            #If stop is received, wait
            stop()
            print("Received stop flag")
        receiver.nextPacket()

#Water function
#Need to discover when the plant is, right or left
def water():
    #If robot at base, check is it can go
    check_messages()
    #print('wait')
    plant_right = False
    plant_left = False
    #Check side sensors, where is the plant?
    for left in left_sensors:
        value = left.getValue()
        if value < 1000:
            plant_left = True
    for right in righ_sensors:
        value = right.getValue()
        if value < 1000:
            plant_right = True
    #Move the arm to right or left depending where the plant it
    if plant_right:
        arm_base_motor.setPosition(-1)
    elif plant_left:
        arm_base_motor.setPosition(1)
    #Extend the watering arm
    water_motor.setPosition(0.2)
    #Stop and water
    straight()
    stop()
    robot.step(2048)
    #Retract the arm and go
    arm_base_motor.setPosition(0)
    arm_base_motor.setPosition(0)
    water_motor.setPosition(0)
    go()
    robot.step(2048)


#Main loop
while robot.step(timestep) != -1:
    val_l = ds_l.getValue()
    val_r = ds_r.getValue()
    val_fl = ds_fl.getValue()
    val_fr = ds_fr.getValue()
    check_messages()

    #If obstacle detected, avoid
    if val_fl < 500 or val_fr < 500:
        stop()
        steer_right()
        #First reverse
        reverse()
        robot.step(2048)
        stop()
        #Then turn and avoid
        steer_left()
        go()
        robot.step(4056)
        stop()
        go()
        #Look for leading line to find the way back
        while robot.step(timestep) != -1:
            steer_right()
            val_l = ds_l.getValue()
            val_r = ds_r.getValue()
            if  val_r < 400:
                #Line found, straighten the robot on the line
                robot.step(300)
                steer_left()
                robot.step(3000)
                #print("stop")
                break
        go()
        #Avoid complete

   
    #Line detected on one side, correct the couse accordingly
    if val_l < 600 and val_r > 600:
        steer_left()
    elif val_r < 600 and val_l > 600 :
        steer_right()
    #Stop line detected, water
    elif val_l < 400 and val_r < 400:
       water()
    #Keep going                
    else:
       straight()
    

    

