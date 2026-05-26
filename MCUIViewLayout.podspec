Pod::Spec.new do |s|
  s.name     = 'MCUIViewLayout'
  s.version  = '0.5.2'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Layouting enhancements to UIView.'
  s.homepage = 'https://github.com/mirego/MCUIViewLayout'
  s.authors  = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/MCUIViewLayout.git', :tag => s.version.to_s }
  s.source_files = 'Sources/MCUIViewLayoutObjC/**/*.{h,m}', 'Sources/MCUIViewLayout/**/*.swift'
  s.exclude_files = 'Sources/MCUIViewLayout/MCUIViewLayout.swift'
  s.public_header_files = 'Sources/MCUIViewLayoutObjC/include/*.h'
  s.requires_arc = true
  s.swift_versions = ['5.0']
  s.platform = :ios, '12.0'
  s.tvos.deployment_target = '12.0'
end
