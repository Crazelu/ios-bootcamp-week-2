/// Copyright (c) 2023 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct SlidersView: View {
   @Binding var redValue: Double
   @Binding var greenValue: Double
   @Binding var blueValue: Double
  
  var body: some View {
    VStack{
      SliderWithLabel(color: Color.red, text: "Red", sliderValue: $redValue)
      SliderWithLabel(color: Color.green, text: "Green", sliderValue: $greenValue)
      SliderWithLabel(color: Color.blue, text: "Blue", sliderValue: $blueValue)
    }
  }
}

struct SliderWithLabel: View {
  let color: Color
  let text: String
  @Binding var sliderValue: Double
  
  var body: some View {
    VStack{
      Text(text)
      HStack{
        Slider(value: $sliderValue, in: 0...Constants.maxColorValue)
          .tint(color)
        Text(String(Int(sliderValue.rounded())))
      }
    }
  }
  
}

struct SlidersView_Previews: PreviewProvider {
  static private var redValue = Binding.constant(56.0)
  static private var greenValue = Binding.constant(156.0)
  static private var blueValue = Binding.constant(106.0)
  
  static var previews: some View {
    SlidersView(
      redValue: redValue,
      greenValue: greenValue,
      blueValue: blueValue
    )
    SlidersView(
      redValue: redValue,
      greenValue: greenValue,
      blueValue: blueValue
    )
    .preferredColorScheme(.dark)
  }
}
