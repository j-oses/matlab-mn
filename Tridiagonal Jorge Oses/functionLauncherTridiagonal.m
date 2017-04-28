% JORGE OSES GRIJALBA 3ºDG INF-MAT MN
% SOURCE : Ex 3.7
disp('Tridiagonal 3.7 Jorge Oses Grijalba');
validInput = false;  %No do while :(
while (~validInput)
    invertible = true;
    validInput = true;
    A = input('Enter invertible square matrix in matlab notation (eg: [2 5; 6 9] )');
    b = input('Enter vector in matlab notation (eg: [3 ;4])');
     
    [m,n] = size(A);
    p = length(b);
    %We have to ensure that Au = b makes sense
    if ((n ~= m) || (m ~= p))
        disp('Wrong matrix or vector size, please try again');
        validInput = false;
    end
end 
    
while (true)
    u= tridiagonal(A,b);
    disp('The result is: ');u
    tryAgain = input('Enter 1 to try again');
    if (tryAgain ~= 1)
        break;
    else
        validInput = false;  %No do while :(
        while (~validInput)
            validInput = true;
            b = input('Enter vector in matlab notation (eg: [3 ;4])');

            [m,n] = size(A);
            p = length(b);
            %We have to ensure that Au = b makes sense
            if (m ~= p)
                disp('Wrong vector size, please try again');
                validInput = false;
            end
        end 
    end
end    