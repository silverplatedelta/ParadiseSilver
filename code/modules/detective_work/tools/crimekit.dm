//crime scene kit
/obj/item/storage/briefcase/crimekit
	name = "crime scene kit"
	desc = "A stainless steel-plated carrycase for all your forensic needs. Feels heavy."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case"
	item_state = "case"
	startswith = list(
		/obj/item/storage/box/swabs,
		/obj/item/storage/box/fingerprints,
		/obj/item/reagent_containers/spray/luminol,
		/obj/item/device/uv_light,
		/obj/item/forensics/sample_kit,
		/obj/item/forensics/sample_kit/powder,
		/obj/item/storage/csi_markers
	)
	contents_allowed = list(
		/obj/item/storage/box/swabs,
		/obj/item/storage/box/fingerprints,
		/obj/item/storage/box/evidence,
		/obj/item/reagent_containers/spray/luminol,
		/obj/item/device/uv_light,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/forensics/swab,
		/obj/item/sample/print,
		/obj/item/sample/fibers,
		/obj/item/device/taperecorder,
		/obj/item/device/tape,
		/obj/item/clothing/gloves,
		/obj/item/folder,
		/obj/item/paper,
		/obj/item/photo,
		/obj/item/paper_bundle,
		/obj/item/forensics/sample_kit,
		/obj/item/device/camera,
		/obj/item/device/taperecorder,
		/obj/item/device/tape,
		/obj/item/storage/csi_markers,
		/obj/item/device/scanner,
		/obj/item/modular_computer/tablet,
		/obj/item/evidencebag
	)
//Storage items for forensics equipment
/obj/item/reagent_containers/spray/luminol
	name = "luminol bottle"
	desc = "A bottle containing an odourless, colorless liquid."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "luminol"
	item_state = "cleaner"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = "5;10"
	volume = 250

/obj/item/reagent_containers/spray/luminol/New()
	..()
	reagents.add_reagent(/datum/reagent/luminol, 250)

/obj/item/storage/box/swabs
	name = "box of swab kits"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	startswith = list(/obj/item/forensics/swab = DEFAULT_BOX_STORAGE)

/obj/item/storage/box/evidence
	name = "evidence bag box"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	desc = "A box claiming to contain evidence bags."
	startswith = list(/obj/item/evidencebag = 7)

/obj/item/storage/box/fingerprints
	name = "box of fingerprint cards"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	startswith = list(/obj/item/sample/print = DEFAULT_BOX_STORAGE)
