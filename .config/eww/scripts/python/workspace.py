#!/bin/python

import bspwm
import json
import argparse


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--primary", action="store_true")

    args = parser.parse_args()

    if bspwm.active():
        primary = None
        if args.primary:
            primary = bspwm.primary()
        for report in bspwm.listen_report_event():
            if args.primary:
                for monitor in report:
                    if monitor["name"] == primary:
                        print(
                            json.dumps(monitor),
                            flush=True
                        )
                        break
            else:
                print(
                    json.dumps(report),
                    flush=True
                )
