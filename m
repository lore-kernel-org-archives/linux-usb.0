Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242CD469842
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761900; cv=none; b=ccNmhi0nVKNxFHFU3yulagCG86iPpYxqSbhFFfvP2jm9zJBXOyjqWYgtKtIH7sRBbljq+nTqmQ1GGl7tU+wTy1w3isNZCxBOGErP54VXFLDzHA+JfRezq2z7HQJNs0qQzmu81SKetvPeRwK6sWLIq3aFtXeCmBNUCQQLlJD9sZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761900; c=relaxed/simple;
	bh=WZlq9OZ7FAFZLaxFJSphucTd66QV1xZKbxhmcyg3C7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FET5cFQGBiMpwT723HddIE9wJXCWcY787iCBh66qt442+WPat60skkIV7Yz18iq8z5sUmTtVfD/yIp8mSXHAkOMlMbxYi9vCwsMPbew5KJSqLVoOP1kI2atIh2iAZLKkREUXh4pv+Pd9xmgndFDSf5Il3N8hB6KHpqOtppkwfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=NVWM8oEJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="NVWM8oEJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499840a2575so6653395e9.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761897; x=1788366697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdtsQq66n/qz7GbF8KHrVG0ry8nV9A0BZm16SycNCKs=;
        b=NVWM8oEJyWZqqyfJN5aZpNWDonSmlCSDNqgEJ0enNF+vSwfkXLSz+W6gFC/NTLCwx8
         Pyx4y7Oiy1byWQEtsecQE+d6CctwEUNhWE2vHtr25sTU6XRGS7n4r229+RGnfmIeBfit
         r7zIvY6JU4aCd+3l97TGmcpbj9pE4uxg3c+xoLczQk8nIfoUm2oFaaC6EgQXYXvjMi1G
         44usWAc/F9OWabG5f4/aUuqhHWhw2jrXGrbtkvyCozZ5HB/bxZEhTOED3U9kZN4R+rvM
         ZDsfbUYj76q/RhR14c3KzPEq/wL/wX7VqpznkvJhvhh0pbIdC51dVSAe+6pITtb7K9Oe
         124Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761897; x=1788366697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdtsQq66n/qz7GbF8KHrVG0ry8nV9A0BZm16SycNCKs=;
        b=U7jHEBa5QmcX0eqX36N6klMdugorgNI1Rf2wAbaKfBdjDeR2+R/DF6DZlnBXltwfzk
         nRW6on3DnabmEYFuqmXn0M+1tO9xCUPZz/ePxm1qM0DRRjvU7WiekLMfz8GMBWunYeoZ
         M5EEqRkYgIRY54xYWkLXjNHVMcmTtzGKRXHsPrHGysmb5sLkItPZQn6YT2BjLzmyOAgP
         TYJVxFf/7pgKcmvtEr6/USpivM3BW4YHtCq3SD2Xyw5lBnxqStqjRgvrZimZ2meZfros
         v0rW/WTqn+icVVYyXyLlBthfVFbBSzuowopaB9ZpjI9TkjXJTo1p1frf1fK6cm0Pp4DC
         t0dw==
X-Gm-Message-State: AFuF++nrI3HwyeOL5uqhyzd4jdYubR7w2lw3yvm6xKshlzZooXkpBFno
	PaHrGWuk93z/Dpq18eP3bC5Hn0KTEuXb8DLEiQqTeLgZa7Dlti6NlANQc/HLK6IdE/wSUO7luM6
	F5U2KtxeQ
X-Gm-Gg: AR+sD11KGjhMjV7yvCJijMfr4PVuU8LTE2btDDmLL3AXoIWa+QOIidWgvSyfn/brfRM
	q9PdDEaUZJq/jhWu6zFcgMwXA05dTXPBUOKIg7/loa0TCKaAevehrke6U2mrHF9XzuTy5uq2weZ
	hfAPzCzzMLCsgN3d9a+NC3ebmckpR3uIeAfQ6mHvfPvKVJ7t1kxmaRTMh6l85aZzNkYBurx32tE
	lp+LFR+aMSLter2WGQ3qrYTZOvzzk36VpAhfon5xxs/jrd7GOLrwNKQk5U57ak8k+pm2RusRMg1
	iYKTtd0oC3LaVHuu1xa2MwBf3JOBDKLBVyr2CErKJkhZ5qaMapHEgQX7LSA+LgRLb5XCHawklYP
	oveaORydTznwsaEu+9N143YvuPAVTvw8qAmP93tnrzjSUF5knyqK03x3g4NjVng9nL8BQAJsjTy
	jjeqAFAp0GSXSdFtWM02OTte+MpgpXJDrSD2zRHYgDgDTinM/X4git3Hu0MrM7bHX1ZogAoocmi
	1XkIgzYwlZeOeKAJVGeOePOfpAYHymd1Ejr
X-Received: by 2002:a05:600c:8b55:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-499dc81cccamr81292205e9.10.1787761897397;
        Wed, 26 Aug 2026 09:31:37 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:36 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] rust: usb: add a vendor-and-interface-info device id constructor
Date: Wed, 26 Aug 2026 17:30:40 +0100
Message-ID: <20260826163101.4168-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`USB_VENDOR_AND_INTERFACE_INFO` is the C macro a driver uses to bind to
a function rather than to a list of product IDs: one vendor, plus an
interface class, subclass and protocol, matching every product that
exposes it.

The existing constructors cover `USB_DEVICE_INFO` and
`USB_INTERFACE_INFO`, which between them can express "any device of this
class" or "any interface of this class from any vendor", but not the
combination -- and the combination is what a vendor-specific function
needs, because class `0xff` means nothing without the vendor beside it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 782bae53584d..b2a0fb104ddf 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -307,6 +307,29 @@ pub const fn from_interface_info(class: u8, subclass: u8, protocol: u8) -> Self
         })
     }
 
+    /// Equivalent to C's `USB_VENDOR_AND_INTERFACE_INFO` macro.
+    ///
+    /// Matches every device from one vendor that exposes an interface of the given class,
+    /// subclass and protocol, whatever its product ID. This is how a driver binds to a *function*
+    /// rather than to a list of the products someone happened to test.
+    pub const fn from_vendor_and_interface_info(
+        vendor: u16,
+        class: u8,
+        subclass: u8,
+        protocol: u8,
+    ) -> Self {
+        Self(bindings::usb_device_id {
+            match_flags: (bindings::USB_DEVICE_ID_MATCH_VENDOR
+                | bindings::USB_DEVICE_ID_MATCH_INT_INFO) as u16,
+            idVendor: vendor,
+            bInterfaceClass: class,
+            bInterfaceSubClass: subclass,
+            bInterfaceProtocol: protocol,
+            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
+            ..unsafe { MaybeUninit::zeroed().assume_init() }
+        })
+    }
+
     /// Equivalent to C's `USB_DEVICE_INTERFACE_CLASS` macro.
     pub const fn from_device_interface_class(vendor: u16, product: u16, class: u8) -> Self {
         Self(bindings::usb_device_id {
