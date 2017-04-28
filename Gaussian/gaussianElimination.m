%JORGE OSES GRIJALBA 3ºDG INF-MAT MN
disp('Gaussian Elimination Jorge Oses Grijalba');
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
    %The A's invertible check will be done during the pointer make 
    %so we don't waste a bazillion hours
end 

exit = false;
iterNumber = 0; % important for point
while(~exit) 
    %If it is the first time we execute the script we have to make the
    %pointer array
    if (iterNumber == 0)
        
        point = 1:n;
        %While making point we check if A invertible or not
        for (i = 1:n-1)
            pivot = i;
            check = abs(A(point(i), i));
            for (j = i+1:size(A, 1))
                if (abs(A(point(j), i)) > check)
                    check = abs(A(point(j), i));
                    pivot = j;
                end
            end
            
            if (check == 0) % A == 0
                disp('A is not invertible!!');
                invertible = false;
                
            else              
                point([i,pivot]) = point([pivot,i]);
                for (j = i+1:n)
                    A(point(j),i) = A(point(j),i) / A(point(i), i);
                    for (k = i+1:n)
                        A(point(j),k) = A(point(j),k) - A(point(j),i)*A(point(i),k);
                    end
                end
                

            end
        end %of outer for condition
        
        %Invertibility check for the n-1th step
        if (A(point(n), n) == 0)
            disp('A is not invertible!!')
            invertible = false;                    
        end
	iterNumber = iterNumber + 1;  
    end %of iterNumber ==0
    
    %We solve w and we use it to solve u only if A is invertible
    if (invertible)
        w = 1:length(b);   
        for (i = 1:size(A, 1))
            w(i) = b(point(i));
            for (j = 1:i-1)
                w(i) = w(i) -  w(j)*A(point(i), j);
            end
        end
        
        u =1:length(b);
        for (i = size(A, 1):-1:1)
            sum = 0;
            j = i+1;
            for (j = i+1:size(A, 1))
                sum = A(point(i), j) * u(j) + sum;
            end
            u(i) = (w(i) - sum) / A(point(i), i);
        end
        
        disp('The solution is :'); u
    end
    
    asking = true;
    while(asking)
        if (invertible)
            disp('Do you want to keep using the same basic matrix (0), solve a different')
            disp('system (1) or exit the program(2)');

            switch input('I choose : ')
                case 0
                    invertible = true;
                    asking = false;
                    validInput = false;  %No do while :(
                    while (~validInput)   
                        validInput = true;
                        b = input('Enter vector in matlab notation (eg: [3 ;4])');

                        p = length(b);
                        %We have to ensure that Au = b makes sense
                        if (n ~= p)
                            disp('Wrong vector size, please try again');
                            validInput = false;
                        end
                    end 

                case 1
                    invertible = true;
                    asking = false;
                    validInput = false;  %No do while :(
                    iterNumber=0;
                    while (~validInput)   
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
                        %The A's invertible check will be done during the pointer make 
                        %so we don't waste a bazillion hours
                    end 

                case 2
                    asking = false;
                    exit = true;
                    disp('Bye bye');
                otherwise
                    disp('choose 0,1,2');
            end
        else 
            disp('Do you want to solve a different')
            disp('system (1) or exit the program(2)?');

            switch input('I choose : ')
                case 1
                    invertible = true;
                    asking = false;
                    validInput = false;  %No do while :(
                    iterNumber=0;
                    while (~validInput)   
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
                        %The A's invertible check will be done during the pointer make 
                        %so we don't waste a bazillion hours
                    end 

                case 2
                    asking = false;
                    exit = true;
                    disp('Bye bye~');
                otherwise
                    disp('choose 0,1,2');
            end
            
        end
    end
end
