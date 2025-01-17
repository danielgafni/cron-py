from cron import Schedule


def test_schedule_upcoming() -> None:
    assert (
        str(
            Schedule(
                "0   30   9,12,15     1,15       May-Aug  Mon,Wed,Fri  2018/2"
            ).upcoming("Europe/Moscow")
        )
        == "2026-05-01 09:30:00+03:00"
    )
