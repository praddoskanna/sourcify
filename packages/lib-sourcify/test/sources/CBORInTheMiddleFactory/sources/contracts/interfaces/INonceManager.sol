{
  "content": "// SPDX-License-Identifier: GPL-3.0\npragma solidity >=0.7.5;\n\ninterface INonceManager {\n\n    /**\n     * Return the next nonce for this sender.\n     * Within a given key, the nonce values are sequenced (starting with zero, and incremented by one on each userop)\n     * But UserOp with different keys can come with arbitrary order.\n     *\n     * @param sender the account address\n     * @param key the high 192 bit of the nonce\n     * @return nonce a full nonce to pass for next UserOp with this sender.\n     */\n    function getNonce(address sender, uint192 key)\n    external view returns (uint256 nonce);\n\n    /**\n     * Manually increment the nonce of the sender.\n     * This method is exposed just for completeness..\n     * Account does NOT need to call it, neither during validation, nor elsewhere,\n     * as the EntryPoint will update the nonce regardless.\n     * Possible use-case is call it with various keys to \"initialize\" their nonces to one, so that future\n     * UserOperations will not pay extra for the first transaction with a given key.\n     */\n    function incrementNonce(uint192 key) external;\n}\n"
}