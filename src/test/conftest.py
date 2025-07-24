from typing import Any

import pytest


def pytest_addoption(parser: Any) -> None:
    parser.addoption(
        "--expected-output",
        action="store",
        help="Expected Python executable path",
        default="",
    )


@pytest.fixture
def expected_output(request: Any) -> str:
    return request.config.getoption("--expected-output")