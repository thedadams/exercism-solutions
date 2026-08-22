package leap

is_leap_year :: proc(year: int) -> bool {
	switch {
        case year % 400 == 0:
            return true
        case year % 100 == 0:
            return false
        case:
            return year % 4 == 0
    }
}
