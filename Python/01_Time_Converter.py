minutes = int(input("Enter minutes: "))

hours = minutes // 60
remaining_minutes = minutes % 60

if hours > 0:
    print(hours, "hrs", remaining_minutes, "minutes")
else:
    print(remaining_minutes, "minutes")