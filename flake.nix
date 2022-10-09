{
  description = "A very basic flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux = 
    with import nixpkgs {system = "x86_64-linux";};
    
    pkgs.mkShell rec {
    
    name = "impurePythonEnv";
    
    venvDir = "./.venv";
    
    buildInputs = [
        
    python38Packages.python #set your python interpreter for the project
    ];

    
    shellHook = ''
        set -h #remove "bash: hash: hashing disabled" warning !
        SOURCE_DATE_EPOCH=$(date +%s)
        if ! [ -d "${venvDir}" ]; then
        python -m venv "${venvDir}"
        fi
        export LD_LIBRARY_PATH="${lib.makeLibraryPath [ zlib stdenv.cc.cc ]}":LD_LIBRARY_PATH;
        source "${venvDir}/bin/activate"
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        python main.py
    '';
    };

  };
}
