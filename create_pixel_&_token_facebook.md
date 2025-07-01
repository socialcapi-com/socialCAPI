# How to Generate Facebook Pixel & CAPI Access Token

A comprehensive step-by-step guide to create your Facebook Pixel and generate Access Token for Conversions API integration.

## 🎯 What You'll Get
- **Facebook Pixel ID** (16-digit number for tracking)
- **CAPI Access Token** (for server-side event sending)
- **Test Event Code** (for testing your setup)

---

## 📋 Prerequisites

Before starting, make sure you have:
- ✅ Facebook Business Manager account (not personal Facebook)
- ✅ Admin access to your Facebook Business account
- ✅ The website URL where you'll use the pixel
- ✅ Chrome or Firefox browser (recommended)

---

## 🚀 Part 1: Creating Your Facebook Pixel

### Step 1: Access Facebook Business Manager
1. Open your browser and go to **business.facebook.com**
2. Log in with your business account credentials
3. Once logged in, you'll see the Business Manager dashboard

### Step 2: Navigate to Events Manager
1. In the left sidebar, look for **"Events Manager"**
   - If you don't see it immediately, click **"All Tools"** first
   - Then find and click **"Events Manager"**
2. Alternatively, go to **Business Settings** → **Data Sources** → **Pixels**

### Step 3: Create a New Pixel
1. Click the bright blue **"Connect Data Sources"** button
   - If you already have pixels, click the **"+"** or **"Add"** button instead
2. You'll see different platform options - select **"Web"**
3. Choose **"Facebook Pixel"** from the options
4. Click **"Connect"** to proceed

### Step 4: Configure Your Pixel
1. **Pixel Name**: Enter a descriptive name
   - Good examples: "MyWebsite_MainPixel", "EcommerceStore_Pixel"
   - Avoid generic names like "Pixel1"
2. **Website URL**: Enter your complete website URL
   - Include "https://" (e.g., https://www.yourwebsite.com)
3. Click **"Create Pixel"**

### Step 5: Save Your Pixel ID
1. After creation, you'll see a confirmation screen
2. **Your Pixel ID** will be displayed prominently
   - It's a 16-digit number like: `1234567890123456`
3. **Copy this number and save it somewhere safe**
   - You'll need it later for CAPI setup
   - Write it down or save in a secure note

---

## 🔑 Part 2: Generating CAPI Access Token

### Step 6: Access Conversions API Settings
1. In Events Manager, click on your newly created pixel name
2. You'll see several tabs at the top - click **"Settings"**
3. Scroll down to find the **"Conversions API"** section
4. Click **"Set up Conversions API"** or **"Generate Access Token"**

### Step 7: Configure Token Permissions
1. A popup window will appear for token generation
2. **Token Name**: Give it a descriptive name
   - Example: "MyWebsite_CAPI_Token"
3. **Permissions**: Make sure these are selected:
   - ✅ **ads_management**
   - ✅ **business_management**
   - ✅ **ads_read** (if available)
4. **Expiration**: Choose **"Never Expire"** for production use
   - For testing, you can choose shorter periods

### Step 8: Generate and Copy Your Token
1. Click **"Generate Token"** button
2. **IMPORTANT**: Your access token will appear immediately
   - It starts with "EAA" followed by a very long string
   - Example: `EAABsBCS1234...` (much longer in reality)
3. **Copy the entire token RIGHT NOW**
   - Click the copy button or manually select and copy
   - **This is your only chance to see the full token**
4. **Save it securely** - paste it into a secure note or password manager

### Step 9: Confirm Token Creation
1. After copying, click **"Done"** or **"OK"**
2. You should see confirmation that your token was created
3. The token will appear in your list but will be partially hidden for security

---

## 🧪 Part 3: Setting Up Test Events (Highly Recommended)

### Step 10: Create Test Event Code
1. Still in Events Manager, click on the **"Test Events"** tab
2. Click **"Create Test Event Code"**
3. **Test Code Name**: Enter any name you like
   - Example: "MyWebsite_Testing", "CAPI_Test_2024"
4. Click **"Create"**
5. **Copy and save this test code** - you'll use it to verify your setup works

### Step 11: Understanding Test Events
- This code helps you see events in real-time during testing
- Events sent with this code appear immediately in the Test Events tab
- Remove the test code when you go live to production

---

## 📝 Part 4: Collecting Your Generated Information

### Your Complete Setup Information:
After following all steps, you should have:

1. **Pixel ID**: `1234567890123456` (your 16-digit number)
2. **Access Token**: `EAABsBCS1234...` (long string starting with EAA)
3. **Test Event Code**: `YourTestCode` (the name you created)

### Save These Safely:
- **Never share these publicly**
- **Don't commit to GitHub or public repositories**
- **Store in a secure password manager**
- **Keep backups in case you lose access**

---

## ✅ Part 5: Verification Steps

### Step 12: Verify Your Pixel Exists
1. Go back to Events Manager main page
2. You should see your pixel listed with its name and ID
3. Status should show as "Active" or "No Recent Activity"

### Step 13: Verify Your Token Works
1. In Events Manager, go to **Settings** → **Conversions API**
2. Your token should be listed under "Access Tokens"
3. It should show as "Active" status

### Step 14: Check Permissions
1. Click on your access token in the list
2. Verify it has the correct permissions:
   - ✅ ads_management
   - ✅ business_management
3. Check expiration date (should be "Never" if you selected that)

---

## 🔒 Security Best Practices

### Protecting Your Credentials:
- **Access Token**: Treat it like a password - never share it
- **Pixel ID**: Less sensitive but still keep it private
- **Regular Monitoring**: Check token usage in Business Manager monthly
- **Rotation**: Consider regenerating tokens every 6-12 months

### Common Security Mistakes to Avoid:
- ❌ Don't put tokens in client-side JavaScript
- ❌ Don't commit tokens to version control (Git)
- ❌ Don't share tokens in screenshots or documentation
- ❌ Don't use the same token across multiple projects

---

## 🎉 Success! What's Next?

You now have everything needed to implement Facebook Conversions API:
- **Pixel ID** for identifying your tracking
- **Access Token** for authenticating API requests
- **Test Event Code** for testing your implementation

Your next steps would be to:
1. Set up your server-side code to send events
2. Use the test event code to verify events are received
3. Monitor event quality and delivery in Events Manager
4. Remove test code and go live when ready

---

## 🆘 Troubleshooting Common Issues

**Can't find Events Manager?**
- Make sure you're using Facebook Business Manager, not personal Facebook
- Check if you have admin permissions on the business account

**Token generation fails?**
- Verify you have the correct permissions in Business Manager
- Try using a different browser or clearing browser cache
- Make sure your business account is in good standing

**Pixel creation error?**
- Check if you've reached the pixel limit (usually 20 per business)
- Verify the website URL is correctly formatted
- Ensure you have the necessary permissions

**Lost your token?**
- You'll need to generate a new one - tokens can't be recovered
- Revoke the old token for security
- Update your implementation with the new token

---

*This guide covers the generation process only. Implementation and coding are separate steps that require technical knowledge of your specific platform or programming language.*
