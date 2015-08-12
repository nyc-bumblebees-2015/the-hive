# From GitHub API: List of gitgnore Templates
TECH_TAGS = [
  "Actionscript",
  "Ada",
  "Agda",
  "Android",
  "AppEngine",
  "AppceleratorTitanium",
  "ArchLinuxPackages",
  "Autotools",
  "Bancha",
  "C",
  "C++",
  "CFWheels",
  "CMake",
  "CUDA",
  "CakePHP",
  "ChefCookbook",
  "Clojure",
  "CodeIgniter",
  "CommonLisp",
  "Composer",
  "Concrete5",
  "Coq",
  "CraftCMS",
  "DM",
  "Dart",
  "Delphi",
  "Drupal",
  "EPiServer",
  "Eagle",
  "Elisp",
  "Elixir",
  "Erlang",
  "ExpressionEngine",
  "ExtJS-MVC",
  "ExtJs",
  "Fancy",
  "Finale",
  "ForceDotCom",
  "Fortran",
  "FuelPHP",
  "GWT",
  "GitBook",
  "Go",
  "Gradle",
  "Grails",
  "Haskell",
  "IGORPro",
  "Idris",
  "Java",
  "Jboss",
  "Jekyll",
  "Joomla",
  "Jython",
  "Kohana",
  "LabVIEW",
  "Laravel",
  "Leiningen",
  "LemonStand",
  "Lilypond",
  "Lithium",
  "Lua",
  "Magento",
  "Maven",
  "Mercury",
  "MetaProgrammingSystem",
  "Meteor",
  "Nim",
  "Node",
  "OCaml",
  "Objective-C",
  "Opa",
  "OracleForms",
  "Packer",
  "Perl",
  "Phalcon",
  "PlayFramework",
  "Plone",
  "Prestashop",
  "Processing",
  "Python",
  "Qooxdoo",
  "Qt",
  "R",
  "ROS",
  "Rails",
  "RhodesRhomobile",
  "Ruby",
  "Rust",
  "SCons",
  "Sass",
  "Scala",
  "Scrivener",
  "Sdcc",
  "SeamGen",
  "SketchUp",
  "SugarCRM",
  "Swift",
  "Symfony",
  "SymphonyCMS",
  "Target3001",
  "Tasm",
  "TeX",
  "Textpattern",
  "TurboGears2",
  "Typo3",
  "Umbraco",
  "Unity",
  "VVVV",
  "VisualStudio",
  "Waf",
  "WordPress",
  "Xojo",
  "Yeoman",
  "Yii",
  "ZendFramework",
  "Zephir",
  "gcov",
  "nanoc",
  "opencart",
  "stella"
]

# Create tags
TECH_TAGS.each do |t|
  Tag.create(name: t)
end

# Seed users, collabs, projects with Faker data for development only
case Rails.env
when "development"

  COLLAB_STATUSES = ["pending", "approved", "denied"]

  PROJECT_STATUSES = ["planning", "in progress", "completed"]

  NY_ZIP_CODES = ['10001', '10026', '10038', '11204', '07748', '10025', '10014']

  PROJECT_LEVELS = ["beginner", "intermediate", "advanced"]

  10.times do
    name = Faker::Name.name.split(" ")
    first_name = name[0]
    last_name = name[1]
    User.create(username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "password",
                zip_code: NY_ZIP_CODES.sample,
                first_name: first_name,
                last_name: last_name,
                bio: Faker::Lorem.paragraph,
                website_link: Faker::Internet.url,
                github_link: Faker::Internet.url('github.com')
                )
    sleep 1
  end

  15.times do
    user_id = rand(1..User.count)
    Project.create(creator_id: user_id,
                   title: Faker::App.name,
                   description: Faker::Lorem.paragraph,
                   skills_desired: Faker::Lorem.paragraph,
                   repo_link: Faker::Internet.url('github.com'),
                   start_date: Faker::Date.between(365.days.ago, Date.today),
                   end_date: Faker::Date.forward(365),
                   status: PROJECT_STATUSES.sample,
                   level: PROJECT_LEVELS.sample
                   )
  end

  User.all.each do |user|
    rand(1..3).times do
      Collaboration.create(collaborator_id: user.id,
                      project_id: rand(1..Project.count),
                      status: COLLAB_STATUSES.sample
                      )
    end
  end

  Project.all.each do |project|
    project.tags << Tag.all.sample(rand(1..5))
  end
end
