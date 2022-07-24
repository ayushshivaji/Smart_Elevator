clear all;

arduinoObj=arduino('COM3','Uno','Libraries','Ultrasonic');
ultrasonicObj=ultrasonic(arduinoObj,'D5','D6');

distance = readDistance(ultrasonicObj);

while distance > 0.25
    distance = readDistance(ultrasonicObj);
    pause(0.5);
    disp(distance);
end

clear arduinoObj;
clear ultrasonicObj;

inp=test;
disp("Input returned from KNN classification algorithm.")
disp(inp);
motor(inp);