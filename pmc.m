%{
Miguel Sapage (96291)
Matemática Computacional
2020/2021

O programa cria uma tabela dos valores tabelados do integral da função da distribuição
normal reduzida no intervalo ]-inf,z] com passos de h=0.01. (Apresentados
valor quando z está compreendido no intervalo [0,3.49])
Calcula-se através do método do ponto médio composto o integral no intervalo
[0,z] e posteriormente adiciona-se o valor do integral no intervalo
]-inf,0], sendo este igual a 0.5.
%}

clear
clc

%declaração da função da distribuição normal
func=@(x) (1/(sqrt(2*pi)))*exp(-x.^2/2);

%array de zeros para fazer a tabela
table = zeros(35, 10);

h = 0.01;
p = 0;
sum_pmc = 0; %acumula o somatório de f nos diferentes pontos médios de cada intervalo

for i = 1:35
   for j = 1:10
       %o primeiro valor é diretamente definido como 0.5
       if i == 1 && j == 1
           table(i,j) = 0.5;
           continue
       end
       sum_pmc = sum_pmc + func(p+(h/2));
       table(i,j) = h*sum_pmc + 0.5; %aplicação da regra do ponto médio composto para cada entrada na tabela adicionando o integral até 0
       p = p + h;
   end
end

fprintf("Valores tabelados para a distribuição normal:\n")
disp(table)