from brownie import reverts


def test_testnet_token(TestnetToken, accounts):
    deployer, user, user2 = accounts[:3]
    token = deployer.deploy(
        TestnetToken,
        "name",
        "symbol",
        12,
        1e20,
    )
    assert token.name() == "name"
    assert token.symbol() == "symbol"
    assert token.decimals() == 12
    assert token.mintAmount() == 1e20

    assert token.balanceOf(user) == 0
    token.mint(user, {"from": user2})
    assert token.balanceOf(user) == 1e20
