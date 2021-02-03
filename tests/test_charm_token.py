from brownie import reverts


def test_charm_token(CharmToken, accounts):
    deployer, treasury = accounts[:2]
    charm = deployer.deploy(CharmToken, treasury)
    assert charm.name() == "Charm"
    assert charm.symbol() == "CHARM"
    assert charm.decimals() == 18
    assert charm.totalSupply() == charm.balanceOf(treasury) == 1e8 * 1e18
