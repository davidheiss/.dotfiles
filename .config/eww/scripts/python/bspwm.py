import os
import process

def active():
    '''Check if bswpm is the current running window manager.'''
    return os.environ.get("DESKTOP_SESSION") == "bspwm"


def primary():
    '''Get the primary monitor.'''
    return process.run("bspc query -M -m primary --names")


def listen_report_event():
    ''' '''
    for message in process.open("bspc subscribe"):
        message = message.removeprefix("W")

        _iter = iter(message.split(":"))

        result = []
        try:
            while True:
                item = next(_iter)
                match item[0]:
                    case "m" | "M":
                        result.append({
                            "name": item[1:],
                            "focused": item[0].isupper(),
                            "workspaces": []
                        })
                    case "o" | "O" | "f" | "F" | "u" | "U":
                        result[-1]["workspaces"].append(
                            {
                                "name": item[1:],
                                "focused": item[0].isupper(),
                                "state": {
                                    "o": "occupied",
                                    "f": "free",
                                    "u": "urgent"
                                }[item[0].lower()]
                            }
                        )
                    case "L":
                        result[-1]["layout"] = {
                            "T": "tiled",
                            "M": "monocle",
                        }[item[1]]
                    case "T":
                        result[-1]["layout"] = {
                            "T": "tiled",
                            "P": "pseudo_tiled",
                            "F": "floating",
                            "=": "fullscreen",
                            "@": "multi",
                        }[item[1]]
                    case "G":
                        result[-1]["flags"] = [
                            {
                                "S": "sticky",
                                "P": "private",
                                "L": "locked",
                                "M": "marked"
                            }[c] for c in item[1:]
                        ]
                        pass
        except StopIteration:
            pass
        except Exception as e:
            print(message)
            print(item)
            raise e
        yield result
