from src.main import has_symbol


def test_has_symbol():
    assert has_symbol("MNAHNMABNMM") == True
    assert has_symbol("ABAAB") == True
    assert has_symbol("AB") == False
    assert has_symbol("ABA") == True
    assert has_symbol("12AA3BA") == False
    assert has_symbol("12AB3BA") == True
    assert has_symbol("12AB3BB") == False
    assert has_symbol("XYZXYZXY") == False
