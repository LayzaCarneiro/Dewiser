//
//  SliderFeeling.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 02/10/24.
//

import SwiftUI
import UIKit

struct SliderFeeling: View {
    @ObservedObject var formViewModel: FormViewModel
    @State var sliderValue: Double = 5
    @State var previousValue: Int = 5
    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
    let generator = UIImpactFeedbackGenerator(style: .rigid)

    let feeling: [Int: String] = [1: "Insecure", 2: "Angry", 3: "Ok", 4: "Good", 5: "Confident"]
    let color: [Int: Color] = [1: .insecure, 2: .angry, 3: .ok, 4: .good, 5: .confident]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height * 0.4) {
                Text("Feeling: \(feeling[Int(sliderValue)] ?? "Confident")")
                    .font(.title2)
                    .fontWeight(.bold)
                //
                Slider(value: $sliderValue, in: 1...5)
                    .rotationEffect(.degrees(-90.0), anchor: .center)
                    .accentColor(color[Int(sliderValue)])
                    .animation(.easeInOut(duration: 0.2), value: sliderValue)
                //
            }
        }
        .padding()
        .onAppear {
            generator.prepare()
        }
        .onChange(of: sliderValue) { _, value in
            formViewModel.cardModel.feeling = feeling[Int(value)] ?? "Confident"
        }
        .onChange(of: formViewModel.cardModel.feeling) { _, _ in
            if isAbleHaptics {
                generator.impactOccurred()
            }
        }
    }
}

struct SliderFeeling_Previews: PreviewProvider {
    static var previews: some View {
        let formViewModel = FormViewModel()
        SliderFeeling(formViewModel: formViewModel)
    }
}

struct SwiftUISlider: UIViewRepresentable {

  final class Coordinator: NSObject {
    // The class property value is a binding: It’s a reference to the SwiftUISlider
    // value, which receives a reference to a @State variable value in ContentView.
    var value: Binding<Double>

    // Create the binding when you initialize the Coordinator
    init(value: Binding<Double>) {
      self.value = value
    }

    // Create a valueChanged(_:) action
    @objc func valueChanged(_ sender: UISlider) {
      self.value.wrappedValue = Double(sender.value)
    }
  }

  var thumbColor: UIColor = .white
  var minTrackColor: UIColor?
  var maxTrackColor: UIColor?

  @Binding var value: Double

  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.thumbTintColor = thumbColor
    slider.minimumTrackTintColor = minTrackColor
    slider.maximumTrackTintColor = maxTrackColor
    slider.value = Float(value)

    slider.addTarget(
      context.coordinator,
      action: #selector(Coordinator.valueChanged(_:)),
      for: .valueChanged
    )

    return slider
  }

  func updateUIView(_ uiView: UISlider, context: Context) {
    // Coordinating data between UIView and SwiftUI view
    uiView.value = Float(self.value)
  }

  func makeCoordinator() -> SwiftUISlider.Coordinator {
    Coordinator(value: $value)
  }
}
//
//#if DEBUG
//struct SwiftUISlider_Previews: PreviewProvider {
//  static var previews: some View {
//    SwiftUISlider(
//      thumbColor: .white,
//      minTrackColor: .blue,
//      maxTrackColor: .green,
//      value: .constant(0.5)
//    )
//  }
//}
//#endif
