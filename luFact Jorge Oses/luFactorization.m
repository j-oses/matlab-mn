
function [u,A] = luFactorization(A, b)
    n = size(A, 1);
    possible = true;
    if (nargout == 2) %if we have to precalculate...
        for (i = 1:n)
            A(i,i) = A(i,i) - A(i,1:i-1)* A(1:i-1,i);
            
            if (A(i, i) == 0)
                disp('LU Factorization not possible.')
                possible = false;
                break;
            end
            
            for (j = i+1:n)
                A(i,j) = A(i,j) - A(i,1:i-1)* A(1:i-1,j);
            end       
            for (j = i+1:n)
            A(j,i) = 1/A(i,i) * (A(j,i) - A(j,1:i-1)* A(1:i-1,i));
            end
        end
    end
    if (possible)
        for (i = 1:size(A, 1))

            w(i) = b(i);
            for (j = 1:i-1)
                w(i) = w(i) - A(i,j)* w(j);

            end
        end

        for (i = size(A, 1):-1:1)

            sum = 0;
            for (j = i+1:size(A, 1))
                sum = sum + A(i,j)* u(j);

            end
            u(i) = (w(i) - sum) / A(i,i);
        end
    end
    
end