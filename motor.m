function motor(inp)

%disp(inp);
load prev_val.mat;
%inp=test_val;
a = arduino();

%disp(prev_inp);
loop_var=inp;
loop_var = loop_var - prev_inp;
disp("No. of floors the lift will traverse.")
disp(loop_var);

if loop_var>0
    for i = 1:loop_var
        writeDigitalPin(a, 'D10', 1);
        pause(0.08);
        writeDigitalPin(a, 'D10', 0);
        pause(1);
        %disp(i);
    end
end

if loop_var<0
    loop_var = -loop_var;
    for i = 1:loop_var
        writeDigitalPin(a, 'D11', 1);
        pause(0.05);
        writeDigitalPin(a, 'D11', 0);
        pause(1);
       % disp(i);
    end
end

prev_inp=inp;
save ('prev_val.mat','prev_inp');
clear all;

end