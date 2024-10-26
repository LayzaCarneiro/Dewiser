//
//  FirstPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FirstPage: View {
    @StateObject var formViewModel: FormViewModel
    @Binding var isPresented: Bool
    @State private var titleIsEmpty: Bool = false
    @FocusState private var isTitleFocused: Bool
    @FocusState private var isDescriptionFocused: Bool
    var generate = UIImpactFeedbackGenerator(style: .rigid)

    private var isHapticsEnabled: Bool {
        UserDefaults.standard.bool(forKey: "isAbleHaptics")
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
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                            }
                            TextField("What's your decision title?", text: $formViewModel.cardModel.title)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 16)
                                .frame(height: 44)
                                .background(.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                    // swiftlint:disable:next line_length
                                        .stroke((titleIsEmpty && formViewModel.cardModel.title.isEmpty) ? Color.red : Color.fieldStroke, lineWidth: 2)
                                )
                                .focused($isTitleFocused)
                                .onSubmit {
                                    isDescriptionFocused = true
                                }
                                .onTapGesture {
                                    titleIsEmpty = false
                                    hideKeyboard()
                                }
                        }

                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.body)
                                .fontWeight(.bold)
                            TextField("What's your decision description?",
                                      text: Binding(
                                        get: {formViewModel.cardModel.cardDescription ?? ""},
                                        set: {formViewModel.cardModel.cardDescription = $0.isEmpty ? nil : $0}),
                                      axis: .vertical)
                            .padding()
                            .background(.cardBackground)
                            .lineLimit(8, reservesSpace: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.fieldStroke, lineWidth: 2)
                            )
                            .focused($isDescriptionFocused)
                        }
                        .onTapGesture {
                            hideKeyboard()
                        }

                        HStack(spacing: 55) {
                            VStack(alignment: .leading) {
                                Text("Deadline")
                                    .font(.body)
                                    .fontWeight(.bold)

                                CustomDatePicker(selectedDate: Binding(
                                    get: {formViewModel.cardModel.deadline ?? Date()},
                                    set: { newValue in formViewModel.cardModel.deadline = newValue}
                                ), isDateSelected: false)
                            }

                            VStack(alignment: .leading) {
                                Text("Deadline's Time")
                                    .font(.body)
                                    .fontWeight(.bold)

                                CustomHourPicker(selectedHour: Binding(
                                    get: {formViewModel.cardModel.time ?? Date()},
                                    set: { newValue in formViewModel.cardModel.time = newValue}
                                ), isHourSelected: false)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Text("Priority")
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                            }

                            CustomPriorityPicker(selectedPriority: $formViewModel.cardModel.priorityEnum)
                        }
                    }
                    .fontDesign(.rounded)
                    .padding()
                    .padding(.top, 15)
                    Spacer()
                }
            }
            .navigationTitle("New Decision")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.cancelcolor)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if !formViewModel.cardModel.title.isEmpty {
                        // swiftlint:disable:next line_length
                        NavigationLink(destination: SecondPage(formViewModel: formViewModel, isPresented: $isPresented)) {
                            Text("Next")
                                .foregroundStyle(.cancelcolor)
                        }
                    } else {
                        Button {
                            titleIsEmpty = true
                            if isHapticsEnabled {
                                generate.impactOccurred()
                            }
                        } label: {
                            Text("Next")
                                .foregroundStyle(.cancelcolor)
                        }
                    }
                }
            }
        }
        .accentColor(.accent)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
