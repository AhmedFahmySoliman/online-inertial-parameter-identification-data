function plot_patch_std(Time, MeanVal, StdVal, ColorVal)

    Time = Time(:);
    MeanVal = MeanVal(:);
    StdVal = StdVal(:);

    Upper = MeanVal + StdVal;
    Lower = MeanVal - StdVal;
    Lower(Lower < 0) = 0;

    for k = 1:length(Time)-1
        x_ct = [Time(k) Time(k+1) Time(k+1) Time(k)];
        y_ct = [Lower(k) Lower(k+1) Upper(k+1) Upper(k)];

        p = patch(x_ct,y_ct,'b');
        p.FaceColor = ColorVal;
        p.FaceAlpha = 0.25;
        p.EdgeColor = 'none';
    end
end