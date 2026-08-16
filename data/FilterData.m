clear, clc, close all






function X_f = filter_inertial_params(X, dt, wc)

alpha = 1/(1 + wc*dt);

X_f = zeros(size(X));
X_f(1,:) = X(1,:);

for k = 2:size(X,1)
    X_f(k,:) = alpha*X_f(k-1,:) + (1-alpha)*X(k,:);
end

end
