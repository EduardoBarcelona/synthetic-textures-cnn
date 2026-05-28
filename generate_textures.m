pkg load image

% Parâmetros
num_imagens = 50;
tam_final = 300;

% Definição dos tamanhos dos spots
lado_quadrado1 = 10;
lado_quadrado2 = 5;
raio_circulo1 = 5;
raio_circulo2 = 4;


% Para evitar bordas, o kernel deve ser pequeno.
% Definimos um tamanho fixo de kernel para todos (ex: 25x25)
% que comporte o maior spot (lado 40).
tam_k = 41;                                                 %Ajustar Este valor para spots maiores
centro_k = (tam_k + 1) / 2;
% Para que o resultado 'valid' seja 300, a entrada deve ser 300 + 25 - 1 = 324
tam_input = tam_final + tam_k - 1;

% --- 1. CRIAÇÃO DOS KERNELS (SPOTS) PEQUENOS ---
[Xk, Yk] = meshgrid(1:tam_k, 1:tam_k);

% Círculo 1
circulo1 = (Xk - centro_k).^2 + (Yk - centro_k).^2 <= raio_circulo1^2;
% Círculo 2
circulo2 = (Xk - centro_k).^2 + (Yk - centro_k).^2 <= raio_circulo2^2;
% Quadrado 1
quadrado1 = zeros(tam_k, tam_k);
offset1 = floor(lado_quadrado1/2);
quadrado1(centro_k-offset1 : centro_k+offset1, centro_k-offset1 : centro_k+offset1) = 1;
% Quadrado 2
quadrado2 = zeros(tam_k, tam_k);
offset2 = floor(lado_quadrado2/2);
quadrado2(centro_k-offset2 : centro_k+offset2, centro_k-offset2 : centro_k+offset2) = 1;

% --- 2. CONFIGURAÇÃO DE DIRETÓRIOS (PRESERVADOS) ---
diretorio_principal = 'Imagens_Teste_Dissertacao_Gerador3';
imagem_dir = fullfile(diretorio_principal, 'imagens_aleatorias');
fft_dir = fullfile(diretorio_principal, 'transformadas_fourier');

conv_circulo_raio1_dir = fullfile(diretorio_principal, 'convolucoes', sprintf('circulo_raio%d', raio_circulo1));
conv_circulo_raio2_dir = fullfile(diretorio_principal, 'convolucoes', sprintf('circulo_raio%d', raio_circulo2));
conv_quadrado_lado1_dir = fullfile(diretorio_principal, 'convolucoes', sprintf('quadrado_lado%d', lado_quadrado1));
conv_quadrado_lado2_dir = fullfile(diretorio_principal, 'convolucoes', sprintf('quadrado_lado%d', lado_quadrado2));

fft_circulo_raio1_dir = fullfile(diretorio_principal, 'transformadas_fourier', sprintf('circulo_raio%d', raio_circulo1));
fft_circulo_raio2_dir = fullfile(diretorio_principal, 'transformadas_fourier', sprintf('circulo_raio%d', raio_circulo2));
fft_quadrado_lado1_dir = fullfile(diretorio_principal, 'transformadas_fourier', sprintf('quadrado_lado%d', lado_quadrado1));
fft_quadrado_lado2_dir = fullfile(diretorio_principal, 'transformadas_fourier', sprintf('quadrado_lado%d', lado_quadrado2));

% Criar pastas
warning('off', 'Octave:mkdir-exists');
mkdir(diretorio_principal); mkdir(imagem_dir); mkdir(fft_dir);
mkdir(conv_circulo_raio1_dir); mkdir(conv_circulo_raio2_dir);
mkdir(conv_quadrado_lado1_dir); mkdir(conv_quadrado_lado2_dir);
mkdir(fft_circulo_raio1_dir); mkdir(fft_circulo_raio2_dir);
mkdir(fft_quadrado_lado1_dir); mkdir(fft_quadrado_lado2_dir);

% --- 3. PROCESSAMENTO ---
for i = 1:num_imagens
    % Gerar imagem aleatória MAIOR (324x324)
    imagem_aleatoria = uint8(randi([0, 255], tam_input, tam_input));

    % Salvar imagem original (opcional: salvar apenas o recorte 300x300 para manter o padrão)
    imwrite(imagem_aleatoria(1:tam_final, 1:tam_final), fullfile(imagem_dir, sprintf('imagem_%d.png', i)));

    % Realizar convoluções com 'valid' (Resultado será exatamente 300x300)
    c_c1 = conv2(double(imagem_aleatoria), double(circulo1), 'valid');
    c_c2 = conv2(double(imagem_aleatoria), double(circulo2), 'valid');
    c_q1 = conv2(double(imagem_aleatoria), double(quadrado1), 'valid');
    c_q2 = conv2(double(imagem_aleatoria), double(quadrado2), 'valid');

    % Ajustar para o intervalo 0-255 e uint8
    conv_circulo_raio1 = uint8(255 * mat2gray(c_c1));
    conv_circulo_raio2 = uint8(255 * mat2gray(c_c2));
    conv_quadrado_lado1 = uint8(255 * mat2gray(c_q1));
    conv_quadrado_lado2 = uint8(255 * mat2gray(c_q2));

    % Salvar imagens convoluídas
    imwrite(conv_circulo_raio1, fullfile(conv_circulo_raio1_dir, sprintf('conv_circulo_raio%d_%d.png', raio_circulo1, i)));
    imwrite(conv_circulo_raio2, fullfile(conv_circulo_raio2_dir, sprintf('conv_circulo_raio%d_%d.png', raio_circulo2, i)));
    imwrite(conv_quadrado_lado1, fullfile(conv_quadrado_lado1_dir, sprintf('conv_quadrado_lado%d_%d.png', lado_quadrado1, i)));
    imwrite(conv_quadrado_lado2, fullfile(conv_quadrado_lado2_dir, sprintf('conv_quadrado_lado%d_%d.png', lado_quadrado2, i)));

    % --- Transformada de Fourier ---
    % Nota: Aplicamos a FFT sobre a imagem gerada (sem as bordas pretas)
    f_c1 = fftshift(fft2(double(conv_circulo_raio1)));
    f_c2 = fftshift(fft2(double(conv_circulo_raio2)));
    f_q1 = fftshift(fft2(double(conv_quadrado_lado1)));
    f_q2 = fftshift(fft2(double(conv_quadrado_lado2)));

    % Normalizar Magnitude Logarítmica para 0-255 uint8
    fft_log_c1 = uint8(255 * mat2gray(log(1 + abs(f_c1))));
    fft_log_c2 = uint8(255 * mat2gray(log(1 + abs(f_c2))));
    fft_log_q1 = uint8(255 * mat2gray(log(1 + abs(f_q1))));
    fft_log_q2 = uint8(255 * mat2gray(log(1 + abs(f_q2))));

    % Salvar FFTs
    imwrite(fft_log_c1, fullfile(fft_circulo_raio1_dir, sprintf('fft_circulo_raio%d_%d.png', raio_circulo1, i)));
    imwrite(fft_log_c2, fullfile(fft_circulo_raio2_dir, sprintf('fft_circulo_raio%d_%d.png', raio_circulo2, i)));
    imwrite(fft_log_q1, fullfile(fft_quadrado_lado1_dir, sprintf('fft_quadrado_lado%d_%d.png', lado_quadrado1, i)));
    imwrite(fft_log_q2, fullfile(fft_quadrado_lado2_dir, sprintf('fft_quadrado_lado%d_%d.png', lado_quadrado2, i)));
end

disp('Processamento concluído com sucesso!');
