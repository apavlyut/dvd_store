module Management::OrdersHelper
  def human_is_captured(order)
    "Размещен" if order.is_captured
    "В процессе" unless order.is_captured
  end
end
