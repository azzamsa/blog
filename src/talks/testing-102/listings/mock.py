def buckets(resource):
    """Print all bucket with specified attribute."""
    all_buckets = bucket_lib.buckets(resource)
    for bucket in all_buckets:
        click.secho(f"{bucket.creation_date:%Y-%m-%d %H:%M:%S} {bucket.name}")


def fake_buckets(resource):
    bucket = mock.Mock()
    bucket.name = "bucket-one"
    bucket.creation_date = datetime(2019, 9, 24, 1, 1, 0, 0)
    return bucket


def test_ls(monkeypatch, resource):
    monkeypatch.setattr(obs.libs.bucket, "buckets", fake_buckets)
    result = runner.invoke(cli, ["storage", "ls"])
    assert result.output == (f"2019-09-24 01:01:00 bucket-one\n")
