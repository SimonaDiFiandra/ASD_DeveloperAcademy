func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var sortedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        sortedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}
