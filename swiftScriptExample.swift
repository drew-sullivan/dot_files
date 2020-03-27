#!/usr/bin/swift // <-- Mandatory

// After completing your script, remember to make it executable by running:
// $ chmod +x <your_file_name>.swift
// And, run your script like so:
// $ ./<your_file_name>.swift '<arg_1>' '<arg_2>'

func fibonacci(_ n: Int) -> Int {
    if n <= 2 {
        return 1
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

let arg = CommandLine.arguments[1]
if let n = Int(arg) {
    print(fibonacci(n))
} else {
    print("Usage: fibonacci <n>")
}
