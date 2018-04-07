import XCTest
import Nimble

@testable import Matrix

class PolynomialTests: XCTestCase {
  static var allTests = [
    ("testDegreeWithNoTrailingZeroes", testDegreeWithNoTrailingZeroes),
    ("testDegreeWithTrailingZeroes", testDegreeWithTrailingZeroes),
    ("testDegreeOfConstant", testDegreeOfConstant),
    ("testDegreeOfZero", testDegreeOfZero),
    ("testDegreeOfZeroWithMultipleZeroes", testDegreeOfZeroWithMultipleZeroes),
    ("testDescriptionOfOne", testDescriptionOfOne),
    ("testDescriptionOfZero", testDescriptionOfZero),
    ("testDescriptionOfGeneralPolynomial", testDescriptionOfGeneralPolynomial),
    ("testAddingPolynomialsOfSameDegree", testAddingPolynomialsOfSameDegree),
    ("testAddingPolynomialsWithCancelling", testAddingPolynomialsWithCancelling),
    ("testAddingPolynomialsWithLeftDegreeHigher", testAddingPolynomialsWithLeftDegreeHigher),
    ("testAddingPolynomialsWithRightDegreeHigher", testAddingPolynomialsWithRightDegreeHigher)
  ]

  // degree
  func testDegreeWithNoTrailingZeroes() {
    let poly = Polynomial(from: [2, 3, 0, 7])
    expect(poly.degree).to(equal(Polynomial.Degree.pos(3)))
  }

  func testDegreeWithTrailingZeroes() {
    let poly = Polynomial(from: [2, 3, 0, 0])
    expect(poly.degree).to(equal(Polynomial.Degree.pos(1)))
  }

  func testDegreeOfConstant() {
    let poly = Polynomial(from: [5])
    expect(poly.degree).to(equal(Polynomial.Degree.pos(0)))
  }

  func testDegreeOfZero() {
    let poly = Polynomial.zero
    expect(poly.degree).to(equal(Polynomial.Degree.negInf))
  }

  func testDegreeOfZeroWithMultipleZeroes() {
    let poly = Polynomial(from: [0, 0, 0])
    expect(poly.degree).to(equal(Polynomial.Degree.negInf))
  }

  // description
  func testDescriptionOfOne() {
    let poly = Polynomial(from: [1])
    expect(poly.description).to(equal("1"))
  }

  func testDescriptionOfZero() {
    let poly = Polynomial.zero
    expect(poly.description).to(equal("0"))
  }

  func testDescriptionOfGeneralPolynomial() {
    let poly = Polynomial(from: [0,5,0,-3,1])
    expect(poly.description).to(equal("T^4 - 3T^3 + 5T"))
  }

  // +
  func testAddingPolynomialsOfSameDegree() {
    let a = Polynomial(from: [3, 5, 2])
    let b = Polynomial(from: [9, 1, 3])

    expect(a+b).to(equal(Polynomial(from: [12, 6, 5])))
  }

  func testAddingPolynomialsWithCancelling() {
    let a = Polynomial(from: [3, 5, 2])
    let b = Polynomial(from: [9, 1, -2])

    expect(a+b).to(equal(Polynomial(from: [12, 6])))
  }

  func testAddingPolynomialsWithLeftDegreeHigher() {
    let a = Polynomial(from: [3, 5, 2])
    let b = Polynomial(from: [9, 1])

    expect(a+b).to(equal(Polynomial(from: [12, 6, 2])))
  }

  func testAddingPolynomialsWithRightDegreeHigher() {
    let a = Polynomial(from: [3, 5])
    let b = Polynomial(from: [9, 1, 2])

    expect(a+b).to(equal(Polynomial(from: [12, 6, 2])))
  }

  // test addition axioms (identity, inverse, etc.)
  // test degree of sum <= degree of terms

  // test negation
  // test zero

}
