var cart = {
    init: function () {
        cart.loadData();
        cart.registerEvent();
    },
        
    registerEvent: function () {
      
        $('#btnDeleteAll').off('click').on('click', function () {
            cart.deleteAll();
        });
        $('#btnContinue').off('click').on('click', function (e) {
            e.preventDefault();
            window.location.href = "/";
        });
        $('#btnCheckout').off('click').on('click', function (e) {
            e.preventDefault();
            cart.updateAll();
            window.location.href = "/thanh-toan.html";
        });
        $('#btnGetInfo').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: "/ShoppingCart/GetUser",
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status === true) {
                        $('#NameShip').val(response.user.FullName);
                        $('#AddressShip').val(response.user.Address);
                        $('#PhoneShip').val(response.user.PhoneNumber);
                    }
                    else {
                        alert("Bạn chưa đăng nhập");
                    }
                }
            })
        });
        function loadCart() {
            $.ajax({
                url: "/Home/GetCart",
                type: "POST",
                dataType: "json",
                success: function (respon) {
                    $('.qty').text(respon.quantity);
                    $('.price').text(respon.price);
                }
            });
        }
        
        $('#totalPrice').text(numeral(cart.getTotalOrder()).format('0,0'));
        $('.txtQuantity').off('keyup').on('keyup', function () {
            var quantity = parseInt($(this).val());
            var productID = parseInt($(this).data('id'));
            var color = parseInt($(this).data('color'));
            var price = parseFloat($(this).data('price'));
            var quantityInventory = parseInt($(this).data('quantityinventory'));
            if (isNaN(quantity) === false) {
                if (quantity <= 0) cart.deleteItem(productID);
                else {
                    if (quantity > quantityInventory) {
                        alert("Không đủ số lượng trong kho\n"+"Chỉ còn "+quantityInventory+" sản phẩm");
                        $(this).val(quantityInventory);
                    }
                    else {
                        var amount = price * quantity;
                        var text = '#amount_' + productID + color;

                        $('#amount_' + productID + color).text(numeral(amount).format('0,0'));
                        $('#totalPrice').text(numeral(cart.getTotalOrder()).format('0,0'));
                    }

                }
            }
            else {
                $('#totalPrice').text(numeral(cart.getTotalOrder() + 0).format("0,0"));
                $('#amount_' + productID).text(0);
            }
        });
        $('.txtQuantity').off('click').on('click', function () {
            var quantity = parseInt($(this).val());
            var color = ($(this).data('color'));
            var productID = parseInt($(this).data('id'));
            var price = parseFloat($(this).data('price'));
            var quantityInventory = parseInt($(this).data('quantityinventory'));
            if (isNaN(quantity) === false) {
                if (quantity <= 0) cart.deleteItem(productID);
                else {
                    if (quantity > quantityInventory) {
                        alert("Không đủ số lượng trong kho");
                        $(this).val(quantityInventory);
                    }
                    else {
                        var amount = price * quantity;
                        var text = '#amount_' + productID + color;

                        $('#amount_' + productID + color).text(numeral(amount).format('0,0'));
                        $('#totalPrice').text(numeral(cart.getTotalOrder()).format('0,0'));
                    }
                   
                }
            }
            else {
                $('#amount_' + productID).text(0);
                $('#totalPrice').text(numeral(cart.getTotalOrder()+0).format("0,0"));
            }

        });
        $('.btnAddToCart').off('click').on('click', function (e) {
            e.preventDefault();
            var productID = parseInt($(this).data('id'));
            var quantity;
            var color = "trắng";
            if (!isNaN($('#quantity').val())){
                quantity = parseInt($('#quantity').val());
            }
           
            var colorName = ($(this).data('color'));
            if (isNaN($('#quantity').val()))
            {
                quantity = null;
            }
            if (colorName !== "trắng"&&colorName!==undefined) {
               color=colorName
            }

            cart.addItem(productID, quantity, color);
            loadCart();
        });
        loadCart();
        $('.btnDeleteItem').off('click').on('click', function (e) {
            e.preventDefault();
            var productID = parseInt($(this).data('id'));
            
            cart.deleteItem(productID);
        });
    },
    addItem: function (productID,quantity,color) {
        $.ajax({
            url: "/ShoppingCart/Add",
            data: {
                productId: productID,
                quantity: quantity,
                color: color
            },
            type: 'POST',
            dataType: "json",
            success: function (response) {
                if (response.status === true) {
                    alert('Thêm sản phẩm thành công');
                }
                else {
                    alert(response.message);
                }
            }
        });
    },
    
    getLoginUser: function () {
        $.ajax({
            url: '/ShoppingCart/GetUser',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var user = response.data;
                    $('#txtName').val(user.FullName);
                    $('#txtAddress').val(user.Address);
                    $('#txtEmail').val(user.Email);
                    $('#txtPhone').val(user.PhoneNumber);
                }
            }
        });
    },

    createOrder: function () {
        var order = {
            CustomerName: $('#txtName').val(),
            CustomerAddress: $('#txtAddress').val(),
            CustomerEmail: $('#txtEmail').val(),
            CustomerMobile: $('#txtPhone').val(),
            CustomerMessage: $('#txtMessage').val(),
            PaymentMethod: $('input[name="paymentMethod"]:checked').val(),
            BankCode: $('input[groupname="bankcode"]:checked').prop('id'),
            Status: false
        }
        $.ajax({
            url: '/ShoppingCart/CreateOrder',
            type: 'POST',
            dataType: 'json',
            data: {
                orderViewModel: JSON.stringify(order)
            },
            success: function (response) {
                if (response.status) {
                    if (response.urlCheckout !== undefined && response.urlCheckout !== '') {

                        window.location.href = response.urlCheckout;
                    }
                    else {
                        console.log('create order ok');
                        $('#divCheckout').hide();
                        cart.deleteAll();
                        setTimeout(function () {
                            $('#cartContent').html('Cảm ơn bạn đã đặt hàng thành công. Chúng tôi sẽ liên hệ sớm nhất.');
                        }, 2000);
                    }

                }
                else {
                    $('#divMessage').show();
                    $('#divMessage').text(response.message);
                }
            }
        });
    },
    getTotalOrder: function () {
        var listTextBox = $('.txtQuantity');
        var total = 0;
        $.each(listTextBox, function (i, item) {
            var number = $(item).val();
            if (number!=="") {
                total += parseInt($(item).val()) * parseFloat($(item).data('price'));
            }
         
        });
        return total;
    },
    deleteAll: function () {
        $.ajax({
            url: '/ShoppingCart/DeleteAll',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    cart.loadData();
                    alert("Đã làm mới thành công");
                }
            }
        });
    },
    updateAll: function () {
        var cartList = [];
        $.each($('.txtQuantity'), function (i, item) {
            cartList.push({
                ProductID: $(item).data('id'),
                Quantity: $(item).val(),
                Color:$(item).data('color')
            });
        });
        $.ajax({
            url: '/ShoppingCart/Update',
            type: 'POST',
            data: {
                cartData: JSON.stringify(cartList)
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    cart.loadData();
                    console.log('Update ok');
                }
            }
        });
    },
    deleteItem: function (productId) {
        $.ajax({
            url: '/ShoppingCart/DeleteItem',
            data: {
                productId: productId
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    cart.loadData();
                }
            }
        });
    },
    loadData: function () {
        $.ajax({
            url: "/ShoppingCart/GetAll",
            type: 'GET',
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    var template = $('#tplCart').html();
                    var html = '';
                    var data = res.data;
                    $.each(data, function (i, item) {
                        switch (item.Color) {
                            case 'đen': item.Product.Price += 200000; break;
                            case 'đỏ': item.Product.Price += 500000; break;
                            case 'vàng đất': item.Product.Price += 500000; break;
                            default: break;
                        }
                        html += Mustache.render(template, {
                            ProductID: item.ProductID,
                            ProductName: item.Product.Name,
                            Image: item.Product.Image,
                            Color: item.Color,
                            Alias:item.Product.Alias,
                            Price: item.Product.Price,
                            PriceF: numeral(item.Product.Price).format('0,0'),
                            QuantityInventory:item.Product.Quantity,
                            Quantity: item.Quantity,
                            Amount: numeral(item.Quantity * item.Product.Price).format('0,0')
                        });
                    });

                    $('#cartBody').html(html);
                    var url = window.location.pathname;
                    if (html === '' && url ==="/gio-hang.html") {
                        alert("Chưa có sản phẩm nào trong giỏ hàng");
                        window.location.href = "/";
                    }
                    cart.registerEvent();
                   
                }
            }
        })
    }
}
cart.init();