class RenzaPublisher
  class Path
    require 'pathname'

    MASKING_FILE_FORMAT = "mask%d.jpg"
    TIME_TABLE_FORMAT = "time_table_disk%d.txt"
    IMAGE_FORMAT = "image-%04d.jpg"
    THUMBNAIL_FORMAT = "vol%03d_thumb.jpg"
    VIDEO_FORMAT_BASE = "vol%03d"
    
    attr_accessor :working_dir, :output_dir
    attr_accessor :video_extension

    def initialize(working_dir, output_dir, video_extension)
      @working_dir, @output_dir = Pathname.new(working_dir), Pathname.new(output_dir)
      [@working_dir, @output_dir].each do |dir| dir.mkpath end
      @video_extension = video_extension
    end
    
    def image_file(i)
      sprintf((@working_dir + IMAGE_FORMAT).to_s, i)
    end
    
    def video_file(i)
      sprintf((@output_dir + (VIDEO_FORMAT_BASE+@video_extension)).to_s, i)
    end
    
    def thumbnail_file(i)
      sprintf((@output_dir + THUMBNAIL_FORMAT).to_s, i)
    end

    def time_table_file(disk_number)
      sprintf((@output_dir + TIME_TABLE_FORMAT).to_s, disk_number)
    end

    def masking_file_for_beggining
      sprintf((@working_dir + MASKING_FILE_FORMAT).to_s, 1)
    end
    
    def masking_file_for_losing
      sprintf((@working_dir + MASKING_FILE_FORMAT).to_s, 2)
    end
  end
end