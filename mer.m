V = randi(10,[5 1]);
N = randi(10,[5 1]);
[minValue, closestIndex] = min(abs(N - V.'));
closestValue = N(closestIndex)