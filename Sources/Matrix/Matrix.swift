struct Matrix<T: Ring> {
  private var rows: [[T]]

  init(rows: [[T]]) {
    self.rows = rows
  }
}
