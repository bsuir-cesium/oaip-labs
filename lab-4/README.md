# oaip-4

Запуск тестов python-версии лабы
```
python -m venv venv
source venv/bin/activate
make install
make test-p
make run-p
```

Для работы с Delphi необходимо установить компилятор objectpascal'я, установить в коде длину последовательности символов и выбрать метод её заполнения
```
brew install fpc
make run-d
```