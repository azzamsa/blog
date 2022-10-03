def fake_get_objects(self, resource, bucket, prefix):
    return {"Contents": [{"Key": "foo.png"}], "CommonPrefixes": [{"Prefix": "a/b/"}]}


def test_is_exists(self, monkeypatch):
    monkeypatch.setattr("get_objects", self.fake_get_objects)

    assert is_exists(resource, "bucket-a", "foo.png") is True
    assert is_exists(resource, "bucket-a", "bar.png") is False
