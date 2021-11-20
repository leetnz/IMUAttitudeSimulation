function out = wrapPiToNegPi(in)
    out = mod(in + pi, 2 * pi) - pi;
end