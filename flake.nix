{
  description = ''Convert strings to a slug. Can be used for URLs, file names, IDs etc.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."slugify-main".url = "path:./main";
  inputs."slugify-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."slugify-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."slugify-v0_1_0".url = "path:./v0_1_0";
  inputs."slugify-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."slugify-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."slugify-v0_2_0".url = "path:./v0_2_0";
  inputs."slugify-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."slugify-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}