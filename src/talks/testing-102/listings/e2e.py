def test_mb(monkeypatch, plain_auth):

    runner = CliRunner()
    result = runner.invoke(cli, ["storage", "mb", "bucket-one", "--random"])

    assert result.output == f'Bucket "bucket-one" created successfully\n'
