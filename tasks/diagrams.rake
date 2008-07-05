namespace :doc do
  namespace :diagram do
    ADDITIONAL_OPTS = "-j -v --hide-magic"
    RAILROAD = "./vendor/plugins/railroad/bin/railroad"
    task :models do
      sh "#{RAILROAD} -i -l -m -M #{ADDITIONAL_OPTS} | dot -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/models.svg"
    end

    task :controllers do
      sh "#{RAILROAD} -i -l -C -v | neato -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.svg"
    end
  end

  task :diagrams => %w(diagram:models diagram:controllers)
end