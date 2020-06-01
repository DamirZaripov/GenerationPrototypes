import Vision

class CoreMLService {
    
    var recognitionThreshold : Float = 0.25
    var accuracy: Double = 0.9
    var finishResult: [[Any]] = []

    func createClassifications(request: VNRequest, error: Error?) {
        if let theError = error {
            print("Error: \(theError.localizedDescription)")
            return
        }
        guard let observations = request.results else {
            print("No results")
            return
        }
        
        let classifications = observations[0...8]
            .compactMap({ $0 as? VNClassificationObservation })
            .compactMap({$0.confidence > recognitionThreshold ? $0 : nil})
            .map({ "\($0.identifier) \(String(format:"%.2f", $0.confidence))" })
            .joined(separator: "\n")
    }
    
    private func analyzeCurrentImage(image: UIImage) {
        let orientation = exifOrientationFromDeviceOrientation()
        
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: currentlyAnalyzedPixelBuffer!, orientation: orientation)
        visionQueue.async {
            do {
                defer { self.currentlyAnalyzedPixelBuffer = nil }
                try requestHandler.perform(self.analysisRequests)
            } catch {
                print("Error")
            }
        }
    }
    
    func decodeImage(image: UIImage) -> [[Array]] {
        var result: [[Any]] = []
        
        let model = Inceptionv3()
        
        self.analyzeCurrentImage(image)
        
        let output = try? model.prediction(image: image)
        
        
        output.classifications.getBlock {
            if block.accuracy < self.accuracy {
                continue
            }
            
            var elementInfo = [[Any]]
            var finishElementResult =
            
            block.check {  value in
                elementInfo.appeend(value)
                
            }
            
            self.calculateCoоrdinate(elementInfo)
        }
        
        let generateUIElementService = GenerateUIElementService()
        
        return self.finishResult
    }
    
    
    func calculateCoоrdinate(elementInfo: [Any]) {
        guard let xMin = elementInfo[1] as? Double else {
            return
        }
        
        guard let xMax = elementInfo[2] as? Double else {
            return
        }
        
        guard let yMin = elementInfo[3] as? Double else {
            return
        }
        
        guard let yMax = elementInfo[4] as? Double else {
            return
        }
        
        if (xMin == -1) && (xMax == -1) {
            return
        }
        
        if (yMin == -1) && (yMax == -1) {
            return
        }
        
        if (xMin == -1) && (yMax == -1) {
            return
        }
        
        if (xMax == -1) && (yMin == -1) {
            return
        }
        
        if xMin == -1 {
            elementInfo[1] = yMin - (yMax - xMax)
        }
        
        if xMax == -1 {
            elementInfo[2] = yMax - (yMin - xMin)
        }
        
        if yMin == -1 {
            elementInfo[3] = yMax - (xMax - xMin)
        }
        
        if yMax == -1 {
            elementInfo[4] = yMin + (xMax - xMin)
        }
        
        self.finishResult.appeend(elementInfo)
    }
    
    func sendResult(from image: UIImage) {
        self.decodeImage(image)
        
        let generateUIElementService = GenerateUIElementService.shared()
        generateUIElementService.arrayElements = self.finishResult
    }
}
