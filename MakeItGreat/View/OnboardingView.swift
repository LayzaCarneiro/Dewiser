//
//  OnboardingView.swift
//  MakeItGreat
//
//  Created by Hadassa Vitoria on 09/10/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1
    
    var body: some View {
        if currentOnboardingPage > totalScreen {
            HomeScreenView()
        } else {
            if currentOnboardingPage == 1 {
                OnboardingScreen()
            } else {
                if currentOnboardingPage == 2 {
                    OnboardingScreen2()
                } else {
                    OnboardingScreen3()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

let totalScreen = 3

struct OnboardingScreen: View {
    
    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1
    
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        currentOnboardingPage = totalScreen
                    }, label: {
                    Text ("Skip")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.text)
                    })
                }
                .padding(.trailing)
                Spacer()
                Text("Register your\ndecisions!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.heavy)
                    .padding()
                Text("Now your decisions are in only \none place!")
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
                Spacer()
                Button(action: {
                    if currentOnboardingPage < totalScreen {
                        currentOnboardingPage += 1
                    }
                }, label: {
                    Text("Continue")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(width: 254, height: 76)
                        .background(.secondary)
                        .cornerRadius(30)
                    
                })
            }
        }
    }
}

struct OnboardingScreen2: View {
    
    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        currentOnboardingPage = totalScreen
                    }, label: {
                    Text ("Skip")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.text)
                    })
                }
                .padding(.trailing)
                Spacer()
               Text("Remember your decision's deadline!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.heavy)
                    .padding()
                Text("Receive a notification everytime\n your deadline is over!")
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
                Spacer()
                Button(action: {
                    if currentOnboardingPage < totalScreen {
                        currentOnboardingPage += 1
                    }
                }, label: {
                    Text("Continue")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(width: 254, height: 76)
                        .background(.secondary)
                        .cornerRadius(30)
                    
                })
            }
        }
    }
}

struct OnboardingScreen3: View {
    
    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        currentOnboardingPage = totalScreen
                    }, label: {
                    Text ("Skip")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.text)
                    })
                }
                .padding(.trailing)
                Spacer()
               Text("Table of Pros and\nCons!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.heavy)
                    .padding()
                Text("Solve your decision fast using our\npros and cons table!")
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
                Spacer()
                Button(action: {
                    if currentOnboardingPage <= totalScreen {
                        currentOnboardingPage += 1
                    }
                }, label: {
                    Text("Start")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(width: 254, height: 76)
                        .background(.yellowPicker)
                        .cornerRadius(30)
                    
                })
            }
        }
    }
}
