% The trust function computes the "trust" assigned to gravity measurements.
%
% It is computationally cheaper to take (x^2 + y^2 + z^2) rather than
% sqrt(x^2 + y^2 + z^2). This script compares the two in the cost function.
% The cost function is linearized about acc = 1 where:
% * if y = x^2
% * then dy/dx = 2x

clear

acc = 0:0.001:2;

costFn = max(0, 1 - 5*abs(acc - 1));

approxCostFn = max(0, 1 - 2.5*abs(acc.^2 - 1));

figure;

yyaxis left
plot(acc, costFn, "--c", acc, approxCostFn, "-b", "LineWidth", 2);
axis([0.5, 1.5, 0, 1]);

ylabel("trust")

yyaxis right
plot(acc, 100*abs(costFn - approxCostFn), ":r", "LineWidth", 2)
axis([0.5, 1.5, 0, 100]);
ylabel("% error")
legend(["ideal", "approx", "error"])
xlabel('$\frac{|| a^{accel}_k ||}{g}$', 'Interpreter', 'latex', 'FontSize', 22)

figure; plot(acc, costFn, "LineWidth", 2)
xlabel('$\frac{|| a^{accel}_k ||}{g}$', 'Interpreter', 'latex', 'FontSize', 22)
ylabel("trust")
%export_fig 40_trustFunction -transparent -png
