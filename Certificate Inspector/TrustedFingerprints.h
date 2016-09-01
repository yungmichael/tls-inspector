//
//  TrustedFingerprints.h
//  Certificate Inspector
//
//  GPLv3 License
//  Copyright (c) 2016 Ian Spence
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software Foundation,
//  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA

#import <Foundation/Foundation.h>

static NSString * _Nonnull kTrustedFingerprintRemoteSecFailure = @"kTrustedFingerprintRemoteSecFailure";
static NSString * _Nonnull kTrustedFingerprintLocalSecFailure  = @"kTrustedFingerprintLocalSecFailure";

@interface TrustedFingerprints : NSObject

- (id _Nonnull) init;
+ (TrustedFingerprints * _Nonnull) sharedInstance;
- (void) checkForUpdates;

- (NSDictionary<NSString *, id> * _Nullable) dataForFingerprint:(NSString * _Nonnull)sha1fingerprint;

@end