#!/usr/bin/env python3
import argparse

from jinja2 import Environment, PackageLoader


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--name", default="World", help="name to great")
    args = parser.parse_args()

    loader = PackageLoader("examples.python.hello_world", "templates")
    template = Environment(loader=loader).get_template("hello")
    print(template.render(name=args.name))


if __name__ == "__main__":
    main()
