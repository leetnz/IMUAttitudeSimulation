function plotMCMeanSqErr(sim, ests, gests, aests)

    MC_RUNS = length(ests);
    
    mseAcc = zeros(MC_RUNS, 1);
    mseGyro = zeros(MC_RUNS, 1);
    mseCombined = zeros(MC_RUNS, 1);
    
    for i=1:MC_RUNS

        mseGyro(i) = mean(sqrt((gests(i).theta - sim.theta).^2));
        mseAcc(i) = mean(sqrt((aests(i).theta - sim.theta).^2));
        mseCombined(i) = mean(sqrt((ests(i).theta - sim.theta).^2));
    end

    fig = figure;
    fig.Color=0.95*[1 1 1];
    fig.ToolBar='none';
    fig.Position(3) = 820;
    fig.Position(4) = 360;

    newcolors = [
        0.25 0.80 0.54
        0.83 0.14 0.14
        0.47 0.25 0.80
    ];
         
    colororder(newcolors)

    hold on
    plot(mseCombined * 180/pi, "o", "MarkerSize", 10)
    plot(mseGyro * 180/pi, "x", "MarkerSize", 10)
    plot(mseAcc * 180/pi, "x", "MarkerSize", 10)

    plot([1, MC_RUNS], mean(mseCombined * 180/pi) * [1, 1], "--", "LineWidth", 2)
    plot([1, MC_RUNS], mean(mseGyro * 180/pi) * [1, 1], "--", "LineWidth", 2)
    plot([1, MC_RUNS], mean(mseAcc * 180/pi) * [1, 1], "--", "LineWidth", 2)

    hold off
    ylabel('error (\circ)')
    xlabel('Run #')
    legend(["est", "gyro-only", "accel-only"], "Location", "eastoutside")


    
    
end

