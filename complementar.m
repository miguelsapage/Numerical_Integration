%{
Miguel Sapage (96291)
Matemática Computacional
2020/2021

O programa cria uma tabela dos valores complementares dos valores tabelados
da função da distribuição normal reduzida no intervalo ]-inf,z] com passos de h=0.01. (Apresentados
valor quando z está compreendido no intervalo [3,7.99])
Este script suporta-se de outro script ("pmc.m") que deverá estar no mesmo
diretório deste.
Para obter o valor complementar é calculada a integração aproximada pelo
método do ponto médio composto e seguidamente aplicada a fórmula:
F(-z) = 1 - F(z)
%}

clear
clc

pmc
clearvars -except table
int3 = table(31,1);

%declaração da função da distribuição normal
func=@(x) (1/(sqrt(2*pi)))*exp(-x.^2/2);

%array de zeros para fazer a tabela
table2 = zeros(51, 10);

h = 0.01;
p = 3;
sum_pmc = 0;

%integração pela regra do ponto médio para volres entre 3 e 7,99
for i = 1:51
   for j = 1:10
       if i == 1 && j == 1
           table2(i,j) = int3;
           continue
       end
       sum_pmc = sum_pmc + func(p+(h/2));
       table2(i,j) = h*sum_pmc + int3;
       p = p + h;
   end
end

%aplicação de F(-x) = 1 - F(x) para obeter o complementar de cada entrada
for i = 1:51
   for j = 1:10
       table2(i,j) = 1 - table2(i,j);
   end
end

fprintf("Valores complementares dos valores tabelados para a distribuição normal:\n")
format shortE
disp(table2)
format short