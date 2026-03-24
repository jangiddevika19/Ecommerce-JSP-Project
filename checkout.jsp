<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link rel="stylesheet" href="css/checkout.css?v=2">
<link rel="stylesheet" href="css/common.css?v=2">
</head>
<body>

<div class="main-container">
    <div class="form-box">
        <h2>Payment </h2>
        <p class="subtitle">Enter your card details to complete the order</p>

        <form action="OrderServlet" method="post">
            <input type="text" name="cardNumber" placeholder="Card Number" required>
            <input type="text" name="cardName" placeholder="Name on Card" required>

            <div class="row">
                <input type="text" name="expiry" placeholder="MM/YY" required>
                <input type="password" name="cvv" placeholder="CVV" required>
            </div>

            <input type="submit" class="btn" value="Pay Now">
        </form>
    </div>
</div>

</body>
</html>