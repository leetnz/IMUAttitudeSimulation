% Provides the shortest path to go from angle a to b
function out = shortestRadianPath(a, b)
    out = b - a;
    if out > pi
        out = b - (a + 2*pi);
    elseif out < -pi
        out = b - (a - 2*pi);
    end
end