from typing import Any

import pytest

from ufs_conda.core import EnvKey


def pytest_addoption(parser: Any) -> None:
    parser.addoption(
        "--env-key",
        action="store",
        help=str(tuple(EnvKey)),
        default="",
    )


@pytest.fixture
def env_key(request: Any) -> EnvKey:
    return EnvKey(request.config.getoption("--env-key"))