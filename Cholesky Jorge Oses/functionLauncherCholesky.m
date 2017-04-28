% JORGE OSES GRIJALBA 3ºDG INF-MAT MN
disp('Cholesky Jorge Oses Grijalba');
validInput = false;  %No do while :(
while (~validInput)
    invertible = true;
    validInput = true;
    A = input('Enter matrix in matlab notation (eg: [2 1; 1 2] )');
    b = input('Enter vector in matlab notation (eg: [2 4])');

    [m,n] = size(A);
    p = length(b);
    %We have to ensure that Au = b makes sense
    if ((n ~= m) || (m ~= p))
        disp('Wrong matrix or vector size, please try again');
        validInput = false;
    end
end 
[u,A] = cholesky(A,b);
disp('The result is: ');u
tryAgain = input('Enter 1 to try again');
while (tryAgain)

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
        u = cholesky(A,b);
        disp('The result is: ');u
        tryAgain = input('Enter 1 to try again');

end