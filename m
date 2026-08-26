Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E48469836
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761895; cv=none; b=exAKqBYGJVf9nuvmbKCHa01sGTBlETADyb+/ZpB0t26FgPfBfc8m3Q8+uRtUtGWjslQ+O53hYzG4ZApjAnZPgL2So0zAwD4SgCRvrnLS1KhjWZpZv/JRGZhmBx+lRLFE/nDaKORoNh5O0xPEV4+jy8MhbsRARjixnfOeWXjpzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761895; c=relaxed/simple;
	bh=FJ7ig0FPnRlMyxePWhAE+2w472fgLPZbNxPIYQDx3u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUHP6VD1uBPeSQF7yVBuYzSAzIvqlSkmr6W2YSscV3rNn7O7wTnGRm1IwXrxoaZDPnuqrFKUvsDQuOPE/MDM53gY2g+eiXmFwFlPaV/uT0GqY2aqcsslztP+srhl3//th3UN2MZBbw3ACwOgYCQRdofnF+2kyc40HBTfW/3T8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=PoMBQpdZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="PoMBQpdZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso9357995e9.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761892; x=1788366692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RT+LV1hqO39gFg4H4Z4mtcLyIbhpRf+QBu2wWoptAs=;
        b=PoMBQpdZAApmQP2QpkpiDK6k/opu+jtxJ61X3zfjdraGjvUYnhPq1NnwqZ9/5G1eLd
         zejtultnssDutLgEwvmxLkmd9TtQ48y8VLQO8kuEegtDCnn6XkAWotJrTGR5YOqBzkGm
         /vj+NCSEtJ9iDzf2YV3oTvKWiP7HuAO54mEfYY4Pw9ujbkqpOtXepsSop+EZvAW5XjGN
         WwZy0Ru9+sTq77j2+if4sCv108ifswkrWcmgpV5Qdqjyj30Bdwitda+7suR51X14HYws
         Kh+oTlhogB+Jhz47D/ig6siGz6M6ILaz2RbkRAZopp3xlQfHDQAp4IX1Pype2hKfIqzD
         WgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761892; x=1788366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RT+LV1hqO39gFg4H4Z4mtcLyIbhpRf+QBu2wWoptAs=;
        b=pKs52EHnrGkJSJN8pMQgqNXP9B4TOZOW0fKjtQSsz80JZS5RuVAUZ8fmpuR0nr+nHl
         JKOhxajnTiFZQDdTuIUgFnxflAvhS0qHSHte0wOhPVQ9OAmSDSvUIni/dFda4D3Y5V4I
         4geAylReuG7+vbRXGmBe84V1tT05LR5kjwAXPs29iDkU1WCnnS7jDDfalUAl9rR2QQEz
         yMggSvKhqIde1hbGJRaqPiWWL7Rvw2Wo7/ZZSqSSzlnJs7putuk7Rxu8PCadPEn3MEal
         AfbNzNvw03nw8xB4FUvF2FKyvjJbl+ZRQLW4sH0lBLSsajb+4EMfys7II6dgfk+Jn47z
         Q94Q==
X-Gm-Message-State: AFuF++nKwH87MhmNs1aaEYZEdMapDZWKNbtu0n22wwImQaBhspD3aZbp
	2XJmGSNmN6iqmMD8db+ujzrpU5NQCymeLMv7IGcb+/hzUK8KnRbLUhGmhfiAW6Rnqq3QKBUKsvJ
	s42TegFHv
X-Gm-Gg: AR+sD111mfFrhWRuaKME3kTGOdq41e3b2HP7BoO4toyG8SlU6zu/2u7EiPQp4chdT1x
	vw19Cf3eagWd5uCactR5IxMVxZjghvL784N6aZqnrApX3YGKnq4ZDUsqr7TGcGh9KGyPxxTffCT
	XmVLuKJCoT9k5wUYdYgdYdWatYBqiZoG5zjUSQvo+IWycObGZ+69kTKt/MhvrxkMVUcB4B1wsK+
	UaZCARsSS+LwaaAHSZtjI6SsIO8/FLP/cV6wpQmblAfr42UO3O+Xvm+buLMKGw+Ak48WeYGMzpR
	NCbD39RjiGd17tXtnfRNAJGYjqoR0nBvp8bW24KbNAREVRkVyITMHzdvo4wq63zS12BS8+ewJUw
	v26a1OSYloh5KgfRkJLOLBivC4V99ZCBVWnopVaqlj2N2idGrnr6pLWQsoBpfXQ08/v5SlTRHGq
	0Zsk/DddT1zSD0l9FahRGNG+rHtMM6CEFXBoDgqQrtUE/k+8YT9c+f5gnzA0R2LJ6HO7NP3XHUw
	JOBaND9E5tSEsUmvsZbtOdE+miFnPiu4YG+JZQoUOWx0ds=
X-Received: by 2002:a05:600c:8518:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-499dc720ae9mr95399745e9.9.1787761892048;
        Wed, 26 Aug 2026 09:31:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:30 -0700 (PDT)
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
Subject: [PATCH v3 3/5] rust: usb: expose device descriptor fields and queue readiness
Date: Wed, 26 Aug 2026 17:30:39 +0100
Message-ID: <20260826163101.4168-4-mike@fireburn.co.uk>
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

A driver that identifies hardware before it decides to drive it needs the
device descriptor: idVendor, idProduct, bcdDevice, bcdUSB, the enumerated
speed, and the cached iManufacturer, iProduct and iSerialNumber strings.
bcdDevice in particular is the only revision a driver can read without
already speaking the device's own protocol.

