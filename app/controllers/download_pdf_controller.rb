class DownloadPdfController < ApplicationController
  def index
    render pdf: 'foobar'
  end
end
