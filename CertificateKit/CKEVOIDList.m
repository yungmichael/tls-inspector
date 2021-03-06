//
//  CKEVOIDList.m
//
//  MIT License
//
//  Copyright (c) 2020 Ian Spence
//  https://github.com/certificate-helper/CertificateKit
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "CKEVOIDList.h"

@interface CKEVOIDList ()

@property (strong, nonatomic, nonnull, readwrite) NSDictionary<NSString *, NSString *> * oidMap;

@end

@implementation CKEVOIDList

- (instancetype) init {
    self = [super init];
    self.oidMap = @{
        @"1.2.392.200091.100721.1": @"Security Communication EV RootCA1",
        @"1.2.392.200091.100.721.1": @"Security Communication EV RootCA2",
        @"1.2.392.200091.100.721.1": @"Security Communication RootCA1",
        @"1.2.616.1.113527.2.5.1.1": @"Certum Trusted Network CA",
        @"1.3.159.1.17.1": @"Actalis Authentication Root CA",
        @"1.3.171.1.1.10.5.2": @"LuxTrust Global Root 2",
        @"1.3.6.1.4.1.13177.10.1.3.10": @"Autoridad de Certificacion Firmaprofesional CIF A62634068",
        @"1.3.6.1.4.1.14370.1.6": @"Equifax Secure Certificate Authority (GeoTrust)",
        @"1.3.6.1.4.1.14370.1.6": @"GeoTrust Primary Certification Authority - G2",
        @"1.3.6.1.4.1.14370.1.6": @"GeoTrust Primary Certification Authority - G3",
        @"1.3.6.1.4.1.14370.1.6": @"GeoTrust Primary Certification Authority",
        @"1.3.6.1.4.1.14777.6.1.1": @"Izenpe.com - SHA1 root",
        @"1.3.6.1.4.1.14777.6.1.1": @"Izenpe.com - SHA256 root",
        @"1.3.6.1.4.1.14777.6.1.2": @"Izenpe.com - SHA1 root",
        @"1.3.6.1.4.1.14777.6.1.2": @"Izenpe.com - SHA256 root",
        @"1.3.6.1.4.1.17326.10.14.2.1.2": @"AC Camerfirma S.A. Chambers of Commerce Root - 2008",
        @"1.3.6.1.4.1.17326.10.14.2.2.2": @"AC Camerfirma S.A. Chambers of Commerce Root - 2008",
        @"1.3.6.1.4.1.17326.10.8.12.1.2": @"AC Camerfirma S.A. Global Chambersign Root - 2008",
        @"1.3.6.1.4.1.17326.10.8.12.2.2": @"AC Camerfirma S.A. Global Chambersign Root - 2008",
        @"1.3.6.1.4.1.22234.2.5.2.3.1": @"CertPlus Class 2 Primary CA (KEYNECTIS)",
        @"1.3.6.1.4.1.23223.1.1.1": @"StartCom Certification Authority",
        @"1.3.6.1.4.1.29836.1.10": @"China Internet Network Information Center EV Certificates Root",
        @"1.3.6.1.4.1.34697.2.1": @"AffirmTrust Commercial",
        @"1.3.6.1.4.1.34697.2.2": @"AffirmTrust Networking",
        @"1.3.6.1.4.1.34697.2.3": @"AffirmTrust Premium",
        @"1.3.6.1.4.1.34697.2.4": @"AffirmTrust Premium ECC",
        @"1.3.6.1.4.1.40869.1.1.22.3": @"TWCA Global Root CA",
        @"1.3.6.1.4.1.40869.1.1.22.3": @"TWCA Root Certification Authority",
        @"1.3.6.1.4.1.4146.1.1": @"GlobalSign ECC Root CA - R4",
        @"1.3.6.1.4.1.4146.1.1": @"GlobalSign ECC Root CA - R5",
        @"1.3.6.1.4.1.4146.1.1": @"GlobalSign Root CA - R2",
        @"1.3.6.1.4.1.4146.1.1": @"GlobalSign Root CA - R3",
        @"1.3.6.1.4.1.4146.1.1": @"GlobalSign Root CA",
        @"1.3.6.1.4.1.4788.2.202.1": @"D-TRUST Root Class 3 CA 2 EV 2009",
        @"1.3.6.1.4.1.6334.1.100.1": @"Baltimore CyberTrust Root",
        @"1.3.6.1.4.1.6334.1.100.1": @"Cybertrust Global Root",
        @"1.3.6.1.4.1.6334.1.100.1": @"GTE CyberTrust Global Root",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"AddTrust External CA Root",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"COMODO Certification Authority",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"COMODO ECC Certification Authority",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"COMODO RSA Certification Authority",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"USERTrust ECC Certification Authority",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"USERTrust RSA Certification Authority",
        @"1.3.6.1.4.1.6449.1.2.1.5.1": @"UTN-USERFirst-Hardware",
        @"1.3.6.1.4.1.782.1.2.1.8.1": @"AddTrust External CA Root",
        @"1.3.6.1.4.1.782.1.2.1.8.1": @"Network Solutions Certificate Authority",
        @"1.3.6.1.4.1.782.1.2.1.8.1": @"UTN-USERFirst-Hardware",
        @"1.3.6.1.4.1.7879.13.24.1": @"T-TeleSec GlobalRoot Class 3",
        @"1.3.6.1.4.1.8024.0.2.100.1.2": @"QuoVadis Root CA 2 G3",
        @"1.3.6.1.4.1.8024.0.2.100.1.2": @"QuoVadis Root CA 2",
        @"1.3.6.1.4.1.8024.0.2.100.1.2": @"SecureTrust CA",
        @"2.16.156.112554.3": @"CFCA EV ROOT",
        @"2.16.528.1.1003.1.2.7": @"Staat der Nederlanden EV Root CA",
        @"2.16.578.1.26.1.3.3": @"Buypass Class 3 CA 1",
        @"2.16.578.1.26.1.3.3": @"Buypass Class 3 Root CA",
        @"2.16.756.1.83.21.0": @"Swisscom Root EV CA 2",
        @"2.16.756.1.89.1.2.1.1": @"SwissSign Gold CA - G2",
        @"2.16.756.5.14.7.4.8": @"OISTE WISeKey Global Root GB CA",
        @"2.16.792.3.0.4.1.1.4": @"E-Tugra Certification Authority",
        @"2.16.840.1.113733.1.7.23.6": @"VeriSign Class 3 Public Primary Certification Authority - G4",
        @"2.16.840.1.113733.1.7.23.6": @"VeriSign Class 3 Public Primary Certification Authority - G5",
        @"2.16.840.1.113733.1.7.23.6": @"VeriSign Class 3 Public Primary Certification Authority",
        @"2.16.840.1.113733.1.7.23.6": @"VeriSign Universal Root Certification Authority",
        @"2.16.840.1.113733.1.7.48.1": @"Thawte Premium Server CA",
        @"2.16.840.1.113733.1.7.48.1": @"thawte Primary Root CA - G2",
        @"2.16.840.1.113733.1.7.48.1": @"thawte Primary Root CA - G3",
        @"2.16.840.1.113733.1.7.48.1": @"thawte Primary Root CA",
        @"2.16.840.1.114028.10.1.2": @"Entrust Root Certification Authority – EC1",
        @"2.16.840.1.114028.10.1.2": @"Entrust Root Certification Authority – G2",
        @"2.16.840.1.114028.10.1.2": @"Entrust Root Certification Authority",
        @"2.16.840.1.114028.10.1.2": @"Entrust.net Secure Server Certification Authority",
        @"2.16.840.1.114171.500.9": @"Wells Fargo WellsSecure Public Root Certificate Authority",
        @"2.16.840.1.114404.1.1.2.4.1": @"Secure Global CA",
        @"2.16.840.1.114404.1.1.2.4.1": @"ureTrust Corporation",
        @"2.16.840.1.114404.1.1.2.4.1": @"XRamp Global Certification Authority",
        @"2.16.840.1.114412.2.1": @"DigiCert Assured ID Root CA",
        @"2.16.840.1.114412.2.1": @"DigiCert Global Root CA",
        @"2.16.840.1.114412.2.1": @"DigiCert Global Root G2",
        @"2.16.840.1.114412.2.1": @"DigiCert Global Root G3",
        @"2.16.840.1.114412.2.1": @"DigiCert High Assurance EV Root CA",
        @"2.16.840.1.114412.2.1": @"DigiCert Trusted Root G4",
        @"2.16.840.1.114413.1.7.23.3": @"Go Daddy Class 2 Certification Authority",
        @"2.16.840.1.114413.1.7.23.3": @"Go Daddy Root Certificate Authority - G2",
        @"2.16.840.1.114413.1.7.23.3": @"ValiCert Class 2 Policy Validation Authority",
        @"2.16.840.1.114414.1.7.23.3": @"Starfield Class 2 Certification Authority",
        @"2.16.840.1.114414.1.7.23.3": @"Starfield Root Certificate Authority - G2",
        @"2.16.840.1.114414.1.7.23.3": @"ValiCert Class 2 Policy Validation Authority",
        @"2.16.840.1.114414.1.7.24.3": @"Starfield Services Root Certificate Authority - G2",
        @"2.23.140.1.1": @"Amazon Root CA 1",
        @"2.23.140.1.1": @"Amazon Root CA 2",
        @"2.23.140.1.1": @"Amazon Root CA 3",
        @"2.23.140.1.1": @"Amazon Root CA 4",
        @"2.23.140.1.1": @"Starfield Services Root Certificate Authority - G2",
    };
    return self;
}

@end