Add can_send_n() alongside them, which reports whether the next count
queue slots can be submitted without waiting and reaps completed slots on
the way. A protocol that must not block halfway through a multi-URB record
uses it to defer the whole record and service its control plane first.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index ad40c814616a..782bae53584d 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -1430,6 +1430,7 @@ fn is_active(&self) -> bool {
         matches!(self.urb, Some(QueueUrb::Active(_)))
     }
 
+    #[inline]
     fn wait(&self, timeout: Delta) -> bool {
         let millis = timeout.as_millis();
         let millis = if millis <= 0 {
@@ -1441,6 +1442,7 @@ fn wait(&self, timeout: Delta) -> bool {
             .wait_for_completion_timeout(crate::time::msecs_to_jiffies(millis))
     }
 
+    #[inline]
     fn finish(&mut self) -> Result<(i32, usize)> {
         let state = self.urb.take().ok_or(EIO)?;
         let active = match state {
@@ -1700,6 +1702,34 @@ fn reap(&mut self, i: usize, timeout: Delta) -> Result<bool> {
         Ok(true)
     }
 
+    /// Reports whether the next `count` queue slots can be submitted without waiting.
+    ///
+    /// Completed slots are reaped and any transfer error is returned. This is useful when a
+    /// higher-level protocol must not block halfway through a multi-URB record while waiting for
+    /// endpoint progress; callers can defer the whole record and service its control plane first.
+    #[inline]
+    pub fn can_send_n(&mut self, io: &Io<'_>, count: usize) -> Result<bool> {
+        self.inner.check(io)?;
+        if count > self.slots.len() {
+            return Ok(false);
+        }
+        for off in 0..count {
+            let i = (self.cursor + off) % self.slots.len();
+            if self.slots[i].is_active() {
+                if !self.slots[i].wait(Delta::ZERO) {
+                    return Ok(false);
+                }
+                // `wait_for_completion_timeout()` consumes the completion signal. Reap the URB
+                // now rather than leaving `send()` to wait for the signal a second time.
+                let (status, _) = self.slots[i].finish()?;
+                if status != 0 {
+                    return Err(Error::from_errno(status));
+                }
+            }
+        }
+        Ok(true)
+    }
+
     /// Submits `data` as a bulk OUT transfer without waiting for it to complete.
     ///
     /// If the slot about to be reused still has a transfer outstanding, this blocks up to
@@ -2626,6 +2656,72 @@ fn inner(&self) -> &bindings::usb_device {
     fn devnum(&self) -> u32 {
         self.inner().devnum as u32
     }
+
+    /// Returns the `idVendor` of the device descriptor.
+    pub fn vendor_id(&self) -> u16 {
+        self.inner().descriptor.idVendor
+    }
+
+    /// Returns the `idProduct` of the device descriptor.
+    pub fn product_id(&self) -> u16 {
+        self.inner().descriptor.idProduct
+    }
+
+    /// Returns the `bcdDevice` of the device descriptor.
+    ///
+    /// Vendors conventionally use this as the device revision, and it is the only version a driver
+    /// can read without speaking the device's own protocol.
+    pub fn bcd_device(&self) -> u16 {
+        self.inner().descriptor.bcdDevice
+    }
+
+    /// Returns the `bcdUSB` of the device descriptor.
+    pub fn bcd_usb(&self) -> u16 {
+        self.inner().descriptor.bcdUSB
+    }
+
+    /// Returns the enumerated bus speed as a human-readable string.
+    pub fn speed_str(&self) -> &'static str {
+        match self.inner().speed {
+            bindings::usb_device_speed_USB_SPEED_LOW => "low (1.5 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_FULL => "full (12 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_HIGH => "high (480 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_WIRELESS => "wireless",
+            bindings::usb_device_speed_USB_SPEED_SUPER => "super (5 Gbps)",
+            bindings::usb_device_speed_USB_SPEED_SUPER_PLUS => "super-plus (10+ Gbps)",
+            _ => "unknown",
+        }
+    }
+
+    /// Returns the device's `iManufacturer` string, if the core cached one.
+    pub fn manufacturer(&self) -> Option<&CStr> {
+        // SAFETY: `manufacturer` is either null or a NUL-terminated string owned by the USB core
+        // for as long as the device exists, which outlives the borrow of `self`.
+        unsafe { Self::opt_cstr(self.inner().manufacturer) }
+    }
+
+    /// Returns the device's `iProduct` string, if the core cached one.
+    pub fn product(&self) -> Option<&CStr> {
+        // SAFETY: As for `manufacturer`.
+        unsafe { Self::opt_cstr(self.inner().product) }
+    }
+
+    /// Returns the device's `iSerialNumber` string, if the core cached one.
+    pub fn serial(&self) -> Option<&CStr> {
+        // SAFETY: As for `manufacturer`.
+        unsafe { Self::opt_cstr(self.inner().serial) }
+    }
+
+    /// # Safety
+    ///
+    /// `p` must be null or point to a NUL-terminated string that outlives `'a`.
+    unsafe fn opt_cstr<'a>(p: *mut crate::ffi::c_char) -> Option<&'a CStr> {
+        if p.is_null() {
+            return None;
+        }
+        // SAFETY: The caller guarantees `p` is a NUL-terminated string valid for `'a`.
+        Some(unsafe { CStr::from_char_ptr(p) })
+    }
 }
 
 impl Device<device::Bound> {
