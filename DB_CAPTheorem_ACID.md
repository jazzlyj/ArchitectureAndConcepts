# CAP theorem
https://en.wikipedia.org/wiki/CAP_theorem

## Definition: Any distributed data store can provide only two of the following three guarantees:[1][2][3]

* Consistency
  * Every read receives the most recent write or an error.
* Availability
  * Every request receives a (non-error) response, without the guarantee that it contains the most recent write.
* Partition tolerance
  * The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes.

## When a network partition failure happens, it must be decided whether to:
* cancel the operation and thus decrease the availability but ensure consistency or to
* proceed with the operation and thus provide availability but risk inconsistency.
Thus, if there is a network partition, one has to choose between consistency and availability. 
Note that consistency as defined in the CAP theorem is quite different from the consistency guaranteed in ACID database transactions.[4]

# ACID

## Definition: 
ACID (atomicity, consistency, isolation, durability) is a set of properties of database transactions intended to guarantee data validity despite errors, power failures, and other mishaps.

* In the context of databases, a sequence of database operations that satisfies the ACID properties (which can be perceived as a single logical operation on the data) is called a transaction. 
  * For example, a transfer of funds from one bank account to another, even involving multiple changes such as debiting one account and crediting another, is a single transaction.

