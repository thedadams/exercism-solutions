package two_fer

import "core:fmt"

two_fer :: proc(name: string = "") -> string {
	n := name
    if n == "" {
        n = "you"
    }

    return fmt.aprintf("One for %s, one for me.", n)
}
