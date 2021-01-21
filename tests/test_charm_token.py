from brownie import reverts


def test_charm_token(CharmToken, accounts):
    deployer, user = accounts[:2]
    charm = deployer.deploy(CharmToken)
    assert charm.name() == "Charm"
    assert charm.symbol() == "CHARM"
    assert charm.decimals() == 18
    assert charm.totalSupply() == 1e8 * 1e18
    assert charm.balanceOf(deployer) == 1e8 * 1e18
