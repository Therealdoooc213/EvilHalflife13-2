import { Antagonist, Category } from "../base";
import { multiline } from "common/string";

export const CHANGELING_MECHANICAL_DESCRIPTION
   = multiline`
      Assume the guise of a citizen as a DNA-absorbing slug.
      Use unnatural powers and resilience to absorb further victims or other horrors and complete your objectives.
   `;


const Changeling: Antagonist = {
  key: "changeling",
  name: "Xenian Horror",
  description: [
    multiline`
      We have long lied in wait here in the city, having been transported here from the borderworld of Xen long ago.
      Now, we have taken one of the citizen's form as our own. We shall feed as we once did.
    `,
    CHANGELING_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Changeling;
