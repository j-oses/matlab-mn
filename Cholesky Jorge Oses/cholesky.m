% % JORGE OSES GRIJALBA 3ºDG INF-MAT MN
% disp('Cholesky Jorge Oses Grijalba');
% validInput = false;  %No do while :(
% while (~validInput)
%     invertible = true;
%     validInput = true;
%     A = input('Enter matrix in matlab notation (eg: [2 5; 6 9] )');
%     b = input('Enter vector in matlab notation (eg: [3 4])');
% 
%     [m,n] = size(A);
%     p = length(b);
%     %We have to ensure that Au = b makes sense
%     if ((n ~= m) || (m ~= p))
%         disp('Wrong matrix or vector size, please try again');
%         validInput = false;
%     end
% end 
% [u,A] = cholesky(A,b);
% disp('The result is: ');u
% tryAgain = input('Enter 1 to try again');
% while (tryAgain)
% 
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
%         u = cholesky(A,b);
%         disp('The result is: ');u
%         tryAgain = input('Enter 1 to try again');
% 
% end
function [u,A] = cholesky(A, b)
    n = size(A, 1);
    viable = true;
    if nargout == 2 
        for i = 1:n 
            c = A(i,1:i-1) * A(i,1:i-1)';       
            if (A(i,i) <= c)
                disp('Cholesky factorization not viable');
                viable = false;
                break;
            end
            
            A(i,i) = sqrt(A(i,i) - c);      
            for j = i+1:n
                A(j,i) = 1 / A(i,i) * (A(i,j) - A(i,1:i-1) * A(j,1:i-1)');
            end
        end
    end
    if (viable)
        for i = 1:size(A, 1)

            w(i) = b(i);
            for j = 1:i-1
                w(i) = w(i) - A(i, j) * w(j);
            end
            w(i) = w(i) / A(i, i);
        end
        
        C = A';
        for i = size(C, 1):-1:1       
            sum = 0;

            for j = i+1:size(C, 1)
                sum = C(i, j) * u(j) + sum;
            end
            u(i) = (w(i) - sum) / C(i, i);
        end
    end
end

