// Trabalho Final de Ana Claudia Wurch Seibert e Igor de Medeiros Endres
// TADS 2025/1 - Professor: Ìgor Lorenzato Almeida

/* feedback igor: 
    - sugestão: criar outra função de busca personalizada, que busca pela quantidade:
        ex: digitar um numero de quantidade e buscar os produtos que tem menos que esse valor,
        para que o usuário saiba quais produtos fazer estoque*/
// atualizar a função alterarProduto para que a mudanca do produto seja flexivel

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

            escolha (perfil){
                caso 1:
                    limpa()
                    menuEstoque(nomes, quantidades, precos, posicao, vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 2:
                    limpa()
                    menuVenda(nomes, quantidades, precos, posicao, vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 3: 
                    limpa()
                    escreva("Encerrando o sistema...\n")
                    pare
                
                caso contrario:
                    limpa()
                    escreva("Opção inválida. Tente novamente.\n")
            }
        }
    }

	funcao menuEstoque(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro vendas[][], real totalVendasPorPagamento[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO){
	    inteiro opcao = 0
	    enquanto (opcao != 7) {
	        escreva("\n--- MENU DE CONTROLE DE ESTOQUE ---\n")
	        escreva("1 - Inserir item no sistema\n")
	        escreva("2 - Listar produtos\n")
	        escreva("3 - Alterar produto\n")
	        escreva("4 - Excluir produto\n")
	        escreva("5 - Relatório financeiro\n")
	        escreva("6 - Consultar produtos por valor\n")
            escreva("7 - Voltar ao menu inicial\n")
	        escreva("Escolha uma opção: ")
	        leia(opcao)
	
            escolha (opcao){
                caso 1:
                    limpa()
                    posicao = inserirProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 2:
                    limpa()
                    listarProdutos(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare
                
                caso 3:
                    limpa()
                    alterarProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare
                
                caso 4:
                    limpa()
                    excluirProduto(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare
                
                caso 5:
                    limpa()
                    relatorioFinanceiro(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare 
                
                caso 6:
                    limpa()
                    consultaProdutosPorValorMinimo(nomes, quantidades, precos, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 7:
                    limpa()
                    escreva("Voltando ao menu inicial...\n")            
                    pare

                caso contrario:
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
	
            escolha (opcao){
                caso 1:
                    vendasDia = iniciarCaixa(vendas, totalVendasPorPagamento, vendasDia, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 2:
                    vendasDia = realizarVenda(nomes, quantidades, precos, vendas, totalVendasPorPagamento, vendasDia, posicao, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 3:
                    listarVendasDoDia(vendas, nomes, precos, vendasDia, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 4:
                    totalizarVendas(totalVendasPorPagamento, LIMITE, FORMAS_PAGAMENTO)
                    pare

                caso 5:
                    escreva("Voltando ao menu inicial...\n")
                    pare
                
                caso contrario:
                    escreva("Opção inválida. Tente novamente.\n")
            }
	    }
	}

    funcao inteiro inserirProduto(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nome
        logico existe = falso
        inteiro qtdNova
        escreva("\nDigite o nome do produto: ")
        leia(nome)

        para(inteiro i = 0; i < posicao; i++) {
            se (nomes[i] == nome) {
                existe = verdadeiro
                escreva("Produto já existe. Digite quantidade a adicionar: ")
                leia(qtdNova)
                quantidades[i] = quantidades[i] + qtdNova
                escreva("Quantidade atualizada!\n")
                retorne posicao
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

        retorne posicao
    }

    funcao listarProdutos(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
    	inteiro produtosEncontrados = 0
        escreva("\n--- LISTA DE PRODUTOS ---\n")
        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i]!="VAZIO"){
                escreva("Nome: ", nomes[i], " | Quantidade: ", quantidades[i], " | Preço: R$ ", precos[i], "\n")
                produtosEncontrados = produtosEncontrados + 1
            }
        }
        se (produtosEncontrados == 0) {
        	escreva("Nenhum produto cadastrado no sistema!")
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

        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i] == nomeBusca) {
                nomes[i] = "VAZIO"
				quantidades[i] = -1
				precos[i] = -1.0
	
				escreva("Produto excluído com sucesso.\n")
                retorne
            }
        }
        escreva("Produto não encontrado!\n")
    }

    funcao relatorioFinanceiro(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        real total = 0
        escreva("\n--- RELATÓRIO FINANCEIRO ---\n")
        para(inteiro i = 0; i < LIMITE; i++) {
            se (nomes[i]!="VAZIO"){
                real subtotal = quantidades[i] * precos[i]
                escreva("Produto: ", nomes[i], " | Total em estoque: R$ ", subtotal, "\n")
                total = total + subtotal
            }
        }
        escreva("TOTAL GERAL EM ESTOQUE: R$ ", total, "\n")
    }

    funcao consultaProdutosPorValorMinimo(cadeia nomes[], inteiro quantidades[], real precos[], inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        real valorMinimo
        escreva("Digite o valor mínimo para listar os produtos: R$ ")
        leia(valorMinimo)
        limpa()

        logico encontrou = falso
        escreva("\n--- PRODUTOS COM VALOR ACIMA DE R$ ", valorMinimo, " ---\n\n")

        para(inteiro i = 0; i < posicao; i++) {
            se (precos[i] >= valorMinimo) {
                escreva("Nome: ", nomes[i], "\n")
                escreva("Quantidade em estoque: ", quantidades[i], "\n")
                escreva("Preço: R$ ", precos[i], "\n")
                escreva("------------------------------\n")
                encontrou = verdadeiro
            }
        }

        se (nao encontrou) {
            escreva("Nenhum produto encontrado com valor igual ou acima de R$ ", valorMinimo, ".\n")
        }
    }

    funcao inteiro iniciarCaixa(inteiro vendas[][], real totalVendasPorPagamento[], inteiro vendasDia, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        para(inteiro i = 0; i < LIMITE; i++) {
            vendas[i][0] = -1
            vendas[i][1] = -1
            vendas[i][2] = -1
        }
        para(inteiro i = 0; i < FORMAS_PAGAMENTO; i++) {
            totalVendasPorPagamento[i] = 0
        }
        vendasDia = 0
        escreva("\nCaixa iniciado com sucesso!\n")
        retorne vendasDia
    }

    funcao inteiro realizarVenda(cadeia nomes[], inteiro quantidades[], real precos[], inteiro vendas[][], real totalVendasPorPagamento[], inteiro vendasDia, inteiro posicao, inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        cadeia nomeBusca
        inteiro i, qtdVenda, forma
        logico existe = falso

        escreva("\n--- NOVA VENDA ---\n")

        faca {
            escreva("Digite o nome do produto (ou 'fim' para encerrar): ")
            leia(nomeBusca)

            se (nomeBusca == "fim") {
                pare
            }

            existe = falso
            para(i = 0; i < LIMITE; i++) {
                se (nomes[i] == nomeBusca) {
                    existe = verdadeiro
                    escreva("Quantidade disponível: ", quantidades[i], "\n")
                    escreva("Digite a quantidade a vender: ")
                    leia(qtdVenda)
                    
                    se (qtdVenda > quantidades[i] ou quantidades[i] == 0) {
                        escreva("Quantidade insuficiente em estoque!\n")
                    } senao {
                        escreva("Forma de pagamento (0-Débito, 1-Crédito, 2-Dinheiro): ")
                        leia(forma)

                        vendas[vendasDia][0] = i
                        vendas[vendasDia][1] = qtdVenda
                        vendas[vendasDia][2] = forma
                        vendasDia++

                        quantidades[i] = quantidades[i] - qtdVenda
                        totalVendasPorPagamento[forma] = totalVendasPorPagamento[forma] + (qtdVenda * precos[i])

                        escreva("Venda registrada com sucesso!\n")
                    }
                }
            }

            se (nao existe) {
                escreva("Produto não encontrado.\n")
            }

        } enquanto(nomeBusca == "fim")

        retorne vendasDia
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

    funcao totalizarVendas(real totalVendasPorPagamento[], inteiro LIMITE, inteiro FORMAS_PAGAMENTO)
    {
        real totalGeral
        escreva("\n--- TOTAL VENDAS POR FORMA DE PAGAMENTO ---\n")
        escreva("Débito:   R$ ", totalVendasPorPagamento[0], "\n")
        escreva("Crédito:  R$ ", totalVendasPorPagamento[1], "\n")
        escreva("Dinheiro: R$ ", totalVendasPorPagamento[2], "\n")

        totalGeral = totalVendasPorPagamento[0] + totalVendasPorPagamento[1] + totalVendasPorPagamento[2]
        escreva("Total geral do dia: R$ ", totalGeral, "\n")
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2303; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomes, 10, 15, 5}-{quantidades, 11, 16, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */