# frozen_string_literal: true

# name: discourse-append-tag-apim
# about: Appends the apim tag to sync1,sync2,sync3,sync4 tagged topics
# version: 0.1
# authors: CyanLabs

after_initialize do
  DiscourseEvent.on(:topic_created) do |topic|
    guardian = Guardian.new(Discourse.system_user)
    required_tag_names = ["sync1", "sync2", "sync3", "sync4"]
    DiscourseTagging.tag_topic_by_names(topic, guardian, ["apim"], append: true) if topic.tags.exists?(name: required_tag_names)
  end
end
