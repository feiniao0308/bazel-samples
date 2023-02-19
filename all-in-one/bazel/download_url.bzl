def _download_url(repoctx):
  # repoctx has `download` bundled in for downloading,
  # we're using `execute` to show generation can happen in any form
  repoctx.report_progress("downloading: " + repoctx.attr.url)

  repoctx.file(
    "BUILD",
    content='exports_files(["data"])',
    executable=False)

  exec_result = repoctx.execute([
    "curl", "-o", "data", repoctx.attr.url
  ])

  if exec_result.return_code != 0:
    fail("Unable to download {url}\nOUT: {stdout}\nERR: {stderr}".format(
      url=repoctx.attr.url,
      stdout=exec_result.stdout,
      stderr=exec_result.stderr,
    ))

download_url = repository_rule(
  implementation = _download_url,
  attrs = {
    "url": attr.string(mandatory=True),
  }
)

