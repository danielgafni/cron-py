from cron._core import Schedule

__all__ = ["Schedule"]


def main() -> None:
    schedule = Schedule("0   30   9,12,15     1,15       May-Aug  Mon,Wed,Fri  2018/2")
    print(schedule.upcoming("Europe/Moscow"))
    print(schedule.upcoming("Europe/Moscow"))


if __name__ == "__main__":
    main()
