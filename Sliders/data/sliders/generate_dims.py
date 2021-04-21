import random
import json
import requests
import os
import shutil

CONST_block_tags_json = requests.get("https://raw.githubusercontent.com/Arcensoth/mcdata/branch-1.16/processed/data/minecraft/tags/blocks/data.min.json").json()
CONST_biomes_json = requests.get("https://raw.githubusercontent.com/Arcensoth/mcdata/branch-1.16/processed/reports/biomes/data.min.json").json()
CONST_dim_count = 1000

dimension_folder = os.path.join(os.getcwd(), "sliders", "dimension")
dimension_type_folder = os.path.join(os.getcwd(), "sliders", "dimension_type")

if os.path.exists(dimension_folder):
    shutil.rmtree(dimension_folder)
if os.path.exists(dimension_type_folder):
    shutil.rmtree(dimension_type_folder)

os.makedirs(dimension_folder)
os.makedirs(dimension_type_folder)

# Generate dimension types
for x in range(1, CONST_dim_count):
    with open(os.path.join(dimension_type_folder, f"{x}.json"), "w") as outfile:
        json.dump({
            "ultrawarm": bool(random.getrandbits(1)),
            "natural": bool(random.getrandbits(1)),
            "coordinate_scale": random.randint(25, 250) / 100,
            "has_skylight": bool(random.getrandbits(1)),
            "has_ceiling": bool(random.getrandbits(1)),
            "ambient_light": random.randint(0, 100) / 100,
            "fixed_time": random.randint(0, 24000),
            "piglin_safe": bool(random.getrandbits(1)),
            "bed_works": bool(random.getrandbits(1)),
            "respawn_anchor_works": bool(random.getrandbits(1)),
            "has_raids": bool(random.getrandbits(1)),
            "logical_height": random.randint(0, 255),
            "infiniburn": random.choice(CONST_block_tags_json["values"]),
            "effects": random.choice(["minecraft:overworld", "minecraft:the_nether", "minecraft:the_end"])
        }, outfile, indent=4)

# Generate dimensions
for x in range(1, CONST_dim_count):
    with open(os.path.join(dimension_folder, f"{x}.json"), "w") as outfile:
        random_seed = random.randint(0, 18446744073709551616)
        dimension_json = {
            "type": f"sliders:{x}",
            "generator": {
                # minecraft:flat and minecraft:debug are ommited since they're boring to play in
                "type": "minecraft:noise",
                "seed": random_seed,
                # TODO generate worldgen settings
                "settings": random.choice(["minecraft:overworld", "minecraft:amplified", "minecraft:floating_islands"]),
                "biome_source": {
                    "seed": random_seed,
                    "type": random.choice(["minecraft:vanilla_layered", "minecraft:fixed", "minecraft:checkerboard", "minecraft:multi_noise", "minecraft:the_end"])
                }
            }
        }

        biome_source_type = dimension_json["generator"]["biome_source"]["type"]
        if biome_source_type == "minecraft:checkerboard" or biome_source_type == "minecraft:multi_noise":
            dimension_json["generator"]["biome_source"]["biomes"] = random.sample(CONST_biomes_json["values"], random.randint(1, len(CONST_biomes_json["values"])))

        if biome_source_type == "minecraft:vanilla_layered":
            dimension_json["generator"]["biome_source"]["large_biomes"] = bool(random.getrandbits(1))
        elif biome_source_type == "minecraft:fixed":
            dimension_json["generator"]["biome_source"]["biome"] = random.choice(CONST_biomes_json["values"])
        elif biome_source_type == "minecraft:checkerboard":
            dimension_json["generator"]["biome_source"]["biomes"] = random.sample(CONST_biomes_json["values"], random.randint(1, len(CONST_biomes_json["values"])))
            dimension_json["generator"]["biome_source"]["scale"] = random.randint(1, 62)
        elif biome_source_type == "minecraft:multi_noise":
            chance_single_biome = random.randint(1, 10)
            if chance_single_biome == 3:
                dimension_json["generator"]["biome_source"]["preset"] = "minecraft:nether"
            else:
                selected_biomes = random.sample(CONST_biomes_json["values"], random.randint(1, len(CONST_biomes_json["values"])))
                dimension_json["generator"]["biome_source"]["biomes"] = []
                for biome in selected_biomes:
                    dimension_json["generator"]["biome_source"]["biomes"].append({
                        "biome": biome, 
                        "parameters": {
                            "altitude": random.randint(-200, 200) / 100,
                            "weirdness": random.randint(-200, 200) / 100,
                            "offset": random.randint(0, 100) / 100,
                            "temperature": random.randint(-200, 200) / 100,
                            "humidity": random.randint(-200, 200) / 100
                        }
                    })
            for noise_type in ["altitude_noise", "weirdness_noise", "temperature_noise", "humidity_noise"]:
                dimension_json["generator"]["biome_source"][noise_type] = {
                    "firstOctave": random.randint(-10, 0),
                    "amplitudes": [random.randint(-100, 100) / 100 for i in range(random.randint(1, 5))]
                }

        json.dump(dimension_json, outfile, indent=4)
