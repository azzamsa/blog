def gen_random_name(prefix):
    """Take random UUID and append specified prefix."""
    return f"{prefix}-{str(uuid.uuid4())[:13]}"


def test_random(self, monkeypatch):
    monkeypatch.setattr(uuid, "uuid4", lambda: "71e43e94-c10d")
    assert bucket.gen_random_name("awesome") == f"awesome-71e43e94-c10d"
