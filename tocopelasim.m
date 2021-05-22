sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
 
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
 
 
if (clientID>-1)
       disp('Connected to remote API server');

        %Handle
               
        [returnCode,swing]=sim.simxGetObjectHandle(clientID,'Swing_arm',sim.simx_opmode_blocking);
        [returnCode,wheel]=sim.simxGetObjectHandle(clientID,'Wheel',sim.simx_opmode_blocking);
        [returnCode,arm]=sim.simxGetObjectHandle(clientID,'Arm',sim.simx_opmode_blocking);
        [returnCode,motor]=sim.simxGetObjectHandle(clientID,'Motor',sim.simx_opmode_blocking);


        %[returnCode]=sim.simxSetJointTargetPosition(clientID,swing,180,sim.simx_opmode_blocking);
        pause(1)
        
        for i=1:length(mv)
           
               
        [returnCode]=sim.simxSetJointTargetVelocity(clientID,motor,mv,sim.simx_opmode_blocking);
        
                  
        
        
       end
            
       
end
 
 sim.delete(); % call the destructor!
    
    disp('Program ended');
