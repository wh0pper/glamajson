module Response
  def json_response(object, inclusions, status = :ok)
    print inclusions
    render json: object, include: inclusions, status: status
  end
end
