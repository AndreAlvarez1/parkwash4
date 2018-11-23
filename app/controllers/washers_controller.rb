class WashersController < ApplicationController
  load_and_authorize_resource

  def index
    @washer = current_washer
    @washers = Washer.all

    # mg_client = Mailgun::Client.new(ENV["MAILGUN_API_KEY"])
    #
    # message_params =  {
    #                    from: 'nicoalamo@gmail.com',
    #                    to:   'n.alamo.salazar@gmail.com',
    #                    subject: 'The Ruby SDK is awesome!',
    #                    text:    'It is really easy to send a message!'
    #                   }
    #
    # result = mg_client.send_message('gmail.com', message_params).to_h!
    #
    # message_id = result['id']
    # message = result['message']

      respond_to do |format|

        # Sends email to user when user is created.
        ModelMailer.sample_email(current_washer).deliver

        format.html { redirect_to root_path, notice: 'EMAIL SENT! I think' }
        format.json { render :show, status: :created, location: @user }

      end
  end

  def show
    @washer = current_washer
  end


end
