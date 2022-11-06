//
//  widgetApp.swift
//  widget
//
//  Created by 古賀遥貴 on 2022/11/06.
//

import SwiftUI

@main
struct widgetApp: App {
    let persistenceController = PersistenceController.shared.managedObjectContext

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController)
        }
    }
}
