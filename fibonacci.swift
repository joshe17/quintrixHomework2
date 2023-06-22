//
//  fibonacci.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/22/23.
//

import Foundation

func Fib(inputNum: Int, count: Int) -> [Int] {
    var fSequence = [0, 1]
    let startIndex = findFibIndex(inputNum: inputNum)
    let endIndex = startIndex + count
    
    if startIndex == -1 {
        return []
    }
    else {
        for i in 2...endIndex {
            fSequence.append(fSequence[i-1] + fSequence[i-2])
        }
        return Array<Int>(fSequence[startIndex..<endIndex])
    }
    
}

func findFibIndex(inputNum: Int) -> Int {
    if inputNum <= 1 {
        return inputNum
    }
    
    var a = 0
    var b = 1
    var sum = 1
    var indexOf = 1
    
    while sum < inputNum {
        sum = a + b
        indexOf = indexOf + 1
        a = b
        b = sum
    }
    if sum == inputNum {
        return indexOf
    }
    else {
        return -1
    }
}



print(Fib(inputNum: 5, count: 3))
