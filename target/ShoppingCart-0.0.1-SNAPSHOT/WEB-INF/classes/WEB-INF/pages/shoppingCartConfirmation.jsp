<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Potwierdzenia zamowienia</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
  <jsp:include page="_header.jsp" />
 
  <jsp:include page="_menu.jsp" />
 
  <fmt:setLocale value="en_US" scope="session"/>
 
  <div class="page-title">Potwierdzenie</div>
 
 
 
  <div class="customer-info-container">
      <h3>Informacja o kupujacym:</h3>
      <ul>
          <li>Imie: ${myCart.customerInfo.name}</li>
          <li>Email: ${myCart.customerInfo.email}</li>
          <li>Telefon: ${myCart.customerInfo.phone}</li>
          <li>Adres: ${myCart.customerInfo.address}</li>
      </ul>
      <h3>Podsumowanie:</h3>
      <ul>
          <li>Ilosc: ${myCart.quantityTotal}</li>
          <li>W sumie:
          <span class="total">
            <fmt:formatNumber value="${myCart.amountTotal}" type="currency"/>
          </span></li>
      </ul>
  </div>
 
  <form method="POST"
      action="${pageContext.request.contextPath}/shoppingCartConfirmation">
 
      <!-- Edytuj koszyk -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCart">Edytuj Koszyk</a>
 
      <!-- Edytuj swoje dane -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCartCustomer">Edytuj swoje dane</a>
 
      <!-- Wyslij/Zapisz -->
      <input type="submit" value="Send" class="button-send-sc" />
  </form>
 
  <div class="container">
 
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
          <div class="product-preview-container">
              <ul>
                  <li><img class="product-image"
                      src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></li>
                  <li>Kod: ${cartLineInfo.productInfo.code} <input
                      type="hidden" name="code" value="${cartLineInfo.productInfo.code}" />
                  </li>
                  <li>Nazwa: ${cartLineInfo.productInfo.name}</li>
                  <li>Cena: <span class="price">
                     <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                  </span>
                  </li>
                  <li>Ilosc: ${cartLineInfo.quantity}</li>
                  <li>Podsumowanie:
                    <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                    </span>
                  </li>
              </ul>
          </div>
      </c:forEach>
 
  </div>
 
  <jsp:include page="_footer.jsp" />
 
</body>
</html>