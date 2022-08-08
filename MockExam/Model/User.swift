//
//  User.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import RealmSwift
import Foundation

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var email = ""
    @Persisted var password = ""
}

