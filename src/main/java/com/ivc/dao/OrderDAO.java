package com.ivc.dao;
 
import java.util.List;
 


import com.ivc.model.CartInfo;
import com.ivc.model.OrderDetailInfo;
import com.ivc.model.OrderInfo;
import com.ivc.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}