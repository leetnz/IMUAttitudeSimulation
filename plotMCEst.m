function plotMCEst(sim, ests, gests, aests)
    fig = figure;
    axis tight manual
    fig.Color=0.95*[1 1 1];
    fig.ToolBar='none';
    fig.Position(3) = 820;
    fig.Position(4) = 360;

    newcolors = [
        0.25 0.80 0.54
        0.83 0.14 0.14
        0.47 0.25 0.80
        1.00 0.54 0.00
    ];
         
    colororder(newcolors)
    
    filename = 'montecarloEst.gif';
    for i = 1:length(ests)
        est=ests(i);
        gest=gests(i);
        aest=aests(i);

        plot(sim.t, est.theta, sim.t, gest.theta, sim.t, aest.theta);
        hold on;
        lh = plot(sim.t, sim.theta, LineWidth=2);
        hold off
        axis([0, sim.t(end), min(sim.theta)-0.1, max(sim.theta)+0.1])
        lh.Color = '#A2142F';
        t = title("Estimated angle", sprintf("iteration %d of %d", i, length(ests)));
        t.Color=[0.1, 0.1, 0.1];
        ylabel('\theta')
        xlabel('time (s)')
        legend(["est", "gyro-only", "accel-only", "actual"], "Location", "southeast")
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

