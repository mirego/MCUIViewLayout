Pod::Spec.new do |s|
  s.name     = 'MCUIViewLayout'
  s.version  = '0.1.3'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Layouting enhancements to UIView.'
  s.homepage = 'https://github.com/mirego/MCUIViewLayout.iOS'
  s.authors  = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/MCUIViewLayout.iOS.git', :tag => '0.1.3' }
  s.source_files = 'MCUIViewLayout/*.{h,m}'
  s.requires_arc = true
  s.platform = :ios, '5.0'
end