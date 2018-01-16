//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count - 1
        switch args[size] {
            case "avg": return avg(args)
            case "count": return count(args)
            case "fact": return fact(args)
            default: return math(args)
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    public func avg(_ args: [String]) -> Int {
        let size = args.count - 1
        if size == 0 {
            return 0
        }
        var sum = 0
        for i in 0..<size {
            sum += Int(args[i])!
        }
        return sum / size
    }
    
    public func count(_ args: [String]) -> Int {
        return args.count - 1
    }
    
    public func fact(_ args: [String]) -> Int {
        if args.count == 1 {
            return 0
        }
        let num = Int(args[0])!
        switch num {
            case 0, 1: return 1
            default: return factHelper(num)
        }
    }
    private func factHelper(_ num: Int) -> Int {
        var fact = 1
        for i in 1...num {
            fact *= i
        }
        return fact
    }
    
    public func math(_ args: [String]) -> Int {
        let num1 = Int(args[0])!
        let op = args[1]
        let num2 = Int(args[2])!
        
        switch op {
            case "+": return num1 + num2
            case "-": return num1 - num2
            case "*": return num1 * num2
            case "/": return num1 / num2
            case "%": return modulo(num1, num2)
            default: return 0
        }
    }
    
    private func modulo(_ num1: Int, _ num2: Int) -> Int {
        if num1 < num2 {
            return num1
        }
        let mult = num1 / num2
        return num1 - (num2 * mult)
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

