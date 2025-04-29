import Foundation

// Variable: character to use in text art
let symbol = "*"

// Function: Generates a pyramid pattern
func drawPyramid(height: Int) {
    for i in 1...height {
        let spaces = String(repeating: " ", count: height - i)
        let symbols = String(repeating: symbol, count: 2 * i - 1)
        print(spaces + symbols)
    }
}

// Call the function with a height variable
let pyramidHeight = 5
drawPyramid(height: pyramidHeight)

