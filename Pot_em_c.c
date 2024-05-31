#include <stdio.h>

// Função para calcular a potência de 2
int Potencia2(int expoente) {
    if (expoente == 0) {
        return 1;
    }
    return 2 << (expoente - 1);  // 2 elevado ao expoente é o mesmo que 2 * 2^(expoente-1)
}

// Função para multiplicar dois valores
int Multi(int x, int potencia) {
    return x * potencia;
}

int main() {
    int base = 2;  // base 2 sempre
    int expoente;  // expoente que o usuário irá inserir
    int resultadoPotencia;  // resultado da potência
    int x;  // valor X que o usuário irá inserir para multiplicar
    int resultadoMultiplicacao;  // resultado da multiplicação

    // Pergunta o expoente ao usuário
    printf("A qual expoente 2 sera elevado? ");
    scanf("%d", &expoente);

    // Calcula a potência de 2 elevado ao expoente
    resultadoPotencia = Potencia2(expoente);

    // Exibe o resultado da potência
    printf("A potencia de 2 elevado ao expoente escolhido eh: %d\n", resultadoPotencia);

    // Pergunta o valor X ao usuário
    printf("A qual valor este resultado sera multiplicado? ");
    scanf("%d", &x);

    // Calcula a multiplicação de X pelo resultado da potência
    resultadoMultiplicacao = Multi(x, resultadoPotencia);

    // Exibe o resultado da multiplicação
    printf("X multiplicado pelo resultado de 2 elevado ao expoente eh: %d\n", resultadoMultiplicacao);
    return 0;
}
