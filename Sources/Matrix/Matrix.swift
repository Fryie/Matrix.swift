public struct Matrix<T: Ring> {
  private var rows: [[T]]

  public init(rows: [[T]]) {
    self.rows = rows
  }
}
