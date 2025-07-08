pragma solidity 0.8.30;

abstract contract LeverageLogic {
    // NOTE: May not need any state variables
    enum LeverageType {
        MORPHO,
        AAVE
    }

    struct CallData {
        address target;
        bytes data;
        uint256 value;
    }

    function _decodeLeverageType(bytes memory data, LeverageType leverageType)
        internal
        pure
        returns (CallData memory)
    {
        if (leverageType == LeverageType.MORPHO) {
            // TODO: This may be different based on uses
            return abi.decode(data, (CallData));
        } else if (leverageType == LeverageType.AAVE) {
            return abi.decode(data, (CallData));
        }
    }

    function leverage(LeverageType leverageType, bytes memory data) external virtual {
        CallData memory callData = _decodeLeverageType(data, leverageType);
        (bool success, bytes memory returnData) = callData.target.call{value: callData.value}(callData.data);
        require(success, "Leverage failed");
    }
}
