import pytest
from nameko.testing.services import worker_factory

from temp_messenger.service import KonnichiwaService, WebServer


@pytest.fixture
def custom_config():
    return {"AMQP_URI": "pyamqp://guest:guest@localhost"}


def test_konnichiwa():
    """sample of unit test"""

    service = worker_factory(KonnichiwaService)
    result = service.konnichiwa()
    assert result == "Konnichiwa!"


def test_root_http(web_session, container_factory, custom_config):
    """sample of integration test"""

    web_server = container_factory(WebServer, custom_config)
    konnichiwa = container_factory(KonnichiwaService, custom_config)
    web_server.start()
    konnichiwa.start()

    result = web_session.get("/konnichiwa")
    assert result.text == "Konnichiwa!"
