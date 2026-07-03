Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93A282F05
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047636; cv=none; b=eGoegaahugGciso/cvUYFhxVwnyEVI2IEbt1ZfOWlDEgHFb96r9rx5nHSQQCX/to9p8obomcOWgCKF9YzEgh/c5Q/ZoxX6ck4sy/ev6ko9ytxUmPhDqQdv5mEXKx442B9RgAUq8qy1WJJtdjUdSeUYro9qX/Adnz0lcQzXpd83g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047636; c=relaxed/simple;
	bh=hMaccDZ5PDEOPlCNJEKZtNPTuhPH7brCBjKysP98eZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPhZ/l6Z1CTW2dvoiDgSmDn8lSoJdJRlm7Lr6a+LOG3mmTrFDdFkVhSe+TUpPsTdSnRHj3IgecMhbfImdLWGAgL1pXpSXmTMVWJO60bRM+iG6hA+iGSzF2cAYUmeMhnZEBfItxmrTB83dDcqL4kPA6FctmGv8FSoI8TcXlrogoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=JWL3EDyT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="JWL3EDyT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd464d51fso37879f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047633; x=1783652433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egKj4uT+V4gDIJo4dQH6sgJyRIpRRkWAoTv3WOeDq9c=;
        b=JWL3EDyT//x21Y97BlZR1XIBB5KYPHpgeNP7U3ZnvNtGw+HNh3/Ya/bwUnItI60Qy4
         70a2ZfqwbtIsX1dMHaP9Y0aFqLEpjUKdVOBY7LUUT3yFh8Fs54nDRLCM0eTVHTXsMub0
         4UL+uF9aCfXnqeMm71afCucbwHSbel6rAUMwpZ1neJCdv7J91ws5RENRnIpAyO+IH+bX
         Mz4fTokCTlB8aethknr3oJV5F2Yz/oN0nLNBzagtsMkPJS/Xu9t2V9BqsUxu16fp+3fn
         D59RCHLMXfCDasbNChgyqOmDSvJQ7kh4HtgRIyEOE3i+Lksu/3uwR6iLH7rzgefSaJFX
         Hoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047633; x=1783652433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egKj4uT+V4gDIJo4dQH6sgJyRIpRRkWAoTv3WOeDq9c=;
        b=MQB1aniMPrHd35MQl5PDjkTuS57gvCpf8U058BtXEuHO3VhqmhHrmuurYFi2XDcQvM
         6nbvf3hcbuvqFmQsBVBodjmWepSg1ZDexKHQKg5gyNV1aNLc11ErTVoMjG2+PkW2UJa6
         dg8TqATSK54U+7Y1rlVWJyfu1NJpMBviyhULpKiP4Hcmvn37y/Mp1JxF2uKj2PDgqKpd
         F63/SWv8DZA7zgOxSlsf3YHL4sDA7cIvlaoqEIldubZPy9nlIRW25jjr316fxXhuiAJH
         G/hX7Wxid805cdE8y4+QIJvcsu8NVUb6A5MeuCvPk34Pc9huivelwve8VW/nVqQc/6+F
         LZrg==
X-Gm-Message-State: AOJu0YzJJUJY6mijLhPv+kMnNvGSgKF1JTahTDAnxl3O1OCwMT6PskbE
	Maw76o8kbq70s0/3jqYFlUOoWxnm88V3mOMyz6JjZa0IB0qPrjKB7CzXIr1jnjey7g==
X-Gm-Gg: AfdE7ckRYX3PCwoVFnkqspVtIjMa32QrT7e7lPJWPepkCo0lc4OuIfpCHLMfJVnEcjy
	SUleVaCwS0lJ+b6ejvPBWoURDNUJ+6VCBpBQRjp+LCkH2hjxMyVPEbYLxw+yZHkV7/UF9Ol7uFR
	4tCfHguR7AuaMA9a672ClZo/vOpR/Su2nGTLe5dyVE08ctnWCKDhtArmK5DDoLZ9X6QV6ADTWTb
	baGIdQKiumVugOGjjDLgifSaILrCvyJUURW/OrdUPMZJqBFd5MpFAFGUzmtD3B1+AO5YE5z2KUd
	HjXSeQ8/+g14aGANCIA1sfvBLqz5Gk8hO49nPW2OgSD3nV6V76rIqLERjdxJQFXtMRHjgZsLL3+
	pPsvHqYY3iJdRnK0b8+J2rOkPSIVEKFWYDhJaXuHJ6yEKp4Qgp7pY486widIKXbHaxTorfXOr36
	IMlTdDsHFQFwyH5JjULvh7RZPTJehqA/h78ZifQNZ65CzTFJtkyonNduwm
