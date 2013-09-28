Gem::Specification.new do |s|
  s.name = %q{forum_monster}
  s.version = "1.0.4"
  s.platform = Gem::Platform::RUBY

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors     = ["Mike Kelley"]
  s.email       = ["mike@codezombie.org"]
  s.homepage    = "http://github.com/codezomb/forum_monster"
  s.description = "A Simple Rails Forum Generator"
  s.summary     = "A Simple Rails Forum Generator"

  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]

  s.require_paths = ['lib']
  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact

  s.add_dependency "rails", ">= 3.0.0"

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end
end

