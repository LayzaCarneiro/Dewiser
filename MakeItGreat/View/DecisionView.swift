//
//  DecisionView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 01/10/24.
//

import SwiftUI

struct DecisionView: View {
    var decision: CardModel
    @State var sheet: Bool = false
    @State var isHourSelected: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.purpleBackground.ignoresSafeArea()

                VStack(spacing: 10) {
                    HStack {
                        Text(decision.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundStyle(Color.background)

                        Spacer()
                        
                        PriorityTag(priority: decision.priority)
                    }
                    .padding(.leading, 26)
                    .padding(.trailing, 10
                    )

                    Text(decision.cardDescription ?? "")
                        .font(.body)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.background)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 26)

                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 21, height: 21)

                        Text(decision.deadline?.toString("MMM dd") ?? "No date")
                            .frame(width: 70, height: 22)

                        Text("|")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .padding(.trailing, 6)
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 21, height: 21)

                        Text(decision.time?.toString("HH:mm") ?? "--:--")
                            .frame(width: 54, height: 22)

                    }
                    .foregroundColor(Color.background)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 26)
                    .padding(.vertical, 10)
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 393)
                        .background(Color.background)
                        .cornerRadius(40)
                        .ignoresSafeArea()

                        ProConsView(card: decision)
                            .padding(.top, 50)
                    }
                }
                .padding(.top, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if decision.priority != "done" {
                    Button {
                        sheet.toggle()
                    } label: {
                        Text("Edit")
                            .foregroundStyle(Color.background)
                    }
                    .sheet(isPresented: $sheet) {
                        NavigationView {
                            EditView(card: decision)
                        }
                        .presentationDragIndicator(.visible)
                    }
                }
            }
        }
    }
}
