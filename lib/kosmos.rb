require 'kosmos/package_dsl'
require 'kosmos/package'
require 'kosmos/versioner'
require 'kosmos/git_adapter'
require 'kosmos/download_url'
require 'kosmos/util'
require 'kosmos/version'

require 'json'

module Kosmos
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end

    def save_ksp_path(path)
      write_config(ksp_path: path)
    end

    def load_ksp_path
      read_config[:ksp_path]
    end

    private

    def write_config(opts)
      File.open(config_path, "rw+") do |file|
        file.write JSON.pretty_generate(read_config.merge(opts))
      end
    end

    def read_config
      JSON.parse(File.read(config_path), symbolize_names: true)
    end

    def config_path
      File.join(Dir.home, ".kosmos")
    end
  end

  class Configuration
    attr_accessor :verbose, :post_processors

    def initialize
      @verbose = false
      @post_processors = [Kosmos::PostProcessors::ModuleManagerResolver]
    end
  end
end
