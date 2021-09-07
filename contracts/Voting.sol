// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// pragma abicoder v2;


contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    event TheVoter(address addr, uint voteCount, uint propNumber);
    event ContractCreated(address addr);

    address public chairPerson;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    constructor(bytes32[] memory proposalNames){

        chairPerson = msg.sender;
        voters[chairPerson].weight = 1;

        for(uint i=0; i<proposalNames.length; i++){
            Proposal memory prop = Proposal({name: proposalNames[i], voteCount: 0});
            proposals.push(prop);
        }

        emit ContractCreated(msg.sender);
    }

    function giveRightToVote(address voter) public returns(bool isOk_){
        require(msg.sender == chairPerson, "Only chairPerson can give right to vote");
        require(!voters[voter].voted, "The voter has already voted");
        require(voters[voter].weight == 0);

        voters[voter].weight = 1;
        isOk_ = true;
    }

    function delegate(address to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You already voted!");
        require(msg.sender != to, "Self-delegation is disallowed.");
        require(sender.weight != 0, "Has no right to vote. Try to get access first");

        while(voters[to].delegate != address(0)){
            to = voters[to].delegate;
            require(msg.sender != to, "loop found");
        }

        sender.voted = true;
        sender.delegate = to;
        Voter storage delegate_ = voters[to];

        if(delegate_.voted){
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }

        emit TheVoter(msg.sender, sender.weight, delegate_.vote);
    }

    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];

        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
        emit TheVoter(msg.sender, sender.weight, proposal);
    }

    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount = 0;

        for(uint i=0; i<proposals.length; i++) {
            if(proposals[i].voteCount > winningVoteCount){
                winningVoteCount = proposals[i].voteCount;
                winningProposal_ = i;
            }
        }
    }

    function  winnerName() public view returns (bytes32 winnerName_) {
        winnerName_ = proposals[winningProposal()].name;
    }

}