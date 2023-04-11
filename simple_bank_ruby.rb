

class Conta 
  attr_reader :nome
  attr_reader :saldo

  def initialize(nome, saldo = 100)
    @nome = nome
    @saldo = saldo
  end

  private
    def pin
        @pin = 1234
    end
    def erro_pin
        return "Acesso negado: o PIN está incorreto."
    end

  public
    def display_saldo(numero_pin)
      if numero_pin == pin
        puts "Saldo: R$#{@saldo}"
      else
        puts erro_pin
      end
    end
    def retirar(numero_pin, quantia)
      if numero_pin == pin
        @saldo -= quantia
        puts "Retirado R$#{quantia}. Novo saldo: R$#{@saldo}."
      else
        puts erro_pin
      end
    end
    def depositar(numero_pin, nova_quantia)
      if numero_pin == pin
        @saldo += nova_quantia
        puts "Depositar R$#{nova_quantia}. Novo saldo: R$#{@saldo}"
      else
        puts erro_pin
      end
    end
end


#A classe ContaPoupanca tem a herança da classe Conta
class ContaPoupanca < Conta
  def display_poupanca(numero_pin)
    if numero_pin == pin
      puts "Saldo da conta poupança: R$#{@saldo}"
    else
      puts erro_pin
    end
  end
end

#Checando a conta, onde o primeiro parâmetro é 'user' e o no segundo parâmetro é o saldo da conta
checar_conta = Conta.new("Gabs", 5_001_000)
checar_conta.display_saldo(1234)
checar_conta.retirar(1234, 500)
checar_conta.depositar(1234, 1000)

#Checando a conta poupança, onde o primeiro parâmetro é nome do usuário e o segundo parâmetro é o saldo da conta, utilizando
#a herença da classe 'Conta' para a 'ContaPoupanca'.
checar_poupanca = ContaPoupanca.new("Usuario", 1_000_000)
checar_poupanca.display_poupanca(1234)