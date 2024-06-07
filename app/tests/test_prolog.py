from app.tests import client


def test_prolog_test():
    response = client.get("/v1/prolog/test")
    assert response.status_code == 200
    assert response.json() == {"truth": True, "Y": 2}

