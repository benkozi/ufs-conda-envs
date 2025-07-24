import subprocess

from ufs_conda.core import EnvKey, CreateContext, Platform


def test_which_python_output(env_key: EnvKey) -> None:
    ctx = CreateContext(env_key=env_key, platform=Platform.docker)
    command = (
        ". /usr/share/lmod/lmod/init/bash && "
        f"module use {ctx.modulefiles_install_dir} && "
        f"module load python-ufs-{env_key.value} && "
        "which python"
    )
    print(f"{command=}")
    result = subprocess.check_output(
        command,
        shell=True
    )
    actual_output = result.decode("utf-8").strip()
    assert actual_output == str(ctx.prepend_path / "python")
