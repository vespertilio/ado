class UploadController < ApplicationController
  def index
     render :file => 'app\views\upload\uploadfile.html.erb'
  end
  def uploadfile
    uploaded_io = params[][:upload]
    File.open(Rails.root.join('public', 'uploads', "message#{params[:id]}"), 'wb') do |file| file.write(uploaded_io.read) end
    render :text => "File has been uploaded successfully"
  end
end
