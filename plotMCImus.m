function plotMCImus(sim, imus)
    fig = figure;
    axis tight manual
    fig.Color=0.95*[1 1 1];
    fig.ToolBar='none';
    fig.Position(3) = 820;
    fig.Position(4) = 360;
    
    filename = 'montecarloIMUAccY.gif';
    for i = 1:length(imus)
        imu=imus(i);
        lh = plot(sim.t, imu.acc.y * 9.81);
        lh.Color = [0.8500 0.3250 0.0980 0.5];
        hold on;
        lh = plot(sim.t, sim.ddy, LineWidth=2);
        hold off
        axis([0, sim.t(end), min(sim.ddy), max(sim.ddy)])
        lh.Color = '#A2142F';
        t = title("IMU y Acceleration", sprintf("iteration %d of %d", i, length(imus)));
        t.Color=[0.1, 0.1, 0.1];
        ylabel('m.s^2')
        xlabel('time (s)')
        drawnow

    
        frame = getframe(fig); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256);
        
        % Write to the GIF File 
        if i == 1 
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
        else 
            imwrite(imind,cm,filename,'gif','WriteMode','append'); 
        end
    end
end

