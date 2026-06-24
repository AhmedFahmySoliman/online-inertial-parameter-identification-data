function S = skew(hx,hy,hz)
S = [0 -hz hy;
     hz 0 -hx;
    -hy hx 0];

end