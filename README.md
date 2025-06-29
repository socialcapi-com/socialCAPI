# Social CAPI - Facebook Conversion API Integration

[![GTM Template](https://img.shields.io/badge/GTM-Template-blue.svg)](https://tagmanager.google.com/gallery)
[![Facebook CAPI](https://img.shields.io/badge/Facebook-CAPI-1877F2.svg)](https://developers.facebook.com/docs/marketing-api/conversions-api)
[![License](https://img.shields.io/badge/License-Google%20ToS-green.svg)](https://developers.google.com/tag-manager/gallery-tos)

A comprehensive Google Tag Manager template for seamless Facebook Conversion API integration with advanced customer matching capabilities.

## Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#️-installation)
- [Configuration](#️-configuration)
- [Event Types](#-event-types)
- [Data Quality Scoring](#-data-quality-scoring)
- [Advanced Settings](#-advanced-settings)
- [Troubleshooting](#-troubleshooting)
- [Best Practices](#-best-practices)
- [Privacy & Compliance](#-privacy--compliance)
- [Contributing](#-contributing)
- [Support](#-support)
- [License](#-license)

## 🚀 Features

- **Facebook CAPI Integration**: Clean, focused implementation for Facebook Conversion API
- **Advanced Customer Matching**: Comprehensive user data collection for improved attribution
- **First-Party Domain Support**: Use your own CNAME domain for better tracking
- **Smart Data Validation**: Automatic filtering of empty values and data quality scoring
- **Debug Mode**: Optional detailed logging for troubleshooting
- **Fire-and-Forget**: Immediate GTM success with background HTTP requests
- **iOS 14.5+ Compatible**: Enhanced tracking through first-party domains

## 📋 Requirements

- Google Tag Manager account
- Facebook Business Manager with Conversion API access
- Optional: CNAME domain setup for first-party tracking

## 🛠️ Installation

### Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/social-capi-gtm.git
cd social-capi-gtm
```

### GTM Import

1. **Download Template**:
   - Download `template.tpl` from [releases](../../releases)
   - Or copy the template code from `paste.txt`

2. **Import to GTM**:
   ```
   GTM Container → Templates → Tag Templates → New → Import
   ```

3. **Create Tag**:
   ```
   Tags → New → Choose "Social CAPI" → Configure
   ```

### Manual Installation

1. Copy the template code from the repository
2. In GTM, create a new Custom Template
3. Paste the code and save
4. The template will appear in your tag options

## ⚙️ Configuration

### Required Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| **Event Name** | Facebook standard event | `Purchase`, `PageView`, `AddToCart` |
| **Custom Event** | Enable for custom event names | Check + enter custom name |

### Customer Information (High Priority)

These parameters provide the strongest matching signals:

| Parameter | Description | Priority | Points |
|-----------|-------------|----------|--------|
| **Email** | User's email address | HIGH | +40 |
| **Phone** | Phone number with country code | HIGH | +20 |
| **External ID** | Your internal user ID | HIGH | +20 |

### Personal Details (Medium Priority)

| Parameter | Description | Priority | Points |
|-----------|-------------|----------|--------|
| **First Name** | User's first name | MEDIUM | +15* |
| **Last Name** | User's last name | MEDIUM | +15* |
| **Birth Date** | Format: YYYYMMDD | MEDIUM | +10 |
| **Gender** | m/f or leave empty | MEDIUM | - |

*+15 points only when both first and last name provided

### Address Information (Low Priority)

| Parameter | Description | Format |
|-----------|-------------|---------|
| **Country** | Country code | US, GB, PL, etc. |
| **City** | User's city | Any |
| **Postal Code** | ZIP/postal code | Any |
| **State** | State/province | Any |

### Event Data

| Parameter | Description | Example |
|-----------|-------------|---------|
| **Currency** | Transaction currency | USD, EUR, PLN |
| **Value** | Event value | 29.99 |
| **Content Name** | Product/content name | "iPhone 15" |
| **Content Category** | Product category | "Electronics" |
| **Content IDs** | Comma-separated IDs | "123,456,789" |
| **Content Type** | product/product_group | product |
| **Number of Items** | Item quantity | 2 |
| **Order ID** | Transaction ID | "ORD-12345" |

## 🎯 Event Types

### Standard Events
- **PageView** - Page visits
- **Purchase** - Completed purchases
- **AddToCart** - Items added to cart
- **ViewContent** - Product/content views
- **InitiateCheckout** - Checkout started
- **Lead** - Lead generation
- **CompleteRegistration** - Account creation
- **AddToWishlist** - Wishlist additions
- **Search** - Search actions
- **Subscribe** - Newsletter signups
- **AddPaymentInfo** - Payment info added
- **Contact** - Contact form submissions
- **CustomizeProduct** - Product customization
- **Donate** - Donations
- **FindLocation** - Store locator usage
- **Schedule** - Appointment booking
- **StartTrial** - Trial starts
- **SubmitApplication** - Application submissions

### Custom Events
Check "Use Custom Event Name" and enter your custom event name for non-standard events.

## 📊 Data Quality Scoring

The template automatically calculates a data quality score:

- **Email**: +40 points (highest priority)
- **Phone**: +20 points
- **External ID**: +20 points
- **Full Name**: +15 points (both first and last)
- **Birth Date**: +10 points
- **Country**: +10 points
- **Facebook Cookies**: +15 points

**Recommended minimum**: 40+ points for optimal performance.

## 🔧 Advanced Settings

### First-Party Domain
1. Check "Use First-Party Domain"
2. Enter your CNAME URL: `https://api.yourdomain.com/api/v1/capi/event`
3. Ensure CNAME points to SocialCAPI gateway

### Debug Mode
1. Check "Enable Debug Logging" in Advanced Settings
2. Open browser console to see detailed logs
3. Monitor request building and data validation

### Test Events
- Add "Test Event Code" for Facebook debugging
- Use Facebook Events Manager to verify events

## 🚨 Troubleshooting

### Common Issues

**No events in Facebook Events Manager**:
- Check data quality score (aim for 40+ points)
- Verify CAPI setup in Facebook Business Manager
- Ensure proper triggers are firing

**Low match rates**:
- Add more customer data (email, phone, external_id)
- Use first-party domain
- Check Facebook cookie availability

**Debug logging**:
```javascript
// Enable debug mode to see:
// - Parameter building process
// - Data quality scoring  
// - Final request URL
// - Validation results
```

### Data Quality Warnings
If score < 40 points:
```
⚠️ WARNING: Low data quality score!
Recommendation: Add email, phone, or external ID for better attribution.
```

## 📈 Best Practices

### Data Collection
1. **Prioritize high-value parameters**: email, phone, external_id
2. **Collect incrementally**: start with email, add more over time
3. **Use hashed external IDs**: customer IDs, user IDs, etc.

### Event Implementation
1. **Start with key events**: Purchase, Lead, ViewContent
2. **Use consistent naming**: stick to Facebook standard events when possible
3. **Test thoroughly**: use test event codes during setup

### Performance Optimization
1. **Use first-party domains**: improves iOS 14.5+ tracking
2. **Fire on user interaction**: not just page load
3. **Monitor match rates**: aim for 70%+ in Events Manager

## 🔒 Privacy & Compliance

- All PII is automatically hashed before transmission
- Compatible with GDPR/CCPA requirements
- No data stored in browser beyond standard cookies
- Uses Facebook's secure CAPI endpoints

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow GTM template best practices
- Add tests for new functionality
- Update documentation for any changes
- Ensure debug logging works properly

## 📞 Support

### Getting Help

- **Issues**: [Create an issue](../../issues) for bugs or feature requests
- **Discussions**: [Start a discussion](../../discussions) for questions
- **Documentation**: Check this README and inline code comments

### Debugging Steps

1. Enable debug logging in Advanced Settings
2. Check browser console for detailed logs
3. Verify Events Manager for event reception
4. Review data quality score recommendations

## 📄 License

This template is available under the [Google Tag Manager Community Template Gallery Developer Terms of Service](https://developers.google.com/tag-manager/gallery-tos).

## 📊 Project Status

![GitHub release (latest by date)](https://img.shields.io/github/v/release/username/social-capi-gtm)
![GitHub issues](https://img.shields.io/github/issues/username/social-capi-gtm)
![GitHub pull requests](https://img.shields.io/github/issues-pr/username/social-capi-gtm)

---

**Version**: 1.0  
**Compatibility**: GTM Web Container  
**Last Updated**: June 2025  
**Maintained by**: [Your Name](https://github.com/yourusername)
