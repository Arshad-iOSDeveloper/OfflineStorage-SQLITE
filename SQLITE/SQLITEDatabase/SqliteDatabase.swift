//
//  SqliteDatabase.swift
//  SQLITE
//
//  Created by Arshad Shaik on 11/12/23.
//

import Foundation
import SQLite

class SqliteDatabase {
  static let shared = SqliteDatabase()
  let dbName = "schooldb"
  let dbExtension = "sqlite3"
  var database: Connection?
  
  private init() {
    createConnection()
  }
  
  fileprivate func createConnection() {
    /// create connection to database
    do {
      let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      let fileUrl = documentDirectory.appending(path: dbName).appendingPathExtension(dbExtension)
      
      database = try Connection(fileUrl.path())
    } catch {
      print("creating connection to database error: \(error)")
    }
  }
  
  // MARK: - Create Table -
  func createTable() {
    SqliteCommands.createTable()
  }
  
  func insertRow() {
    if SqliteCommands.insertRow(School(schoolId: 1, schoolName: "Crelio")) {
      print("insert row successful")
    }
  }
  
  func getRows() -> [School] {
    SqliteCommands.getRows()
  }
  
}
