# Potter API 
An API created for the students of Professor Gallaugher's Swift class for their second midterm. 

# Usage

### Get All Spells
`Endpoint`: https://potterspells.herokuapp.com/api/v1/spells

`Response`:

```json
{
  "results": [
    {
      "id": 1,
      "soundFile": "Accio_Dittany",
      "name": "Accio Dittany",
      "description": "Accio Dittany will summon a dittany, if available. Dittany is a magical plant used in Potion-Making, and is a powerful healing herb and restorative. Use this when you are injured and need healing.",
      "url": "https://potterspells.herokuapp.com/api/v1/spell/1"
    }
  ]
}
```

### Get Single Spell
`Endpoint`: https://potterspells.herokuapp.com/api/v1/spell/spell_id

`Response`:

```json
{
    "id": 1,
    "soundFile": "Accio_Dittany",
    "name": "Accio Dittany",
    "description": "Accio Dittany will summon a dittany, if available. Dittany is a magical plant used in Potion-Making, and is a powerful healing herb and restorative. Use this when you are injured and need healing.",
    "url": "https://potterspells.herokuapp.com/api/v1/spell/1"
}
```