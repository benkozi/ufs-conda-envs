import subprocess
import pytest


def test_which_python_output():
    command = (
        ". /usr/share/lmod/lmod/init/bash && "
        "module use /opt/conda/modulefiles && "
        "module load python-ufs-default && "
        "which python"
    )
    expected_output = "/opt/conda/bin/python"
    result = subprocess.check_output(
        command,
        shell=True
    )
    actual_output = result.decode("utf-8").strip()
    assert actual_output == expected_output
