//
//  EditView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 04/10/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss

    @State var card: CardModel

    @State private var title: String
    @State private var description: String
    @State private var deadline: Date?
    @State private var time: Date?
    @State private var priority: CardModel.Priority
    @State private var feeling: String

    init(card: CardModel) {
        _card = State(initialValue: card)
        _title = State(initialValue: card.title)
        _description = State(initialValue: card.cardDescription ?? "")
        _deadline = State(initialValue: card.deadline)
        _time = State(initialValue: card.time)
        _priority = State(initialValue: card.priorityEnum)
        _feeling = State(initialValue: card.feeling)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 42) {
                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Text("Title")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                                    .fontDesign(.rounded)
                            }
                            TextField("What's your decision title?", text: $title)
                                .fontDesign(.rounded)
                                .padding()
                                .frame(width: 361, height: 44)
                                .background(.cardBackground)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.fieldStroke, lineWidth: 2)
                                )
                        }

                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.body)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            TextField("What's your decision description?",
                                      text: $description, axis: .vertical)
                                .fontDesign(.rounded)
                                .padding()
                                .lineLimit(8, reservesSpace: true)
                                .background(.cardBackground)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.fieldStroke, lineWidth: 2)
                                )
                        }

                        HStack(spacing: 55) {
                            VStack(alignment: .leading) {
                                Text("Deadline")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)

                                CustomDatePicker(selectedDate: $deadline, isDateSelected: true)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.fieldStroke, lineWidth: 2)
                                    )
                            }

                            VStack(alignment: .leading) {
                                Text("Time")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)

                                CustomHourPicker(selectedHour: $time, isHourSelected: true)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.fieldStroke, lineWidth: 2)
                                    )
                            }
                        }
                        .padding(.trailing, 12)

                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Text("Priority")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                                    .fontDesign(.rounded)
                            }

                            CustomPriorityPicker(selectedPriority: $priority)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.fieldStroke, lineWidth: 2)
                                )

                        }

                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Text("Feel")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                                    .fontDesign(.rounded)
                            }
                            CustomFeelingPicker(selectedFeeling: $feeling)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Edit Decision")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.text)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        saveChanges()
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundStyle(.text)
                    }
                }
            }
        }
    }

    func saveChanges() {
        card.title = title
        card.cardDescription = description
        card.deadline = deadline
        card.time = time
        card.priorityEnum = priority
        card.feeling = feeling
    }
}
