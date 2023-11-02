Pod::Spec.new do |s|
    s.name             = 'MatrixVisualizer'  
    s.version          = '0.0.1'  
    s.summary          = 'Matrix Visualizer for iOS' 
    s.description      = <<-DESC 'Matrix Visualizer For iOS'
    This highletbale view changes highlet text and makes your app look fantastic!
    DESC
    
    s.homepage         = 'https://github.com/rahulpahuja/MatrixVisualizer'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'username' => 'rahulpahuja2015@gmail.com' }
    s.source           = { :git => 'https://github.com/rahulpahuja/MatrixVisualizer.git', :tag => s.version.to_s }
    s.ios.deployment_target = '12.0'
    s.source_files = 'MatrixVisualizer/*'
    end