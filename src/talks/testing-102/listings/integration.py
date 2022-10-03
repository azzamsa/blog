def test_mb(monkeypatch, plain_auth):
    monkeypatch.setattr(obs.libs.auth, "strtobool", lambda http: True)
    monkeypatch.setattr(requests, "put", fake_mb)
    monkeypatch.setattr(obs.libs.utils, "check_plain", lambda response: None)

    runner = CliRunner()
    result = runner.invoke(cli, ["storage", "mb", "bucket-one", "--random"])

    assert result.output == f'Bucket "bucket-one" created successfully\n'
