# Start-Stop-Dev-Services

If you aim to use it, I'd recommend to adapt the `$serviceNames` to your needs. This is my current usage:

`$serviceNames = ('MSSQLSERVER', 'RabbitMQ', 'com.docker.service')`

I also created shortcuts on my desktop, to have them easily accessible, using the following target:

`C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Foo\Bar\XXXX-services.ps1" -WindowsStyle Hidden`

I wrote a little bit about this here: <https://davidsonsousa.net/blog/post/using-powershell-scripts-to-start-and-stop-windows-services>
