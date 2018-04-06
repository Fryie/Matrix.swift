protocol Ring {
  static func +(l: Self, r: Self) -> Self
  static prefix func -(r: Self) -> Self
  static var zero: Self { get }
  // multiplication + "one" element
}

extension Double: Ring { static var zero: Double = 0 }
extension Float: Ring { static var zero: Float = 0 }
extension Int: Ring { static var zero: Int = 0 }
