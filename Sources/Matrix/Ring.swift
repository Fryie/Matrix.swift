public protocol Ring {
  static func +(l: Self, r: Self) -> Self
  static prefix func -(r: Self) -> Self
  static var zero: Self { get }
  // multiplication + "one" element
}

extension Double: Ring { public static var zero: Double = 0 }
extension Float: Ring { public static var zero: Float = 0 }
extension Int: Ring { public static var zero: Int = 0 }
