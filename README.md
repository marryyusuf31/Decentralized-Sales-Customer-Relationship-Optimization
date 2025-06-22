# Decentralized Sales Customer Relationship Optimization

A blockchain-based CRM system built on Stacks using Clarity smart contracts. This decentralized approach provides transparent, immutable customer relationship management with advanced analytics and optimization features.

## 🚀 Features

### Core Components

1. **CRM Manager Verification** (`crm-manager.clar`)
    - Role-based access control for CRM managers
    - Manager verification and permission management
    - Secure authorization system

2. **Lead Management** (`lead-management.clar`)
    - Complete lead lifecycle tracking
    - Status progression from new to converted
    - Assignment and value tracking

3. **Opportunity Tracking** (`opportunity-tracking.clar`)
    - Sales pipeline management
    - Stage-based opportunity progression
    - Probability and value forecasting

4. **Customer Segmentation** (`customer-segmentation.clar`)
    - Automatic customer categorization
    - Revenue-based segmentation
    - Statistical analysis per segment

5. **Retention Optimization** (`retention-optimization.clar`)
    - Customer retention scoring
    - Risk level assessment
    - Automated retention actions

## 📋 Contract Overview

### CRM Manager Contract
\`\`\`clarity
;; Add a new CRM manager
(add-manager principal role permissions)

;; Verify manager status
(is-verified-manager principal)
\`\`\`

### Lead Management Contract
\`\`\`clarity
;; Create new lead
(create-lead contact-info source assigned-manager value)

;; Update lead status
(update-lead-status lead-id new-status)
\`\`\`

### Opportunity Tracking Contract
\`\`\`clarity
;; Create opportunity
(create-opportunity name account value probability close-date owner)

;; Update opportunity stage
(update-opportunity-stage opportunity-id new-stage)
\`\`\`

### Customer Segmentation Contract
\`\`\`clarity
;; Add customer
(add-customer name revenue manager)

;; Get segment statistics
(get-segment-stats segment)
\`\`\`

### Retention Optimization Contract
\`\`\`clarity
;; Calculate retention score
(calculate-retention-score customer-id engagement-frequency satisfaction-score days-since-last-engagement)

;; Execute retention action
(execute-retention-action customer-id action-type description)
\`\`\`

## 🏗️ Architecture

### Data Structures

**Manager Data:**
- Verified status
- Role and permissions
- Creation timestamp

**Lead Data:**
- Contact information
- Source and status
- Assigned manager
- Value and timestamps

**Opportunity Data:**
- Name and account
- Pipeline stage
- Value and probability
- Close date and owner

**Customer Data:**
- Segmentation info
- Revenue tracking
- Interaction history
- Manager assignment

**Retention Data:**
- Retention score
- Risk level
- Engagement metrics
- Action history

## 🔧 Installation & Deployment

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js for testing

### Deployment Steps

1. **Clone the repository**
   \`\`\`bash
   git clone <repository-url>
   cd decentralized-crm
   \`\`\`

2. **Deploy contracts**
   \`\`\`bash
   clarinet deploy --network testnet
   \`\`\`

3. **Run tests**
   \`\`\`bash
   npm test
   \`\`\`

## 📊 Usage Examples

### Setting Up CRM Managers
\`\`\`clarity
;; Add a sales manager
(contract-call? .crm-manager add-manager 'SP1234... "sales-manager" u7)

;; Verify manager
(contract-call? .crm-manager is-verified-manager 'SP1234...)
\`\`\`

### Managing Leads
\`\`\`clarity
;; Create a new lead
(contract-call? .lead-management create-lead
"john@example.com"
"website"
'SP1234...
u50000)

;; Update lead status to qualified
(contract-call? .lead-management update-lead-status u1 u3)
\`\`\`

### Tracking Opportunities
\`\`\`clarity
;; Create opportunity
(contract-call? .opportunity-tracking create-opportunity
"Enterprise Deal"
"Acme Corp"
u100000
u75
u1000
'SP1234...)
\`\`\`

### Customer Segmentation
\`\`\`clarity
;; Add enterprise customer
(contract-call? .customer-segmentation add-customer
"Big Corp Inc"
u2000000
'SP1234...)
\`\`\`

### Retention Optimization
\`\`\`clarity
;; Calculate retention score
(contract-call? .retention-optimization calculate-retention-score
u1
u15
u85
u5)
\`\`\`

## 🧪 Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm run test
\`\`\`

Tests cover:
- Contract deployment
- Function execution
- Error handling
- Data integrity
- Access control

## 🔒 Security Features

- **Role-based Access Control**: Only authorized managers can perform sensitive operations
- **Data Validation**: Input validation prevents invalid data entry
- **Immutable Records**: Blockchain ensures data integrity and audit trails
- **Permission System**: Granular permissions for different user roles

## 📈 Analytics & Reporting

The system provides built-in analytics:
- Lead conversion rates
- Opportunity pipeline health
- Customer segment performance
- Retention risk assessment
- Manager performance metrics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the documentation
- Review test files for usage examples

## 🔮 Future Enhancements

- Integration with external CRM systems
- Advanced analytics dashboard
- Mobile app integration
- AI-powered lead scoring
- Automated workflow triggers
