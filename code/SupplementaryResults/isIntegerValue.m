function tf = isIntegerValue(x)
tf = isnumeric(x) & all(mod(x,1) == 0);
end