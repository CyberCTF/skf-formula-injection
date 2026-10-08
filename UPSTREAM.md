# Upstream

| | |
| --- | --- |
| Project | OWASP Security Knowledge Framework labs (SKF labs) |
| Repository | https://github.com/blabla1337/skf-labs |
| Lab | `python/Formula-injection` (Python) |
| Version | master (SKF labs has no releases) |
| Commit | 35199b6f49658b75f860530c0f09b91e985198aa |
| Licence | Apache-2.0 |

| Here | SKF labs path |
| --- | --- |
| `build/web/app/` | [`python/Formula-injection`](https://github.com/blabla1337/skf-labs/tree/35199b6f49658b75f860530c0f09b91e985198aa/python/Formula-injection) |

The vendored folder is that commit's lab folder, unchanged, without its Git history.

`build/web/Dockerfile` is the lab's Dockerfile with `COPY ./` changed to `COPY app/`, and: pip installs with `build/web/constraints.txt` (Flask-Excel and the pyexcel packages, unpinned upstream, pinned to their versions of 2022-01-24, the date of the lab's `requirements.txt`) and also installs `pyexcel-xls`, the plug-in the xls export needs: without it the lab's own `/pages/export` answers 500 (`OSError: No content, file name. Nothing is given`).

To update, replace the vendored folder with a newer SKF labs commit, then change this file.
