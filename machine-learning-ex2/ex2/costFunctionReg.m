function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% -------- Compute J -------
for i=1:m % sum
    h = sigmoid(theta'*X(i,:)');
    J = J + ( -y(i)*log(h) - (1-y(i))*log(1-h) );
end

J = 1/m * J;

% Regularization

S = 0;
for i=2:n
    S = S + theta(i)^2;
end

J = J + lambda/(2*m) * S;

% ----- Compute grad ------

for j=1:n % theta
    S = 0;
    for i=1:m % sum
        h = sigmoid(theta'*X(i,:)');
        S = S + (h - y(i))*X(i,j);
    end
    if j == 1
        grad(j) = 1/m * S;
    else
        grad(j) = 1/m * S + lambda/m * theta(j);
    endif
end




% =============================================================

end
