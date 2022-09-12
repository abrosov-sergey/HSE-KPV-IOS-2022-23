import Foundation
import UIKit

func getHEXColor() -> UIColor {
    let red = Int.random(in: 0...255)
    let green = Int.random(in: 0...255)
    let blue = Int.random(in: 0...255)
    
    let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255) << 0
    
    return UIColor(rgb: rgb)
}
