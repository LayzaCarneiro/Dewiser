//
//  WidgetView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 03/10/24.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
struct WidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Current Date:")
                .font(.headline)
            Text(entry.date, style: .date)
                .font(.title)
                .bold()
        }
        .padding()
    }
}
#Preview {
    WidgetEntryView()
}
