import Foundation

// MARK: - ASCII Image Playground

// Simple ASCII art of a smiley face
let asciiArt = [
    "  *****  ",
    " *     * ",
    "*  o o  *",
    "*   ^   *",
    "* \\___/ *",
    " *     * ",
    "  *****  "
]

// Function to print the ASCII image
func showASCIIArt(art: [String]) {
    for line in art {
        print(line)
    }
}

// Display the image
showASCIIArt(art: asciiArt)

