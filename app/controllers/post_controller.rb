class PostController < ApplicationController

  before_action :authenticate_user!

  skip_before_filter :verify_authenticity_token, :only => [:create, :show]

  def create
     
        



  #       uploaded_file = params[:image]
  #   filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
  #   filepath = Dir.pwd + "/public/uploads/" + filename
  # File.open(filepath,'wb') do |file|
  #   file.write(uploaded_file.read())



    content_came = params[:content];
    image_came = params[:image];
    @post = Post.new
    @post = current_user.posts.create(post_params)
    # dash = params[:image_cache];
    # @post.image = image_came;
    # @post.content = content_came;
    @post.user_id = current_user.id;
     # current_user.posts.create(content: content_came , image: image_came);
     @post.save!
     respond_to do |format|
      
      format.html{
        redirect_to '/', notice: 'Post was successfully created.' 

      }
  	
      format.js {}


   
      
      
    end
     
  end

  def post_params
    params.require(:post).permit(:content , :image , :video)
  end

  def create_post
    
    
      return redirect_to '/'
  
  end

  def create_comment
    
    content = params[:comment_content];
  
    commentid=params[:post_id]
    
    current_user.comments.create(content: content , post_id: commentid)
    return redirect_to '/';
   

    
  end
   def show
    @post=Post.find(params[:id])
  end

  def edit

  end

  def delete
      
      
  		id = params[:id]
      
  		post = Post.find(id);
      if post
      if post.user_id == current_user.id
  		post.destroy
    end
  		return redirect_to '/';
    end
    
  end
end
