func bubbleSort(_ array: inout [Int]) {
    let count = array.count
    var isSorted = false
    
    while !isSorted {
        isSorted = true
        for i in 0..<count - 1 {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
                isSorted = false
            }
        }
    }
}
var array = [12,15,3,2,4]
bubbleSort(&array)
