const graph_matrix: number[][] = [
  [0, 2, 6, 0, 0, 0, 0],
  [2, 0, 0, 5, 0, 0, 0],
  [6, 0, 0, 8, 0, 0, 0],
  [0, 5, 8, 0, 10, 15, 0],
  [0, 0, 0, 10, 0, 0, 2],
  [0, 0, 0, 15, 0, 0, 6],
  [0, 0, 0, 0, 2, 6, 0],
]

function showPath(start: number, target: number, parent: number[]): number[] {
  let temp: number = target
  let path: number[] = []

  while (parent[temp] !== 0) {
    path.push(parent[temp])
    temp = parent[temp]
  }

  path.push(start)
  path.reverse()
  path.push(target)

  return path
}

const djikstra = (graph: number[][], start: number): number[] => {
  const dist: number[] = new Array(graph.length).fill(Infinity)
  const visited: boolean[] = new Array(graph.length).fill(false)
  const parent: number[] = new Array(graph.length)

  dist[start] = 0
  parent[start] = 0

  for (let i = 0; i < graph.length - 1; i++) {
    let u: number = -1

    for (let j = 0; j < graph.length; j++) {
      if (!visited[j] && (u === -1 || dist[j] < dist[u])) {
        u = j
      }
    }

    visited[u] = true

    for (let v = 0; v < graph.length; v++) {
      if (!visited[v] && graph[u][v] !== 0) {
        let alt = dist[u] + graph[u][v]
        if (alt < dist[v]) {
          dist[v] = alt
          parent[v] = u
        }
      }
    }
  }

  for (let i = 0; i < parent.length; i++) {
    if (i !== start) {
      console.log(`${start} -> ${i} = ${dist[i]}`)
      console.log(`path: ${showPath(start, i, parent).map((n) => n.toString()).join(' -> ')}`)
    }
  }

  return dist
}

djikstra(graph_matrix, 0)
