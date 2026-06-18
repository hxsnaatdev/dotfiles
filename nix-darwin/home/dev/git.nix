{config, ...} : {
    flake.modules.homeManger.git = {
        programs = {
            git = {
                enable = true;
                settings.user = {
                    name = config.user.usernme;
                    inherit (config.user) email;
                  };
              };
          };
      };
  }
