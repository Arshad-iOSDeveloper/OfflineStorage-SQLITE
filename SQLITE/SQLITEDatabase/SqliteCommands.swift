//
//  SqliteCommands.swift
//  SQLITE
//
//  Created by Arshad Shaik on 11/12/23.
//

import Foundation
import SQLite

class SqliteCommands {
  
  static var table = Table("school")
  
  /// Expressions
  static let schoolId = Expression<Int>("schoolId")
  static let schoolName = Expression<String>("schoolName")
  
  // Creating Table
  static func createTable() {
    guard let database = SqliteDatabase.shared.database else {
      print("Database connection error")
      return
    }
    
    do {
      /// ifNotExists: true - Will not create a table if it already exists
      try database.run(table.create(ifNotExists: true) { table in
        table.column(schoolId, primaryKey: .autoincrement)
        table.column(schoolName)
      })
    } catch {
      print("Table already exists: \(error)")
    }
  }
  
  // Inserting into Table
  static func insertRow(_ values: School) -> Bool {
    guard let database = SqliteDatabase.shared.database else {
      print("Database connection error")
      return false
    }
    do {
      try database.run(table.insert(
        schoolId <- values.schoolId,
        schoolName <- values.schoolName
      ))
      return true
    } catch let error {
      print("insertion failed: \(error)")
      return false
    }
  }
  
  // Get Rows
  static func getRows() -> [School] {
    guard let database = SqliteDatabase.shared.database else {
      print("Database connection error")
      return []
    }
    
    var schoolArray = [School]()
    
    // sorting data by descending order by id
    table = table.order(schoolId.desc)
    
    do {
      for school in try database.prepare(table) {
        let id = school[schoolId]
        let name = school[schoolName]
        print("school data is ", id, name)
        let schoolObject = School(schoolId: id, schoolName: name)
        schoolArray.append(schoolObject)
      }
    } catch {
      print("get row data error: \(error)")
    }
    return schoolArray
  }
  
}
