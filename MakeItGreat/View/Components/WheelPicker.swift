//
//  WheelPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 21/10/24.
//

import SwiftUI

struct WheelPicker: View {
    @Binding var selectedFeeling: String
    let images = ["Good", "Ok", "Insecure", "Angry", "Confident"]
    let segments: [Color] = [.goodBall, .okBall, .insecureBall, .angryBall, .confidentBall]

    @State var imageIndexx = [0: 3, 1: 2, 2: 1, 3: 0, 4: 4]
    let circleRadius: CGFloat = 160
    var generate = UIImpactFeedbackGenerator(style: .rigid)

    @State private var rotation: Angle = .zero
    @GestureState private var gestureRotation: Angle = .zero
    @State var imageIndex: Int = 0
    @State private var showShadow: Bool = false
    @State private var shadowRadius: CGFloat = 5
    @State private var previousDragPosition: CGFloat = 0

    var body: some View {
        VStack {
            Text("Feeling: \(selectedFeeling)")
                .font(.title2)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .foregroundStyle(Color.text)

            Spacer()
            ZStack {
                CircleFeelings(selectedIndex: Binding(
                    get: { imageIndexx[imageIndex] ?? 0 },
                    set: { imageIndexx[imageIndex] = $0 }
                ))
                    .padding()
                    .rotationEffect(rotation + gestureRotation)
                    .shadow(color: showShadow ? segments[imageIndex] : .clear, radius: shadowRadius, x: 0, y: 0)

                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.text)
                    .shadow(color: segments[imageIndex], radius: shadowRadius * 0.8, x: 0, y: 0)
                    .padding(.bottom, 100)
            }
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($gestureRotation) { (value, gestureState, _) in
                        let width = UIScreen.main.bounds.width
                        let sensitivityFactor: CGFloat = 1.0
                        let dragAmount = value.translation.width / (width * sensitivityFactor)
                        let newRotation = Angle(degrees: Double(dragAmount * 360))
                        gestureState = newRotation

                        let totalSegments = images.count
                        let degreesPerSegment = 360.0 / Double(totalSegments)

                        let currentRotation = (rotation.degrees + newRotation.degrees).truncatingRemainder(dividingBy: 360)
                        let normalizedRotation = (currentRotation + 360).truncatingRemainder(dividingBy: 360)

                        let anticipationFactor: Double = 0.2
                        let anticipatedRotation = normalizedRotation - (degreesPerSegment * anticipationFactor)

                        let newIndex = Int((anticipatedRotation + (degreesPerSegment / 2)) / degreesPerSegment) % totalSegments

                        if imageIndex != newIndex {
                            generate.impactOccurred(intensity: 0.8)
                            imageIndex = newIndex
                            selectedFeeling = images[newIndex]
                        }

                        let dragSpeed = abs(value.translation.width - previousDragPosition)
                        let maxShadowRadius: CGFloat = 20
                        let minShadowRadius: CGFloat = 7
                        let newShadowRadius = min(max(dragSpeed / 10, minShadowRadius), maxShadowRadius)

                        withAnimation(.easeInOut(duration: 0.2)) {
                            shadowRadius = newShadowRadius
                            showShadow = true
                        }

                        previousDragPosition = value.translation.width
                    }
                    .onEnded { value in
                        let width = UIScreen.main.bounds.width
                        let sensitivityFactor: CGFloat = 1.0
                        let dragAmount = value.translation.width / (width * sensitivityFactor)
                        let finalRotation = Angle(degrees: Double(dragAmount * 360))
                        rotation += finalRotation

                        let totalSegments = images.count
                        let degreesPerSegment = 360.0 / Double(totalSegments)

                        let currentRotation = rotation.degrees.truncatingRemainder(dividingBy: 360)
                        let normalizedRotation = (currentRotation + 360).truncatingRemainder(dividingBy: 360)

                        let anticipationFactor: Double = 0.2
                        let anticipatedRotation = normalizedRotation - (degreesPerSegment * anticipationFactor)

                        let newIndex = Int((anticipatedRotation + (degreesPerSegment / 2)) / degreesPerSegment) % totalSegments

                        if imageIndex != newIndex {
                            generate.impactOccurred(intensity: 0.8)
                        }

                        imageIndex = newIndex
                        selectedFeeling = images[newIndex]
                    }
            )
            .animation(.easeInOut(duration: 0.4), value: rotation)
        }
        .offset(y: 140)
        .onAppear {
            selectedFeeling = "Good"
        }
    }
}

struct CircleFeelings: View {
    let segments: [Color] = [.angryBall, .insecureBall, .okBall, .goodBall, .confidentBall]
    let icons: [String] = ["angryFace", "insecureFace", "okFace", "goodFace", "confidentFace"]
    let circleRadius: CGFloat = 240
    let iconRadiusFactor: CGFloat = 0.7
    let centerCircleRadius: CGFloat = 110
    let scaleFactor: CGFloat = 2.5
    //
    @Binding var selectedIndex: Int
    //
    var body: some View {
        ZStack {
            ForEach(0..<segments.count) { index in
                let startAngle = Angle(degrees: Double(index) * 72)
                let endAngle = Angle(degrees: Double(index + 1) * 72)

                Path { path in
                    path.move(to: CGPoint(x: circleRadius / 2, y: circleRadius / 2))
                    path.addArc(center: CGPoint(x: circleRadius / 2, y: circleRadius / 2),
                                radius: circleRadius / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: false)
                }
                .fill(segments[index])
                .frame(width: circleRadius, height: circleRadius)

                let midAngle = (startAngle.radians + endAngle.radians) / 2

                Image(icons[index])
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaleEffect(selectedIndex == index ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: selectedIndex)
                    .rotationEffect(Angle(radians: midAngle + .pi / 2))
                    .offset(x: (circleRadius / 2 * iconRadiusFactor) * cos(CGFloat(midAngle)),
                            y: (circleRadius / 2 * iconRadiusFactor) * sin(CGFloat(midAngle)))

                Circle()
                   .fill(Color.background)
                   .frame(width: centerCircleRadius, height: centerCircleRadius)
            }
        }
        .frame(width: circleRadius, height: circleRadius)
        .scaleEffect(scaleFactor)
    }
}

// #Preview {
//    WheelPicker()
// }
