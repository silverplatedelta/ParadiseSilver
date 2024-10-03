//crime scene kit
/obj/item/storage/briefcase/crimekit
	name = "crime scene kit"
	desc = "A stainless steel-plated carrycase for all your forensic needs. Feels heavy."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case"
	item_state = "case"
	can_hold = list(
		/obj/item/storage/box/swabs,
		/obj/item/storage/box/fingerprints,
		/obj/item/storage/box/evidence,
		/obj/item/reagent_containers/spray/luminol,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/forensics/swab,
		/obj/item/sample/print,
		/obj/item/sample/fibers,
		/obj/item/clothing/gloves,
		/obj/item/folder,
		/obj/item/paper,
		/obj/item/photo,
		/obj/item/paper_bundle,
		/obj/item/forensics/sample_kit,
		/obj/item/camera,
		/obj/item/taperecorder,
		/obj/item/tape,
		/obj/item/storage/csi_markers,
		/obj/item/evidencebag
	)

/obj/item/storage/breifcase/crimekit/populate_contents()
	new /obj/item/storage/box/swabs(src)
	new /obj/item/storage/box/fingerprints(src)
	new /obj/item/reagent_containers/spray/luminol(src)
	new /obj/item/forensics/sample_kit(src)
	new /obj/item/forensics/sample_kit/powder(src)
	new /obj/item/storage/csi_markers(src)

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

/obj/item/storage/box/swabs/populate_contents()
	for(var/I in 1 to 5)
		new /obj/item/forensics/swab(src)

/obj/item/storage/box/evidence
	name = "evidence bag box"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	desc = "A box claiming to contain evidence bags."

/obj/item/storage/box/evidence/populate_contents()
	for(var/I in 1 to 5)
		new /obj/item/forensics/swab(src)

/obj/item/storage/box/fingerprints
	name = "box of fingerprint cards"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"

/obj/item/storage/box/fingerprints/populate_contents()
	for(var/I in 1 to 5)
		new /obj/item/sample/print(src)
