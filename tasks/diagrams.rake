namespace :doc do
  namespace :diagram do
    ADDITIONAL_OPTS = "-v -j --hide-magic"
    RAILROAD = "./vendor/plugins/railroad/bin/railroad"
    desc "Draw model diagram"
    task :models do
      sh "#{RAILROAD} -i -m -M #{ADDITIONAL_OPTS} | dot -Tsvg | sed 's/font-size:12.00/font-size:11.00/g' > doc/models.svg"
    end

    desc "Draw controller diagram"
    task :controllers do
      sh "#{RAILROAD} -i -C | neato -Tsvg | sed 's/font-size:12.00/font-size:11.00/g' > doc/controllers.svg"
    end
  end

  desc "Draw model & controller diagrams"
  task :diagrams => %w(diagram:models diagram:controllers)
end