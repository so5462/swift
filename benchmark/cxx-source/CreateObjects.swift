//===--- CreateObjects.swift ----------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

// This is a simple test that creates thousands of C++ objects and does nothing
// with them.

import TestsUtils
import CxxCreateObjects

public let CreateObjects = BenchmarkInfo(
  name: "CreateObjects",
  runFunction: run_CreateObjects,
  tags: [.validation, .bridging])

@inline(never)
public func run_CreateObjects(_ N: Int) {
  for i in 0...(N * 10_000) {
    let x = Int32(i)
    let f = CxxLoadableIntWrapper(value: x)
    blackHole(f)
  }
}
