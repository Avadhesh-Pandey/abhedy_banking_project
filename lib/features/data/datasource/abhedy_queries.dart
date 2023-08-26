const String getHomeRepo = """
  query getHome {
  home {
    name
    accountNumber
    balance
    currency
    address {
      streetName
      buildingNumber
      townName
      postCode
      country
    }
    recentTransactions {
      date
      description
      amount
      fromAccount
      toAccount
    }
    upcomingBills {
      date
      description
      amount
      fromAccount
      toAccount
    }
  }
}
""";

const String getAccountRepo = """
  query getAccounts {
  accounts {
    id
    accountNumber
    accountType
    balance
    accountHolder
  }
}
""";

const String getTransactionsRepo = """
query getTransactions {
  transactions {
    date
    description
    amount
    fromAccount
    toAccount
  }
}
""";

const String getContactsRepo = """
query getContacts {
  contacts
}
""";

const String getStatementsRepo = """
query getStatements {
  statements {
    date
    description
    amount
  }
}
""";
