module ApplicationHelper
  def story_format(content)
    return nil if content.blank?
    items = content.split("\n")

    xml = Builder::XmlMarkup.new
    xml.ol do
      items.each do |item|
        xml.li do |li|
          li << h(item)
        end
      end
    end
  end

  def contextual_new_story_path
    if @iteration && !@iteration.new_record? && @iteration.pending?
      [:new, @project, @iteration, :story]
    elsif @project
      [:new, @project, :story]
    else
      new_story_path
    end
  end

  def body_classes
    @body_classes ||= [controller.controller_name]
  end

  def render_flash
    return nil if flash.keys.empty?
    xml = Builder::XmlMarkup.new
    xml.div :class => 'flash' do
      flash.each do |type, message|
        next if message.blank?
        xml.div :class => type do
          xml.h2 type.to_s.titleize
          xml.p do |p|
            p << message
          end
        end
      end
    end
  end

end
