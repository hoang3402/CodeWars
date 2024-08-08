function spiralMatrixIII(rows: number, cols: number, rStart: number, cStart: number): number[][] {
  let result: number[][] = [];
  let totalCells = rows * cols;
  let directions = [
    [0, 1],  // right
    [1, 0],  // down
    [0, -1], // left
    [-1, 0]  // up
  ];
  let step = 1;
  let d = 0;
  let x = rStart, y = cStart;

  result.push([x, y]);
  while (result.length < totalCells) {
    for (let i = 0; i < step; i++) {
      x += directions[d][0];
      y += directions[d][1];

      if (x >= 0 && x < rows && y >= 0 && y < cols) {
        result.push([x, y]);
      }
    }

    d = (d + 1) % 4;
    if (d == 0 || d == 2) {
      step++;
    }
  }

  return result;
}
