# frozen_string_literal: true
require 'json'

require_relative "FileChecker/version"

module FileChecker

  class Error < StandardError; end

  class FileChecker

    # Daniil Kubantsev
    def is_png?(file_path)
      # TODO: понять, как сопоставить расширение и содержимое
      # begin
      #   extencion = File.extname(path).delete('.').upcase
      #   first_line = File.open(path, "r").readline
      #   first_line == extencion
      # rescue Errno::ENOENT => e
      #   e.message
      # end
    end

    # Daniil Kubantsev
    def is_pdf?(file_path)
      begin
        extencion = File.extname(path).delete('.').upcase
        first_line = File.open(path, "r").readline.slice(1, 3)
        first_line == extencion
      rescue Errno::ENOENT => e
        e.message
      end
    end

    # Leonid Krupnov
    def is_json?(file_path)
      return false unless File.exist?(file_path)

      begin
        # Parse check
        JSON.parse(File.read(file_path))
        true
      rescue JSON::ParserError => e
        false
      end
    end

    # Leonid Krupnov
    def is_xml?(file_path)
      unless File.exist?(file_path)
        puts 'file doesnt exist'
      end

      # First line check
      File.open(file_path, "r") do |file|
        first_line = file.readline.strip
        return first_line.start_with?("<?xml")
      end
    end

  end
end
