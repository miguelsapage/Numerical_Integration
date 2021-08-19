%{
Miguel Sapage (96291)
Matemática Computacional
2020/2021

O programa cálcula o majorante do erro de integração da função
da distribuição normal reduzida num intervalo de 0 a b, sendo b o limite
superior escolhido pelo utilizador.
O erro é calculado para um diferente número de sub-intervalos fixados
previamente, sendo estes entre 2 e 10. (Apresentado o gráfico do
resultado)
%}

clear
clc

%declaração da 2ª derivada da função da distribuição normal
funcD=@(x) -(1/(sqrt(2*pi)))*(-exp(-x.^2/2)*x.^2+exp(-x.^2/2));

%declaração da função para cálculo do erro
err_pmc =@(n,b) (b.^3/(24*n.^2)*funcD(b));

%número de subintervalos de integração
n_sint=[2 3 4 5 6 7 8 9 10];

%array com os erros
err = zeros(1,7);

b = input("Escolha um limite superior: "); %limite superior do intervalo de integração
i = 1;

%cálculo do erro para cada n
for n = n_sint
    err(i) = abs(err_pmc(n,b));
    i = i + 1;
end

figure
plot(n_sint(1,:),err(1,:))
title('Majorante do erro absoluto de integração');
xlabel('Nº de sub-intervalos');
ylabel('|E|');