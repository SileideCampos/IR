# IR
Controlando dispositivos com receptor infravermelho

Com esses códigos é possível controlar dispositivos que possuam sensor receptor de infravermelho, como os televisores, aparelhos de TV  a cabo, ar condicionado, fitas led, etc.

O código do delphi é o responsável por conectar com a esp ou qqr placa microcontrolada via wifi e enviar os comandos para a minha M5Stick.
O código da pasta Esp32 (IDE Arduino) é o responsável por realizar o envio dos comandos recibidos do aplicativo e enviar, via sensor emissor Infravermelho, para os dispositivos e controlá-los.
