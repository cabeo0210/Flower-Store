/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.cart;

import fu.dtos.ProductDTO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Asus
 */
public class CartObject implements Serializable {

    Map<String, ProductDTO> list;

    public Map<String, ProductDTO> getList() {
        return list;
    }

    public void addToCart(ProductDTO dto) {
        if(this.list == null){
            this.list = new HashMap<>();
        }
        if(this.list.containsKey(dto.getId())){
            dto.setQuantity(list.get(dto.getId()).getQuantity() + dto.getQuantity());
        }
        this.list.put(dto.getId(), dto);
    }
    
    public void removeOrderItem(String id) {
        if (this.list == null) {
            return;
        }
        if (this.list.containsKey(id)) {
            this.list.remove(id);
            if (this.list.isEmpty()) {
                this.list = null;
            }
        }
    }
}
