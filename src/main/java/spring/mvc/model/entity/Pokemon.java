package spring.mvc.model.entity;

/*
1. 寶可夢

+-----------+-------------+----------+-----------+
| pokemonId | pokemonName |  typeId  | evolution |
+-----------+-------------+----------+-----------+
|    001    |  Bulbasaur  |    01    |   true    |
|    002    |  Ivysaur    |    01    |   true    |
|    003    |  Venusaur   |    01    |   false   |
|    004    |  Charmander |    02    |   true    |
|    005    |  Charmeleon |    02    |   true    |
|    006    |  Charizard  |    02    |   false   |
|    778    |   Mimikyu   |    10    |   false   |
+-----------+-------------+----------+-----------+
*/

public class Pokemon {
	private Integer pokemonId; // 圖鑑編號
	private String pokemonName; // 寶可夢名稱
	private Integer typeId; // 屬性ID
	private boolean evolution; // 可否進化
	
	public Pokemon() {
		
	}

	public Pokemon(Integer pokemonId, String pokemonName, Integer typeId, boolean evolution) {
		super();
		this.pokemonId = pokemonId;
		this.pokemonName = pokemonName;
		this.typeId = typeId;
		this.evolution = evolution;
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

	public boolean isEvolution() {
		return evolution;
	}

	public void setEvolution(boolean evolution) {
		this.evolution = evolution;
	}
	
}
