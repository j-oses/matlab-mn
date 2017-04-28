% % JORGE OSES GRIJALBA 3ºDG INF-MAT MN
% % SOURCE : Ex 3.7
%disp('Tridiagonal 3.7 Jorge Oses Grijalba');
% validInput = false;  %No do while :(
% while (~validInput)
%     invertible = true;
%     validInput = true;
%     A = input('Enter invertible square matrix in matlab notation (eg: [2 5; 6 9] )');
%     b = input('Enter vector in matlab notation (eg: [3 ;4])');
%      
%     [m,n] = size(A);
%     p = length(b);
%     %We have to ensure that Au = b makes sense
%     if ((n ~= m) || (m ~= p))
%         disp('Wrong matrix or vector size, please try again');
%         validInput = false;
%     end
% end 
    
% while (true)
%     u= tridiagonal(A,b);
%     disp('The result is: ');u
%     tryAgain = input('Enter 1 to try again');
%     if (tryAgain ~= 1)
%         break;
%     else
%         validInput = false;  %No do while :(
%         while (~validInput)
%             validInput = true;
%             b = input('Enter vector in matlab notation (eg: [3 ;4])');
% 
%             [m,n] = size(A);
%             p = length(b);
%             %We have to ensure that Au = b makes sense
%             if (m ~= p)
%                 disp('Wrong vector size, please try again');
%                 validInput = false;
%             end
%         end 
%     end
% end    
function u = tridiagonal(A, b)
    n = size(A,1);
    % g and m are defined in ex 7.3
    g = zeros(n, 1);
    m = zeros(n, 1);
    %First step of the inductive proposition done separately
    %(no substraction)
    m(1) = A(1,1);
    if (m(1) == 0)
        disp('m1 is zero!!')    
    else
        g(1) = b(1) / m(1);
        badlyDefined = false;
        %Iterate until n 
        for (i = 2:n)
            m(i) = A(i,i) - A(i-1,i) / m(i-1) * A(i,i-1);
            if (m(i) == 0)
                disp('m'+int2str(i)+' is zero!!');
                badlyDefined = true;
                break;
            end
            g(i) = (b(i) - A(i,i-1)*g(i-1)) / m(i);
        end
        if (~badlyDefined) % if everything is ok up to this point
            u(n) = g(n);

            for (i = n-1:-1:1)
                u(i) = g(i) - A(i,i+1) / m(i) * u(i+1);
            end
        end
    end
end
