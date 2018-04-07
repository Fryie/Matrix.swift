import XCTest

@testable import MatrixTests

XCTMain([
  testCase(PolynomialTests.allTests),
  testCase(MatrixTests.allTests)
])
