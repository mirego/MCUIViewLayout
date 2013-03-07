Pod::Spec.new do |s|
  s.name     = 'UIViewLayout'
  s.version  = '0.1.0'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Layouting enhancements to UIView.'
  s.homepage = 'https://github.com/mirego/UIViewLayout.iOS'
  s.authors  = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/UIViewLayout.iOS.git', :tag => '0.1.0' }
  s.source_files = 'UIViewLayout/*.{h,m}'
  s.requires_arc = true
  
  s.platform = :ios, '5.0'
end