function DCT_image_compression()
    % Read and display the original image
    img = imread('beach.jpg'); % Replace 'image.jpg' with your image file
    img = double(rgb2gray(img)); % Convert to grayscale
    figure, imshow(uint8(img)), title('Original Image');
    
    % Perform 2D DCT
    dct_img = dct2d(img);
    
    % Display the DCT coefficients
    figure, imshow(log(abs(dct_img)),[]), colormap(jet), colorbar;
    title('DCT Coefficients');

    % Compress the image by zeroing out small coefficients
    threshold = 20; % Adjust the threshold value as needed
    dct_img(abs(dct_img) < threshold) = 0;
    
    % Perform inverse 2D DCT
    compressed_img = idct2d(dct_img);
    
    % Display the compressed image
    figure, imshow(uint8(compressed_img)), title('Compressed Image');
end

function dct_mat = dct2d(img)
    [N, M] = size(img);
    dct_mat = zeros(N, M);
    
    % Define alpha function
    alpha = @(m, N) (m == 0) * (1 / sqrt(N)) + (m ~= 0) * sqrt(2 / N);
    
    % Perform DCT
    for m = 0:N-1
        for n = 0:M-1
            sum = 0;
            for i = 0:N-1
                for j = 0:M-1
                    sum = sum + img(i+1, j+1) * ...
                        cos((pi * (2*i + 1) * m) / (2 * N)) * ...
                        cos((pi * (2*j + 1) * n) / (2 * M));
                end
            end
            dct_mat(m+1, n+1) = alpha(m, N) * alpha(n, M) * sum;
        end
    end
end

function img = idct2d(dct_mat)
    [N, M] = size(dct_mat);
    img = zeros(N, M);
    
    % Define alpha function
    alpha = @(m, N) (m == 0) * (1 / sqrt(N)) + (m ~= 0) * sqrt(2 / N);
    
    % Perform inverse DCT
    for i = 0:N-1
        for j = 0:M-1
            sum = 0;
            for m = 0:N-1
                for n = 0:M-1
                    sum = sum + alpha(m, N) * alpha(n, M) * dct_mat(m+1, n+1) * ...
                        cos((pi * (2*i + 1) * m) / (2 * N)) * ...
                        cos((pi * (2*j + 1) * n) / (2 * M));
                end
            end
            img(i+1, j+1) = sum;
        end
    end
end
