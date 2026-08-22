package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	// Implement the procedure.
	return cast(f64)seconds / 31_557_600 / period(planet)
}

period :: proc(planet: Planet) -> f64 {
    switch planet {
        case .Mercury:
            return 0.2408467
        case .Venus:
            return 0.61519726
        case .Earth:
            return 1.0
        case .Mars:
            return 1.8808158
        case .Jupiter:
            return 11.862615
        case .Saturn:
            return 29.447498
        case .Uranus:
            return 84.016846
        case .Neptune:
            return 164.79132
    }

    return 0.0
}
