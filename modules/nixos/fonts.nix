{ inputs, config, lib, pkgs, pkgs-iosevka-pin, ... }: {
	fonts.packages = with pkgs;
		let
			iosevka-custom = (
				pkgs-iosevka-pin.iosevka.override {
					set = "Custom";
					privateBuildPlan = {
						family = "Iosevka Custom";
						spacing = "FontConfig Mono";
						serifs = "Sans";
						noCvSs = true;
						exportGlyphNames = true;
						variants.design = {
							at = "fourfold";
							lig-equal-chain = "without-notch";
							lig-hyphen-chain = "without-notch";
						};
						ligations = {
							inherits = "dlig";
							disables = [
								"brack-bar"
								"brace-bar"
							];
							enables = [
								"exeqeq"
								"eqeqeq"
								"llggeq"
								"tildeeq"
							];
						};
					};
				}
			);
		in
	[
			iosevka-custom
			(pkgs.iosevka-bin.override { variant = "Etoile"; })
			(pkgs.iosevka-bin.override { variant = "Aile"; })
	];
	fonts.fontconfig = {
		enable = true;
		antialias = true;
		hinting.enable = true;
	};
}
