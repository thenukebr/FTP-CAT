# FTP-CAT

# Antes de usá-lo você deve instalar os módulos necessários:

cpan install Net::FTP
cpan install Term::ANSIColor


# Ele crackeia serviços FTP, ele tem duas opções de bruteforce por enquanto:

- Bruteforce por wordlist
- Bruteforce em tempo-real (O programa vai gerando os números em forma crescente de acordo com o especificado (mínimo e máximo) )

# Analise do desenvolvedor
Quanto tempo leva ? Depende do serviço de resposta do host FTP, em um site que eu testei o host FTP do site demorava 3 segundos pra responder que a senha estava incorreta.

# Utilização
Forma cronológica para perfeito funcionamento

perl ftp-cat.pl <host_or_ip> <user> (Padrão é anonymous) <wordlist> (Caso não use, o programa irá fazer método em tempo-real)
