import { Antagonist, Category } from "../base";
import { multiline } from "common/string";

export const INFILTRATOR_MECHANICAL_DESCRIPTION
   = multiline`
      Keep this rival district's influence in check without letting it fall.
   `;


const Infiltrator: Antagonist = {
  key: "infiltrator",
  name: "Agent",
  description: [
    multiline`
      Sent from another district nearby in the city, you are undercover combine agent trained in hand to hand combat.
      You were sent to keep this district from outpacing your home district, and perhaps grabbing something interesting along the way for your administrator.
      However, should this district fall, your own shall suffer greatly, so you must not push it over the edge either.
    `,
    INFILTRATOR_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default Infiltrator;
