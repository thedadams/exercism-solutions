// Package weather provides the weather forecast for various cities.
package weather

var (
    // CurrentCondition holds the current weather condition.
	CurrentCondition string
    // CurrentLocation is the location for which the weather is forecasted.
	CurrentLocation  string
)

// Forecast sets the current location and conditions for weather forecats.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
