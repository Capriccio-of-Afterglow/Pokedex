package spring.mvc.model.entity;
/*
1. 持有寶可夢

+-----------+-------------+----------+-----------+----------+
| pokemonId | pokemonName |  typeId  | evolution |    cp    |
+-----------+-------------+----------+-----------+----------+
|    001    |  Bulbasaur  |    01    |   true    |    10    |
|    002    |  Ivysaur    |    01    |   true    |    15    |
|    003    |  Venusaur   |    01    |   false   |    05    |
|    004    |  Charmander |    02    |   true    |    20    |
|    005    |  Charmeleon |    02    |   true    |    03    | 
|    006    |  Charizard  |    02    |   false   |    25    |
|    778    |  Mimikyu    |    10    |   false   |    35    |
+-----------+-------------+----------+-----------+----------+
*/
public class UserPokemon {
	private Integer pokemonId; // 圖鑑編號
	private String pokemonName; // 寶可夢名稱
	private Integer typeId; // 屬性ID
	private Integer cp; // cp值
	
	
	public UserPokemon() {
		super();
	}


	public Integer getPokemonId() {
		return pokemonId;
	}


	public void setPokemonId(Integer pokemonId) {
		this.pokemonId = pokemonId;
	}


	public String getPokemonName() {
		return pokemonName;
	}


	public void setPokemonName(String pokemonName) {
		this.pokemonName = pokemonName;
	}


	public Integer getTypeId() {
		return typeId;
	}


	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}


	public Integer getCp() {
		return cp;
	}


	public void setCp(Integer cp) {
		this.cp = cp;
	}


	public UserPokemon(Integer pokemonId, String pokemonName, Integer typeId, Integer cp) {
		super();
		this.pokemonId = pokemonId;
		this.pokemonName = pokemonName;
		this.typeId = typeId;
		this.cp = cp;
	}
}
