---
title: Speaker Cabinet
subtitle: Plans + Walkthrough
date: 2025-06-03
version: 1.0.0
lang: en
---

![Finished cab with associated amp head](../cab.jpg)

## CAD Assembly

For a clearer picture of how the pieces fit together, here's the Onshape CAD assembly for the cabinet:

[CAD assembly in Onshape](https://cad.onshape.com/documents/a8e99d359d06e281134f1993/w/de057f5f0dc9ce846859dc1a/e/7b6bebf37df140934a427da3?configuration=default&renderMode=0&uiState=683f8d0d5b9c4020e70d1d25)

![Cabinet CAD render](../cab_transparent.png)

## Bill of Materials

### Wood

- [1] sheet of 5/8" thick plywood. I cut this out of a standard 4' x 8' piece, but only about 2' x 3' is really needed.
- [1] 1"x12"x8' pine, I found this in the shelving section of Lowe's
- [2] 1"x2"x8' furring strips

### Hardware

- [14] #10 x 3" bolts
- [28] #10 nuts + washers
- [4] 1/4-20 x 2" bolts
- [8] 1/4-20 nuts + washers
- [12] 2" deck screws, really any countersunk 2"+ wood screws are fine
- [30ish?] A bunch of ~1" wood screws for attaching the internal bracing and back plate

### Miscellaneous

- [2] handles, I bought [these Reliable Hardware Company ones](https://www.amazon.com/dp/B00JQYVJNS?ref=ppx_yo2ov_dt_b_fed_asin_title)
- [4] rubber feet, any will do but I bought [these](https://www.amazon.com/dp/B00S48P2YY?ref=ppx_yo2ov_dt_b_fed_asin_title)
- Roughly 2' x 15" of grill cloth, I bought [this](https://www.amazon.com/dp/B07F3YS99J?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)
- [1] 1/4" mono jack, I think I grabbed one out of a broken guitar pedal
- About 2' of insulated wiring to connect the jack and speaker

### (Optional) Stain + Finish

- Black spraypaint
- Wood stain (I used a walnut stain)
- Tung Oil

## Design

There's a ton of design work that _can_ go into building guitar cabinets like is done for Hi-Fi speakers, with things like [Thiele-Small parameters](https://en.wikipedia.org/wiki/Thiele/Small_parameters) and [using the Golden Ratio for the enclosure dimensions](https://www.audiocircle.com/index.php?topic=46637.0). I spent a while looking into all of this, but it seemed like the lo-fi and non-linear nature of guitar speakers means that, at least for a closed-back cabinet that I was looking to build, the dimensions of the cabinet did not matter much.

With that in mind, I still opted to start with a golden ratio design and then work from there to make the cabinet easy to build. I wanted the cabinet to be 25" wide to match the amp head I built previously, and I calculated the other dimensions from there. Setting 25" as the long dimension, this gives dimensions of

- Width: 25"
- Height: 25 / 1.6 = 15.625"
- Depth: 15.625" x 0.6 = 9.375"

Though the 25" measurement was an external one, I wanted to ensure that there was at least 9" of internal depth to give the speaker plenty of room relative to the input jack. This fit well with using a pine 1x12 (actual 3/4" by 11 1/4") for the frame.

Though internal volume is the number that actually makes a difference in the speaker response, it was easy enough to calculate the external volume and use that as a point of comparison to other popular 1x12 extension cabinets. The above specs result in an external volume of 4394 in^3, which is less than the huge closed back 1x12 from Emperor, but also a decent bit larger than the Bogner Cube (although that's ported for additional low end response). A large cabinet might have resulted in a slightly better bass response but again, these things don't seem to make much of a difference for guitar speakers and the midrange focus of electric guitar.

## Assembly Process

### Frame

Cut the 1x12x8' board into sections of

- 2 x 25" lengths (top and bottom sections)
- 2 x 14 1/8" lengths (sides)

Assemble the four boards as the frame of the cabinet with the sides sandwiched between the top and bottom. 

1. Drill 3 pilot holes per side through the top of the frame into the sides. 
2. Remove the top, drill clearance holes for your 2" deck screws through the pilot holes
3. Repeat steps 1 and 2 for the bottom of the frame.
4. Join the frame with the 2" deck screws. Wood glue is optional, I just used screws.

### Baffle Mounts

Cut the 1x2 furring strips into sections of

- 4 x 23 1/2" lengths (or a bit less, should fit into the frame)
- 4 x 14 1/8" lengths (or a bit less, should fit vertically into the frame)

Drill 3 clearance holes (for the 1" wood screws) through the 2" width of each of the furring strips. The exact location of these holes doesn't make that much of a difference, it's just necessary to check before installing the baffle and back plates that their screws won't hit these mounting screws.

Join the front's furring strips to the frame with the 1" wood screws, set back from the edge of the frame such that there is 1" between the edge of the frame and the furring strip. I didn't use pilot holes for these furring strips, just drive the screws through the clearance holes.

Apply the same process for the back's furring strips, setting them back 5/8" instead of 1" like for the front.

### Baffle

Cut 2, 23 1/2" x 14 1/8" sections of the plywood. Set one section aside for the back.

Use a compass to sketch a 11.1" diameter circle on the center of the baffle. Use a jigsaw to remove this circle of wood.

Line your speaker up with the baffle hole, ensuring that the speaker mount holes have sufficient material outside the baffle hole. Mark these holes, remove the speaker, and drill clearance holes for the 1/4-20 bolts.

Place the baffle into the frame against the furring strips. Drill clearance holes for the #10 bolts through the baffle and the furring strips. I put 4 bolts along the top and bottom of the baffle and 3 on each side. This might be overkill, I'm not sure.

Remove the baffle, and counterbore each of the holes to 1" diameter and about 3/8" depth. I used a drill press for this to prevent the bit from walking as much. There may not be enough material on most of the holes to prevent a side of the counterbore hole from being open to the outside of the piece or the baffle hole, this is alright.

Capture the 4 1/4-20 bolts for the speaker mount, and the 14 #10 bolts for the baffle mounting, in the counterbore holes in the baffle using their associated nuts + washers.

Once all of the bolts are captured on the baffle, apply grill cloth over the front (bolt head side) of the baffle. I put a coat of black spray paint on this side first before applying the grill cloth to make it harder to see the plywood through the cloth, but up to you on whether that will make a difference. I fastened the grill cloth with a staple gun.

### Final Assembly

Place the baffle in its holes in the front of the frame. This might require a bit of work with a rubber mallet to get it to line up properly. Use 14 more of the #10 nuts and washers to fasten the bolts from the inside of the cabinet.

Attach the speaker to its 4 mounting bolts with the remaining 1/4-20 nuts. Attach the 1/4" jack with a spade connectors or solder.

Place the back in the frame. Drill pilot holes into the furring strips. I used a similar 14 hole pattern as with the baffle. Remove the back, drill clearance holes for the 1" wood screws and a clearance hole for the 1/4" jack.
Place the back in the frame again, attaching the 1/4" jack and driving in the wood screws.

The method for attaching the handles will differ by the model you choose. For the handles I linked above, I measured the indent and removed that amount of wood from the sides using a jigsaw.


