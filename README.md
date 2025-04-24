# LogImport plugin for Beets

This [beets] plugin adds logging of the destination paths when you import tracks.

### Installtion

Install the plugin into beets' Python with

    pip install beets-logimport

(or the respective equivialent if you use e.g. pipx).

### Usage

Add the `logimport` plugin to your config. Then the destination paths of your imported tracks are logged. 

By default the tracks  are logged under the `INFO` level. This logging level is (for the `import` command) only emitted to stdout with the `--verbose` option.

If you want to see the destination paths without `--verbose`, you can set `logimport`'s configuration option `atlevel`:

```
logimport:
    atlevel: warning
```

This will set the logging level of the track destinations to `WARNING`. This level is emitted without `--verbose`.

  [beets]: https://beets.io
