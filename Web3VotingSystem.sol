// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Web3VotingSystem
{
    string[] public candidateNames;
    mapping(string=>uint256) public candidateCode;
    mapping(uint256=>uint256) public numberOfVotes;

    constructor(string[] memory _stringParam)  {
        candidateNames = _stringParam;
        uint temp=0;
        for(uint i=0;i<candidateNames.length;i++ )
        {
            candidateCode[candidateNames[i]]=temp++;
        }
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

    function getCandidates() public view returns  ( string[] memory)
    {
        return candidateNames;
    }
    function currentWinner() public view returns (string memory)
    {
        uint256 maxVotes=0;
        string memory winnerName="NaN";
        for (uint256 i = 0; i < candidateNames.length; i++) {
            uint temp=numberOfVotes[candidateCode[candidateNames[i]]];
            if ( temp> maxVotes) {
                maxVotes = temp;
                winnerName=candidateNames[i] ;
            }
        }
        return winnerName; 
    }
    //////misc
}
