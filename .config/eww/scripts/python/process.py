import subprocess


def run(cmd: str):
    return subprocess.run(
        cmd.split(" "),
        encoding="utf-8",
        capture_output=True
    ).stdout.removesuffix("\n")


def open(cmd: str):
    return map(
        lambda x: x.removesuffix("\n"),
        subprocess.Popen(
            cmd.split(" "),
            stdout=subprocess.PIPE,
            encoding="utf-8"
        ).stdout  # type: ignore
    )
