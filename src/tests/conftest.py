import pytest
from fastapi.testclient import TestClient

from app.main import app


@pytest.fixture
def test_app():
    client = TestClient(app)
    yield client  # testing happens here
