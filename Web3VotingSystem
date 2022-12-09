pragma solidity ^0.8.7;

contract Web3VotingSystem
{
    string[] public candidateNames;
    mapping(string=>uint256) public candidateCode;
    mapping(uint256=>uint256) public numberOfVotes;

    constructor(string[] memory _stringParam)  {
        candidateNames = _stringParam;
    }


    function validCandidate(uint256 selectedCandidateCode) view public returns (bool)
    {
        for(uint i=0;i<candidateNames.length;i++)
        {
            if(candidateCode[candidateNames[i]]==selectedCandidateCode)
            {
                return true;
            }
        }
        return false;
    }

    function voteForCandidate(uint256 candidate) public 
    {
    require(validCandidate(candidate));
    numberOfVotes[candidate] += 1;
    }

    function numberOfVotesFor(uint256 candidate) view public returns (uint256) {
    require(validCandidate(candidate));
    return numberOfVotes[candidate];
    }  
    function getCandidates() constant returns (string[])
    {
        return candidateNames;
    }
}
