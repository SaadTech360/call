import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("VtuModule", (m) => {
  const token = m.contract("Token",["tokV","VTU"]);
  const decall = m.contract("Dvtu",[token])
  const vtu = m.contract("VTU",[token]);


  return { token,vtu };
});