X-Received: by 2002:a05:6000:230f:b0:474:57f0:49f8 with SMTP id ffacd0b85a97d-477573bbd26mr12113057f8f.4.1783047632906;
        Thu, 02 Jul 2026 20:00:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:32 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 02/11] rust: usb: add synchronous control transfer support
Date: Fri,  3 Jul 2026 04:00:06 +0100
Message-ID: <20260703030020.2694-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030020.2694-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building on the bulk transfer support, add synchronous control IN/OUT
transfers on the default control endpoint (pipe 0) as safe methods on
`usb::Device`.

`control_send()` and `control_recv()` wrap `usb_control_msg_send()` and
`usb_control_msg_recv()`. The `bRequest`, `bmRequestType`, `wValue` and
`wIndex` setup fields are taken as arguments; `wLength` is the buffer
length. Both copy the buffer internally, so unlike the bulk path the
caller's buffer need not be DMA-capable. They block and sleep, so must be
called from process context; the timeout is a `Delta` (zero waits
indefinitely).

This is what a driver needs for the standard control-request preamble at
device bring-up before bulk traffic begins.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 75 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index c9acadb2deaf..e1fb50fd6997 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -530,6 +530,81 @@ pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result
         data[..n].copy_from_slice(&buf[..n]);
         Ok(n)
     }
+
+    /// Issues a synchronous control OUT transfer on the default control endpoint.
+    ///
+    /// Wraps [`usb_control_msg_send()`]; `request`, `request_type`, `value` and
+    /// `index` are the `bRequest`, `bmRequestType`, `wValue` and `wIndex` setup
+    /// fields. `data` is the payload (`wLength` is its length).
+    ///
+    /// This is a blocking, sleeping call and must only be invoked from process
+    /// context. Unlike the bulk path, the buffer is copied internally, so `data`
+    /// need not reside in DMA-capable memory. `timeout` is the maximum time to
+    /// wait, rounded down to whole milliseconds; a [`Delta`] of zero — or any
+    /// non-zero value below 1 ms — waits indefinitely.
+    ///
+    /// [`usb_control_msg_send()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_send
+    pub fn control_send(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &[u8],
+        timeout: Delta,
+    ) -> Result {
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
+        // reads of `data.len()` bytes; `usb_control_msg_send()` copies the buffer.
+        to_result(unsafe {
+            bindings::usb_control_msg_send(
+                self.as_raw(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_ptr().cast::<kernel::ffi::c_void>(),
+                data.len().try_into()?,
+                timeout.as_millis().try_into()?,
+                bindings::GFP_KERNEL,
+            )
+        })
+    }
+
+    /// Issues a synchronous control IN transfer on the default control endpoint,
+    /// filling `data` with exactly `data.len()` bytes.
+    ///
+    /// Wraps [`usb_control_msg_recv()`], which fails the transfer if the device
+    /// returns fewer than `data.len()` bytes. The setup fields and context/buffer
+    /// rules are as for [`Device::control_send`].
+    ///
+    /// [`usb_control_msg_recv()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_recv
+    pub fn control_recv(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &mut [u8],
+        timeout: Delta,
+    ) -> Result {
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
+        // writes of `data.len()` bytes; `usb_control_msg_recv()` copies into the buffer.
+        to_result(unsafe {
+            bindings::usb_control_msg_recv(
+                self.as_raw(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                data.len().try_into()?,
+                timeout.as_millis().try_into()?,
+                bindings::GFP_KERNEL,
+            )
+        })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.55.0

