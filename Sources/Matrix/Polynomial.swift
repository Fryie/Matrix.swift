import Foundation

public struct Polynomial: Equatable, CustomStringConvertible {
  public enum Degree: Equatable {
    case pos(Int), negInf
  }

  // For simplicity, we'll only allow polynomials with integer coefficients
  private var coefficients: [Int]

  public var degree: Degree {
    if coefficients.count > 0 {
      return .pos(coefficients.count - 1)
    } else {
      return .negInf
    }
  }

  public var description: String {
    let terms = coefficients.enumerated().compactMap { (i: Int, c: Int) -> String? in
      guard c != 0 else { return nil }
      guard !(i == 0 && c == 1) else { return "1" }

      let cString = c == 1 ? "" : "\(c)"

      let tString: String
      switch i {
      case 0:
        tString = ""
      case 1:
        tString = "T"
      default:
        tString = "T^\(i)"
      }

      return cString + tString
    }

    guard !terms.isEmpty else { return "0" }

    return terms.reversed().joined(separator: " + ").replacingOccurrences(of: "+ -", with: "- ")
  }

  public init(from coefficients: [Int]) {
    self.coefficients = Polynomial.removeTrailingZeroes(coefficients)
  }

  private static func removeTrailingZeroes(_ array: [Int]) -> [Int] {
    guard let lastElement = array.last, lastElement == 0 else {
      return array
    }

    let lastNonZeroIndex = (0..<array.endIndex).reversed().first(where: { array[$0] != 0 })
    if let lastNonZeroIndex = lastNonZeroIndex {
      return Array(array[0...lastNonZeroIndex])
    } else {
      return []
    }
  }

}

extension Polynomial: Ring {
  public static var zero = Polynomial(from: [0])

  public static func +(l: Polynomial, r: Polynomial) -> Polynomial {
    let lastIndex = max(l.coefficients.endIndex, r.coefficients.endIndex) - 1
    let newCoefficients = (0...lastIndex).map { (index: Int) -> Int in
      let lValue = index < l.coefficients.count ? l.coefficients[index] : 0
      let rValue = index < r.coefficients.count ? r.coefficients[index] : 0
      return lValue + rValue
    }

    return Polynomial(from: newCoefficients)
  }

  public static prefix func -(p: Polynomial) -> Polynomial {
    let newCoefficients = p.coefficients.map { -$0 }
    return Polynomial(from: newCoefficients)
  }
}
