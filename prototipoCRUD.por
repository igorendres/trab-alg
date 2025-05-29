programa
{
    funcao inicio()
    {
        const inteiro LIMITE = 10
        const inteiro FORMAS_PAGAMENTO = 3
        cadeia nomes[LIMITE]
        inteiro quantidades[LIMITE]
        real precos[LIMITE]
        inteiro posicao = 0
        inteiro i = 0

        inteiro vendas[LIMITE][3]
        real totalVendasPorPagamento[FORMAS_PAGAMENTO]
        inteiro vendasDia = 0

	   inteiro perfil = 0

	   para (i=0; i<LIMITE; i++){
		nomes[i] = "VAZIO"
		quantidades[i] = -1
		precos[i] = -1.0
		}
	
        enquanto (perfil != 3) {
            escreva("\n===== MENU INICIAL =====\n")
            escreva("Bem-vindo à loja de periféricos!\n")
            escreva("O que você quer fazer?\n")
            escreva("1 - Controle de estoque\n")
            escreva("2 - Realização de venda\n")
            escreva("3 - Sair\n")
            
            leia(perfil)

            se (perfil == 1) {
                limpa()
                menuEstoque(nomes, quantidades, precos, posicao, vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
            }
            senao se (perfil == 2) {
                limpa()
                menuVenda(nomes, quantidades, precos, posicao, vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
            }
            senao se (perfil == 3) {
                limpa()
                escreva("Encerrando o sistema...\n")
            }
            senao {
                limpa()
                escreva("Opção inválida. Tente novamente.\n")
            }
        }
    }

	funcao menuEstoque(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro vendas[][], real totalVendasPorPagamento[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO){
	    inteiro opcao = 0
	
	    enquanto (opcao != 6) {
	        escreva("\n--- MENU DE CONTROLE DE ESTOQUE ---\n")
	        escreva("1 - Inserir item no sistema\n")
	        escreva("2 - Listar produtos\n")
	        escreva("3 - Alterar produto\n")
	        escreva("4 - Excluir produto\n")
	        escreva("5 - Relatório financeiro\n")
	        escreva("6 - Voltar ao menu inicial\n")
	        escreva("Escolha uma opção: ")
	        leia(opcao)
	
	        se (opcao == 1) {
                limpa()
	            inserirProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 2) {
                limpa()
	            listarProdutos(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 3) {
                limpa()
	            alterarProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 4) {
                limpa()
	            excluirProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 5) {
                limpa()
	            relatorioFinanceiro(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 6) {
                limpa()
	            escreva("Voltando ao menu inicial...\n")
	        }
	        senao {
                limpa()
	            escreva("Opção inválida. Tente novamente.\n")
	        }
	    }
	}


    funcao menuVenda(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro vendas[][], real totalVendasPorPagamento[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
	{
	    inteiro opcao = 0
	
	    enquanto (opcao != 5) {
	        escreva("\n--- MENU DE VENDAS ---\n")
	        escreva("1 - Iniciar caixa\n")
	        escreva("2 - Realizar venda\n")
	        escreva("3 - Listar produtos vendidos no dia\n")
	        escreva("4 - Totalizar vendas do dia\n")
	        escreva("5 - Voltar ao menu inicial\n")
	        escreva("Escolha uma opção: ")
	        leia(opcao)
	
	        se (opcao == 1) {
	            iniciarCaixa(vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 2) {
	            realizarVenda(nomes, quantidades, precos, vendas, totalVendasPorPagamento, vendasDia, posicao, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 3) {
	            listarVendasDoDia(vendas, nomes, precos, vendasDia, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 4) {
	            totalizarVendas(totalVendasPorPagamento, LIMITE, FORMAS_PAGAMENTO)
	        }
	        senao se (opcao == 5) {
	            escreva("Voltando ao menu inicial...\n")
	        }
	        senao {
	            escreva("Opção inválida. Tente novamente.\n")
	        }
	    }
	}

    funcao inserirProduto(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nome
        logico existe = falso
        escreva("\nDigite o nome do produto: ")
        leia(nome)

        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i] == nome) {
                existe = verdadeiro
                inteiro qtdNova
                escreva("Produto já existe. Digite quantidade a adicionar: ")
                leia(qtdNova)
                quantidades[i] = quantidades[i] + qtdNova
                escreva("Quantidade atualizada!\n")
                retorne
            }
        }

        se (posicao >= LIMITE) {
            escreva("Limite de produtos atingido!\n")
        } senao {
            nomes[posicao] = nome
            escreva("Digite a quantidade: ")
            leia(quantidades[posicao])
            escreva("Digite o preço unitário: ")
            leia(precos[posicao])
            posicao++
            escreva("Produto inserido com sucesso!\n")
        }
    }

    funcao listarProdutos(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        escreva("\n--- LISTA DE PRODUTOS ---\n")
        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i]!="VAZIO"){
                escreva("Nome: ", nomes[i], " | Quantidade: ", quantidades[i], " | Preço: R$ ", precos[i], "\n")
            }
        }
    }

    funcao alterarProduto(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nomeBusca
        escreva("\nDigite o nome do produto a alterar: ")
        leia(nomeBusca)

        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i] == nomeBusca) {
                escreva("Nova quantidade: ")
                leia(quantidades[i])
                escreva("Novo preço: ")
                leia(precos[i])
                escreva("Produto atualizado!\n")
                retorne
            }
        }
        escreva("Produto não encontrado!\n")
    }

    funcao excluirProduto(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nomeBusca
        escreva("\nDigite o nome do produto a excluir: ")
        leia(nomeBusca)

        para(inteiro i = 0; i < posicao; i++) {
            se (nomes[i] == nomeBusca) {
                para(inteiro j = i; j < posicao - 1; j++) {
                    nomes[j] = nomes[j+1]
                    quantidades[j] = quantidades[j+1]
                    precos[j] = precos[j+1]
                }
                posicao--
                escreva("Produto excluído com sucesso!\n")
                retorne
            }
        }
        escreva("Produto não encontrado!\n")
    }

    funcao relatorioFinanceiro(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        real total = 0
        escreva("\n--- RELATÓRIO FINANCEIRO ---\n")
        para(inteiro i = 0; i < posicao; i++) {
            real subtotal = quantidades[i] * precos[i]
            escreva("Produto: ", nomes[i], " | Total em estoque: R$ ", subtotal, "\n")
            total = total + subtotal
        }
        escreva("TOTAL GERAL EM ESTOQUE: R$ ", total, "\n")
    }

    funcao iniciarCaixa(inteiro vendas[][], real totais[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        para(inteiro i = 0; i < LIMITE; i++) {
            para(inteiro j = 0; j < 3; j++) {
                vendas[i][j] = 0
            }
        }
        para(inteiro i = 0; i < FORMAS_PAGAMENTO; i++) {
            totais[i] = 0
        }
        vendasDia = 0
        escreva("\nCaixa iniciado com sucesso!\n")
    }

    funcao realizarVenda(cadeia nomes[], inteiro quantidades[], real precos[], inteiro vendas[][], real totais[], inteiro vendasDia, inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nomeBusca
        inteiro indice, qtdVenda, forma
        logico existe = falso

        escreva("\n--- NOVA VENDA ---\n")

        faca {
            escreva("Digite o nome do produto (ou 'fim' para encerrar): ")
            leia(nomeBusca)

            se (nomeBusca == "fim") {
                pare
            }

            existe = falso
            para(indice = 0; indice < posicao; indice++) {
                se (nomes[indice] == nomeBusca) {
                    existe = verdadeiro
                    escreva("Quantidade disponível: ", quantidades[indice], "\n")
                    escreva("Digite a quantidade a vender: ")
                    leia(qtdVenda)

                    se (qtdVenda > quantidades[indice]) {
                        escreva("Quantidade insuficiente em estoque!\n")
                    } senao {
                        escreva("Forma de pagamento (0-Débito, 1-Crédito, 2-Dinheiro): ")
                        leia(forma)

                        vendas[vendasDia][0] = indice
                        vendas[vendasDia][1] = qtdVenda
                        vendas[vendasDia][2] = forma
                        vendasDia++

                        quantidades[indice] = quantidades[indice] - qtdVenda
                        totais[forma] = totais[forma] + (qtdVenda * precos[indice])

                        escreva("Venda registrada com sucesso!\n")
                    }
                }
            }

            se (nao existe) {
                escreva("Produto não encontrado.\n")
            }

        } enquanto(nomeBusca == "fim")
    }

    funcao listarVendasDoDia(inteiro vendas[][], cadeia nomes[], real precos[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        inteiro i, indice, qtd
        real valorTotal

        se (vendasDia == 0) {
            escreva("\nNenhuma venda registrada hoje.\n")
        } senao {
            escreva("\n--- PRODUTOS VENDIDOS HOJE ---\n")
            para(i = 0; i < vendasDia; i++) {
                indice = vendas[i][0]
                qtd = vendas[i][1]
                valorTotal = qtd * precos[indice]

                escreva("Produto: ", nomes[indice], " | Quantidade: ", qtd, " | Total: R$ ", valorTotal, "\n")
            }
        }
    }

    funcao totalizarVendas(real totais[], inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        escreva("\n--- TOTAL VENDAS POR FORMA DE PAGAMENTO ---\n")
        escreva("Débito:   R$ ", totais[0], "\n")
        escreva("Crédito:  R$ ", totais[1], "\n")
        escreva("Dinheiro: R$ ", totais[2], "\n")

        real totalGeral = totais[0] + totais[1] + totais[2]
        escreva("Total geral do dia: R$ ", totalGeral, "\n")
    }

//deixar dinamico, produtos acima de x
    funcao produtosAcimaDe100(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        logico encontrou = falso
        escreva("\n--- PRODUTOS COM VALOR ACIMA DE R$ 100,00 ---\n")

        para(inteiro i = 0; i < posicao; i++) {
            se (precos[i] > 100) {
                escreva("Nome: ", nomes[i], "\n")
                escreva("Quantidade: ", quantidades[i], "\n")
                escreva("Preço: R$ ", precos[i], "\n")
                escreva("--------------------------\n")
                encontrou = verdadeiro
            }
        }

        se (nao encontrou) {
            escreva("Nenhum produto encontrado com valor acima de R$ 100,00.\n")
        }
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 249; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomes, 124, 33, 5}-{quantidades, 124, 50, 11}-{nomes, 164, 33, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */