import subprocess

from ufs_conda.core import EnvKey, CreateContext, Platform


def test_which_python_output(env_key: EnvKey) -> None:
    command = (
        ". /usr/share/lmod/lmod/init/bash && "
        "module use /opt/conda/modulefiles && "
        f"module load python-ufs-{env_key.value} && "
        "which python"
    )
    result = subprocess.check_output(
        command,
        shell=True
    )
    actual_output = result.decode("utf-8").strip()
    ctx = CreateContext(env_key=env_key, platform=Platform.docker)
    assert actual_output == ctx.prepend_path / "python"
