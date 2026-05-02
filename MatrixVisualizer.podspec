Pod::Spec.new do |s|
  s.name             = 'MatrixVisualizer'
  s.version          = '0.0.2'
  s.summary          = 'Matrix visualization framework for iOS'

  s.description      = <<-DESC
A lightweight framework to visualize matrices with customizable rendering and highlighting.
DESC

  s.homepage         = 'https://github.com/rahulpahuja/MatrixVisualizer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rahul Pahuja' => 'rahulpahuja2015@gmail.com' }

  s.source           = { :git => 'https://github.com/rahulpahuja/MatrixVisualizer.git', :tag => s.version.to_s }

  s.platform         = :ios, '12.0'
  s.swift_version    = '5.0'

  s.source_files     = 'MatrixVisualizer/**/*.{swift}'

end