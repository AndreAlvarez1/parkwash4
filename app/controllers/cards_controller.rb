class CardsController < InheritedResources::Base

  def index
    @user = current_user
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    # debugger
    @card = Card.create(card_params)
    @card.user_id = current_user.id
    @card.active = false
    @card.erased = false
    # render json: @vehicle.as_json
    respond_to do |format|
      if @card.save
        format.html { redirect_to user_cards_path(current_user), notice: 'Card was successfully created.' }
        # format.js
        format.json { render @card, status: :created}
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate
    @card = Card.find(params[:id])
    if @card.active
      @card.active = false
    else
      @card.active = true
    end
    @card.save

    respond_to do |format|
      format.html { redirect_to user_cards_path(current_user), notice: 'El estado de la tarjeta se cambió exitosamente' }
      format.json { head :no_content }
    end

  end

  # def erase
  #   @card.toggle(:erase).save
  # end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'La Tarjeta de Crédito ha sido borrada' }
      format.json { head :no_content }
    end
  end






  private

    def card_params
      params.require(:card).permit(:user_id, :number, :active, :erased)
    end
end
