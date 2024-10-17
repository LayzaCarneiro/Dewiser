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
        GeometryReader { geometry in
            ZStack {
                Color(.background)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            currentOnboardingPage = totalScreen
                        }, label: {
                            Text("Skip")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundStyle(.text)
                        })
                    }
                    .padding(.trailing)
                    Spacer()
                    Text("Register your decisions!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                        .padding()
                    Text("Now your decisions are in only one place!")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)
                    Spacer()
                    ZStack(alignment: .bottom) {
                        Image("onboarding1")
                            .resizable()
                            .frame(width: geometry.size.width)
                            .frame(height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -80)

                        Button(action: {
                            if currentOnboardingPage < totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Continue")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                        })
                        .padding()
                        .buttonStyle(CustomButton(colorButton: .background, colorShadow: .text))
                    }
                }
            }
        }
    }
}

struct OnboardingScreen2: View {

    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.background)
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            currentOnboardingPage = totalScreen
                        }, label: {
                            Text("Skip")
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
                        .fontWeight(.black)
                        .padding()
                    Text("Receive a notification everytime your deadline is over!")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)
                    Spacer()

                    ZStack(alignment: .bottom) {
                        Image("onboarding2")
                            .resizable()
                            .frame(width: geometry.size.width)
                            .frame(height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -80)
                        Button(action: {
                            if currentOnboardingPage < totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Continue")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                        })
                        .padding()
                        .buttonStyle(CustomButton(colorButton: .background, colorShadow: .text))
                    }
                }
            }
        }
    }
}

struct OnboardingScreen3: View {

    @AppStorage("currentOnboardingPage") var currentOnboardingPage = 1

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.background)
                    .ignoresSafeArea(.all)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            currentOnboardingPage = totalScreen
                        }, label: {
                            Text("Skip")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundStyle(.text)
                        })
                    }
                    .padding(.trailing)

                    Spacer()

                    Text("Table of Pros and Cons!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                        .padding()
                    Text("Solve your decision fast using our pros and cons table!")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)

                    Spacer()

                    ZStack(alignment: .bottom) {
                        Image("onboarding3")
                            .resizable()
                            .frame(width: geometry.size.width)
                            .frame(height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -80)
                        Button(action: {
                            if currentOnboardingPage <= totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Start")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                                .foregroundColor(.textCreateButton)
                        })
                        .padding()
                        .buttonStyle(CustomButton(colorButton: .yellowCustom))
                    }
                }
            }
        }
    }
}
