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
                        .fontWeight(.black)
                        .padding()
                    Text("Now your decisions are in only \none place!")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)
                    Spacer()
                    ZStack (alignment: .bottom){
                        Image("onboarding1")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -50)
                        Button(action: {
                            if currentOnboardingPage < totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Continue")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                                .foregroundColor(.text)
                                .frame(width: 254, height: 76)
                                .background(Color("background"))
                                .cornerRadius(30)
                            
                        })
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
                        .fontWeight(.black)
                        .padding()
                    Text("Receive a notification everytime\n your deadline is over!")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)
                    Spacer()
                    ZStack (alignment: .bottom){
                        Image("onboarding2")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -50)
                        Button(action: {
                            if currentOnboardingPage < totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Continue")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                                .foregroundColor(.text)
                                .frame(width: 254, height: 76)
                                .background(Color("background"))
                                .cornerRadius(30)
                            
                        })
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
                        .fontWeight(.black)
                        .padding()
                    Text("Solve your decision fast using our\npros and cons table!")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .fontDesign(.rounded)
                    Spacer()
                    ZStack (alignment: .bottom){
                        Image("onboarding3")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                            .clipped()
                            .padding(.bottom, -50)
                        Button(action: {
                            if currentOnboardingPage <= totalScreen {
                                currentOnboardingPage += 1
                            }
                        }, label: {
                            Text("Start")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 254, height: 76)
                                .background(.yellowPicker)
                                .cornerRadius(30)
                            
                        })
                    }
                }
            }
        }
  
    }
}

