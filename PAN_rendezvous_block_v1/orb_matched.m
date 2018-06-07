function [orb_matched] = orb_matched(x_current,x_target,K_weighting,match_tol)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

x_diff=x_target-x_current;

diff=x_diff'*K_weighting*x_diff;
if (diff<match_tol)
    orb_matched=1;
else
    orb_matched=0;
end

end

