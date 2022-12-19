"""base_controller controller."""


from controller import Robot, Emitter, Receiver
import struct

# create the Robot instance.
robot = Robot()

# get the time step of the current world.
timestep = int(robot.getBasicTimeStep())

#Initialise emitters and receivers
emitter = robot.getEmitter('base_emitter')
receiver = robot.getReceiver('base_receiver')
receiver.enable(timestep)
#Initialise intial message to start robot run
message = b"Start"

# Main loop:
# - perform simulation steps until Webots is stopping the controller
while robot.step(timestep) != -1:
    #Send a message to the watering robot 
    emitter.send(message)
    if receiver.getQueueLength() > 0:
        #Receive a response of acknowlegement
        message = receiver.getData()
        messageString = message.decode()
        if messageString == "OK":
            #If acknowledged, switch to stop at the next watering robot approach
            # This of course could be extended to wait got x seconds and send the robot again
            message = b"Stop"
            print("Received acknowledgement")
        receiver.nextPacket()
    robot.step(2048)

    

# Enter here exit cleanup code.
