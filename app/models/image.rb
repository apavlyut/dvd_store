require 'rubygems'
require 'RMagick'

class Image < ActiveRecord::Base
  belongs_to :product, :foreign_key => "screenshot_id"
  ImgDir = "#{RAILS_ROOT}/public/images/covers"
  # run write_file after save to db
  #before_save :write_file
  
  # run delete_file method after removal from db
  after_destroy :delete_file
  
  def create_screenshot(file_data)
    logger.info("create_screenshot ... ")
    if file_data && file_data != ""
      logger.info("if @file_data ... ")
      
      height = 120
      
      img =  Magick::Image.from_blob(file_data.read).first
      
      height = 120
      
      width = height * img.columns / img.rows
      
      thumb = img.resize_to_fill(width, height)
      #thumb = img.resize(img_size[:thumb][:width], img_size[:thumb][:height])
      
      logger.info "image filename is :#{filename}"
      
      self.filename = file_data.original_filename
      
      logger.info "And now filename is :#{filename}"
      
      logger.info "Writing big_image ..."
      if img.write("#{ImgDir}/screenshot_#{file_data.original_filename}")
        logger.info "Ok writing big screenshot"
      else
        logger.error "False to write big screenshot"
      end
      
      logger.info "Writing th_image ..."
      if thumb.write("#{ImgDir}/screenshot_th_#{file_data.original_filename}")
        logger.info "Ok writing small screenshot"
      else
        logger.error "False to write small screenshot"
      end
      
    end
    
  end
  
  def create_cover(file_data)
    logger.info("create_images ... ")
    
    if file_data
      logger.info("if @file_data ... ")
      
      img_size = {
            :main => {
                :width => 205,
                :height => 292 
            },
            :thumb => {
                :width => 137, 
                :height => 196 
            }
      }
      
      img =  Magick::Image.from_blob(file_data.read).first
      
      large = img.resize_to_fill(img_size[:main][:width], img_size[:main][:height])
      thumb = img.resize_to_fill(img_size[:thumb][:width], img_size[:thumb][:height])
      
      logger.info "image filename is :#{filename}"
      
      self.filename = file_data.original_filename
      
      logger.info "And now filename is :#{filename}"
      
      logger.info "Writing big_image ..."
      if large.write("#{ImgDir}/cover_#{file_data.original_filename}")
        logger.info "Ok writing big image"
      else
        logger.error "False to write big image"
      end
      
      logger.info "Writing th_image ..."
      if thumb.write("#{ImgDir}/cover_th_#{file_data.original_filename}")
        logger.info "Ok writing big image"
      else
        logger.error "False to write big image"
      end
      
    end
    
  end
  
  def delete_file
    FileUtils.rm_rf("#{ImgDir}/cover_#{filename}")
    FileUtils.rm_rf("#{ImgDir}/cover_th_#{filename}")
    
    FileUtils.rm_rf("#{ImgDir}/screenshot_#{filename}")
    FileUtils.rm_rf("#{ImgDir}/screenshot_th_#{filename}")
  end
  
end
