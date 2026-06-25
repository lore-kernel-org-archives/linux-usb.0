Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225B30276A
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782427809; cv=none; b=cXXlq0ixmmOizkrfTszGaRUW5WLy+lnP/Y2L0jBdxltuDJRzVJ3xpS5aOtNh4ZwaK5ivqswRpeqTNTRCrDzkex8tiGwNSC6kl4C7c+gA3XNeTorG/HxTM0q64ShXKwrlW24hSRHD9MUchGLkUVk1t9ZuytyMkTFzueTazu/PQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782427809; c=relaxed/simple;
	bh=7riy9zn2yRm3WP7DkxKFf+IbEEHQoczVIT4zDHaLIko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nx09SN/2wgRU0BschFCD/ANPwj55ABY5fdS5EL7j2n0Kvv8rBzNkFp9r8dgw4OSRq+MExaWkVxIflzPZ5ifYU5crPWxHjUpglFGBbevrm0FM6UcQmlE7EQGhODcM5djGRViAc+WSmHPtqOiNrA3c1Wz+Xjn6XDjU1OIkrw5ZrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo0l7lWC; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo0l7lWC"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363fe80fe8so907810c88.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782427806; x=1783032606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zP2Z25CXAppf+hFBp9V7dUyW6AOwxGrvIlERxMVxgnc=;
        b=Bo0l7lWCXORfkC78gIbdnmgrxIpunS2187gWXOVy79lwdMp/o6ew1lBY8YB7lbcLSV
         iUY8YkD/Gvj99K+CQp7KOdsUIlrCXkTstV01CO/fu8y5+c+YCQ659IJX6/Q29l5krNCp
         TfCClpJzgbQMuu5+9nvvo0+jyFFtBZta1et3GtX3N/Amd+GZjDgEm60U5rIln2xsfaYk
         kPiIv8B/z8WQOA5pnerutENBqovFJlYHi3RVj2iaoPuej4zcvInluV/wBX1AaUTeih8K
         y2VQvhYXOssWi+gEsWO6Eh8JQlmerVacCSmdjOI7Spfqhe6eO6sjMmSGRBW+DhmsHmTN
         iKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782427806; x=1783032606;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zP2Z25CXAppf+hFBp9V7dUyW6AOwxGrvIlERxMVxgnc=;
        b=V5Z9KYs3vf8r+Z0YDst8Jsb5/gTiMBB8pLHkZIid/MCwvWGTnfLzeXpVdFPWHm9OyI
         JcOBS9R/I0U5FW2k3ku1m+El3bDz+vtqW650b4NmEL7vCc5ttWCm1AhoO11K+dGwQgor
         GWBQkuQo0b2e6N0TwpoHWdtaZZJlIj0Z9g6ag3t9n/XMBt5OQG4R/sGUZSHHcc5dZ5DO
         siPpInA/Tf0yzyK8sCgfzik3iA/b9GJuuDbN/Ud6Rr092juLBaiDpDsrlFurztc9qkcu
         sUJXMRXUwccuylElREtXyGY3bDmHi7e40F37cJo04hsySEid7xviKHRheCIZID2fr2Kl
         x0Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/wJJfUNzNv0qSSfACs6wIUnyCypl35Ugx3Lb/whqypoEDtOnLHzL6+kiotDdw1ctKVxXHc/SeNZ7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUMoDZ3eyg2AoT6kDPVI2BJuVyWZDvnpeSNCh/2jSnRoTEq33m
	t6xgEjdVvSMwnjQ91rL5B0ngMX7WfvFeqdkznntj1M6wP6cNfmaKhjA=
X-Gm-Gg: AfdE7cmmkVkp+VZ8cb3wt5k9heUipkoSTzM6Ir0DEkpH8zvmgZR2RElEykO+6Qb4VtK
	KwoapgRc90QvPdfmRoEuxDbEDR1Dpii9mY7d1fhrIJ2M1/5JXbs7ZfDRDlXREF8WydHO7E/BcDP
	IBFEbz13PxqWp41bcp5fO8/mpq87+CevvmF6qbW7Yju7twGP+I6JVFMeXgybA5rwy/DgzlFGMhf
	XVd8ZAsRvhUHVSssZJ0sCvKK0Opwzp3TN32vwNKhnJqu9jsh16WpFNNeZ4sV/gPbxl4FHxSrEOc
	dOCQ6jVWTsV+JTtNmzaaoTSnkam2h8bX/j6k7z0rlAqBzFxQKZwxEJpEFPNhItbRPQsyOxkl2hA
	08xE+L3A8fyGKgjZWTOpj56DRt+VQxM1QIMsri7G9ip8dyf3dZJptxbSJlSM9nFCA/6MIY9NFG4
	te4GT+k9UGJAboqR0TZABb8KjT2dKT8AaTCGZ/jdCEvGK3IL8rhylJXsVUSF7297jb
X-Received: by 2002:a05:7022:e0e:b0:12d:de3f:f3e5 with SMTP id a92af1059eb24-139dbac8312mr4114702c88.37.1782427805939;
        Thu, 25 Jun 2026 15:50:05 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f77602sm10771239c88.8.2026.06.25.15.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:50:05 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id initialization
Date: Thu, 25 Jun 2026 19:49:22 -0300
Message-ID: <20260625224927.404258-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `pin_init::zeroed()` for `usb_device_id` initialization instead
of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.

This change improves readability and removes unnecessary unsafe blocks.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/usb.rs | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..bbf85366d2c9 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -24,11 +24,8 @@
 };
 use core::{
     marker::PhantomData,
-    mem::{
-        offset_of,
-        MaybeUninit, //
-    },
-    ptr::NonNull,
+    mem::offset_of,
+    ptr::NonNull, //
 };

 /// An adapter for the registration of USB drivers.
@@ -130,8 +127,7 @@ pub const fn from_id(vendor: u16, product: u16) -> Self {
             match_flags: bindings::USB_DEVICE_ID_MATCH_DEVICE as u16,
             idVendor: vendor,
             idProduct: product,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -143,8 +139,7 @@ pub const fn from_device_ver(vendor: u16, product: u16, bcd_lo: u16, bcd_hi: u16
             idProduct: product,
             bcdDevice_lo: bcd_lo,
             bcdDevice_hi: bcd_hi,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -155,8 +150,7 @@ pub const fn from_device_info(class: u8, subclass: u8, protocol: u8) -> Self {
             bDeviceClass: class,
             bDeviceSubClass: subclass,
             bDeviceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -167,8 +161,7 @@ pub const fn from_interface_info(class: u8, subclass: u8, protocol: u8) -> Self
             bInterfaceClass: class,
             bInterfaceSubClass: subclass,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -180,8 +173,7 @@ pub const fn from_device_interface_class(vendor: u16, product: u16, class: u8) -
             idVendor: vendor,
             idProduct: product,
             bInterfaceClass: class,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -193,8 +185,7 @@ pub const fn from_device_interface_protocol(vendor: u16, product: u16, protocol:
             idVendor: vendor,
             idProduct: product,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -206,8 +197,7 @@ pub const fn from_device_interface_number(vendor: u16, product: u16, number: u8)
             idVendor: vendor,
             idProduct: product,
             bInterfaceNumber: number,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -227,8 +217,7 @@ pub const fn from_device_and_interface_info(
             bInterfaceClass: class,
             bInterfaceSubClass: subclass,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }
 }
--
2.47.3

