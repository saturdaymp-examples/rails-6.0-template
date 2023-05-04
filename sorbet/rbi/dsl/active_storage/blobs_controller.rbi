# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ActiveStorage::BlobsController`.
# Please instead update this file by running `bin/tapioca dsl ActiveStorage::BlobsController`.

class ActiveStorage::BlobsController
  sig { returns(HelperProxy) }
  def helpers; end

  module HelperMethods
    include ::ActionText::ContentHelper
    include ::ActionText::TagHelper
    include ::Webpacker::Helper
  end

  class HelperProxy < ::ActionView::Base
    include HelperMethods
  end
end
