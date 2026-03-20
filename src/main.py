def has_symbol(input_string: str) -> bool:
    s: list[str] = []
    for symbol in input_string:
        s.append(symbol)
    result: bool = False
    result_for_symbol: bool = False
    next_appear: int
    false_symbols: list[str] = []
    i: int
    j: int
    k: int

    for i in range(0, len(s) - 1):
        if s[i] in false_symbols:
            continue
        next_appear = i
        result_for_symbol = False
        for j in range(i + 1, len(s)):
            if s[i] == s[j]:
                if j - next_appear > 1:
                    for k in range(next_appear + 1, j):
                        if (s[k] == "A") or (s[k] == "B"):
                            result_for_symbol = True
                            break
                else:
                    result_for_symbol = False
                    false_symbols.append(s[i])
                    break
                next_appear = j
        if result_for_symbol:
            result = True
            break
    return result


def main():
    input_string = input("Введите последовательность символов: ")

    if has_symbol(input_string):
        print("Данная последовательность СОДЕРЖИТ специальный символ")
    else:
        print("Данная последовательность НЕ СОДЕРЖИТ специальный символ")


if __name__ == "__main__":
    main()
