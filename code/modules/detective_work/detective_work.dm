/obj/item/forensics
	icon = 'icons/obj/forensics.dmi'
	w_class = WEIGHT_CLASS_TINY

//This is the output of the stringpercent(print) proc, and means about 80% of
//the print must be there for it to be complete.  (Prints are 32 digits)
var/global/const/FINGERPRINT_COMPLETE = 6
/proc/is_complete_print(print)
	return stringpercent(print) <= FINGERPRINT_COMPLETE

/obj/item/var/list/trace_DNA


/**
 * Adds forensics fibers to the atom from clothing worn by a mob.
 *
 * **Parameters**:
 * - `M` - The mob to pull fibers from.
 */
/atom/proc/add_fibers(mob/living/carbon/human/M)
	if(!istype(M))
		return
	if(M.gloves && istype(M.gloves,/obj/item/clothing/gloves))
		var/obj/item/clothing/gloves/G = M.gloves
		if(G.transfer_blood) //bloodied gloves transfer blood to touched objects
			if(add_blood(M.bloody_hands_mob)) //only reduces the bloodiness of our gloves if the item wasn't already bloody
				G.transfer_blood--
	else if(M.bloody_hands)
		if(add_blood(M.bloody_hands_mob))
			M.bloody_hands--

	var/fibertext
	var/item_multiplier = istype(src,/obj/item)?1.2:1
	var/suit_coverage = 0
	if(istype(M.wear_suit, /obj/item/clothing))
		fibertext = "Material from \a [M.wear_suit]."
		if(fibertext && prob(10*item_multiplier))
			LAZYDISTINCTADD(suit_fibers, fibertext)

	if(istype(M.w_uniform, /obj/item/clothing) && (M.w_uniform.body_parts_covered & ~suit_coverage))
		fibertext = "Material from \a [M.wear_suit]."
		if(fibertext && prob(15*item_multiplier))
			LAZYDISTINCTADD(suit_fibers, fibertext)

	if(istype(M.gloves, /obj/item/clothing) && (M.gloves.body_parts_covered & ~suit_coverage))
		fibertext = "Material from \a [M.wear_suit]."
		if(fibertext && prob(20*item_multiplier))
			LAZYDISTINCTADD(suit_fibers, fibertext)

/obj/item/proc/add_trace_DNA(mob/living/carbon/M)
	if(!istype(M))
		return
	if(issilicon(M))
		return
	if(istype(M.dna))
		LAZYDISTINCTADD(trace_DNA, M.dna.unique_enzymes)

/* this would allow for replaced limbs to leave different prints, might make it work later -silver
	var/obj/item/organ/external/E = get_organ(hand ? BODY_ZONE_PRECISE_L_HAND : BODY_ZONE_PRECISE_R_HAND)
	if(E)
		return E.get_fingerprint()
*/
