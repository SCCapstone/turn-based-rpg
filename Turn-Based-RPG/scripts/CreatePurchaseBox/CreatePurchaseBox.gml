function CreatePurchaseBox(_player, _shop_item){
	if (_player._disabled == false) {
	_player._disabled = true;
		_shoptextbox = instance_create_layer(100, 100, "Player", obj_purchase_box);
	
		_shoptextbox._shop_text = _shop_item._shop_text;
		_shoptextbox._shop_speaker = _shop_item._shop_speaker;
		_shoptextbox._item = _shop_item._item;
		_shoptextbox._item_price = _shop_item._item_price;
	}
}