function plotMCEstAggregate(sim, ests, gests, aests)
    plotAggregate(sim, ests, "Combined Estimator Monte Carlo", [0.25 0.80 0.54 0.05])
    plotAggregate(sim, gests, "Gyroscope Only Estimator Monte Carlo", [0.83 0.14 0.14 0.05])
    plotAggregate(sim, aests, "Accelerometer Only Estimator Monte Carlo", [0.47 0.25 0.80, 0.05])
    
end

function plotAggregate(sim, ests, name, color)
    MC_RUNS = length(ests);

    fig = figure;
    fig.Color=0.95*[1 1 1];
    fig.ToolBar='none';
    fig.Position(3) = 820;
    fig.Position(4) = 360;
    hold on
         
    for i=1:MC_RUNS
        lh = plot(sim.t, ests(i).theta * 180/pi);
        lh.Color = color;
        lh.LineWidth = 2;
    end

    lh = plot(sim.t, sim.theta * 180/pi);
    lh.Color = [1.00 0.54 0.00, 1.0];
    lh.LineWidth = 2;

    ylabel('\theta')
    xlabel('time (s)')
    title(name)

end

