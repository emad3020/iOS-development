



for circle in 0..<10 {
    for triangle in 0..<10 {
        if circle + triangle == 8 {
            if circle - triangle == 4 {
                print("circle = \(circle)")
                print("triangele = \(triangle)")
            }
        }
        
    }
}

for star in 0..<10 {
    for square in 0..<10 {
        if star + square == 12 {
            if star - square == square {
                print("star = \(star)")
                print("square = \(square)")
            }
        }
        
    }
}
