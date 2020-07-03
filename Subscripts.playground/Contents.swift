import UIKit

//-------------------------------------------------------------------------------------//
// Subscript syntax

//subscript(index: Int) -> Int {
//    get {
//        // return an appropriate subscript value here.
//    }
//    set(newValue) {
//        // perform a sutable setting action here.
//    }
//}

// read only

//subscript(index: Int) -> Int {
//    // return an appropriate subscript value here.
//}

struct Timestable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimeTable = Timestable(multiplier: 3)
print("six times three is \(threeTimeTable[6])")

//-------------------------------------------------------------------------------------//

// Subscript Usage

var numberOfLegs = ["spider": 8, "ant":6, "cat": 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)

//-------------------------------------------------------------------------------------//

// subscript options

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row*columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row*columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
//matrix[2,1] = 1.5
print(matrix)

//-------------------------------------------------------------------------------------//

// Type Subscripts

enum planet: Int {
    case mercury = 1, venus, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> planet {
        return planet(rawValue: n)!
    }
}

let mars = planet[4]
print(mars)
