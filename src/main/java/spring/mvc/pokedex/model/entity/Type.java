package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Type {

	Integer typeId;
	
	String typeName;
	
	@Override
    public String toString() {
        return String.valueOf(typeId);
    }
}
