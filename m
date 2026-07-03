Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983422B8DF
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047659; cv=none; b=gIjA+hGz1pCrL/5est5ZNiVKJVjyKh3fH0m9H58QQscLdZjCqKttLO5TSgiB2fIvUhqbY6AIydKzxIpZC3YMVwLO7zcavdHT7akdWmsXehqisZR8qsHzF8vXXD3lEKNFquRwXe80Nr+jXLet1dZqsj9LrlEKFyNkxoJGW6SG2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047659; c=relaxed/simple;
	bh=d4fMzcnolsL0fVjexV5Y1nPWxOzkutk7Dr5FSKpIyWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVbiGDoaPBvxKam+I0HTeWizF9Fs4OnJnPEToYyf8+rWBg9VxaPMknXbeVakho0xq+k027DGmd7MOlCL/4bZPoue0tUVD9fwfGbGJ7VtjQbEzHHFuMX4THDxoYtxhd73fLTypiSD7M0p+9eQxWyvnWkZlVbhXSehdhkuwqNYuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=mMeAEBQz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="mMeAEBQz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso105652f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047653; x=1783652453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDtlzI1o9QHG1A0Yg5fgxyLBaQWwHYWiJZWSyWk212Q=;
        b=mMeAEBQzjtjHB5OYYsYP/YeuBukEzvX5DB8nTM8zGQg+eO0h1D/dUBxYTvrg5yjU9s
         vTHpTIo0e4aeF6NRRUzgVi9m9WNcauBBLVBHSkVWgAgbymT69c6KH+S67b4+ULsCl9Vs
         M9It5mH2o3paEGDUwVpb+/cjFSH21Wly6IvlPu9TDQ0sikNG+FbvUqIjcQtcQDnaXP1T
         X3wTQCV0MfYAT29EI2U31mppmK6/Pa1Oh6+ThrQH++nfSuIb6A/Ra2ziC/j5hPSspwgk
         Orh+1TZV3aKKuq+FQ3ieOPZpWaY5X0OgL4xtv/Nw5QL76+mRWDgE2lcCSyumyljQVEKW
         cxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047653; x=1783652453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDtlzI1o9QHG1A0Yg5fgxyLBaQWwHYWiJZWSyWk212Q=;
        b=cxhNG+ZcVHy2aLQ/XB6hlfqiT9KLyLnSzKyFpsj0cbQ+/sUNtfIBxuwbD3DLMuNvSB
         oY5edNms3Kdn9FQHHUAwJIrs8JUd/2Jor0U19S0nDsTe8zEkDT1IrRETdavlnIhFXYZ/
         2p6RhWLCD+Yy9ziMAT8Mr/3K1K78X/8k548q1o+MWaUVucf8an3CwJtNMTY74l4FUI4/
         mum8ZxHOz+3xePnR56AhXCnsG4fXAfC66h1+WCbN6Le8YncD7LBDcma8DeJ9mTExMsGZ
         RTqtD0cTl4RdPOZShBDcFidNWkHpkFApUqosSv7rLK4r350hLOnhT4yPzVaEp1mjvV04
         Cq5w==
X-Gm-Message-State: AOJu0YwDPomjw74j3Xpq+NyPbF2U3mXLKFTo475ydbSqUzwZ24OeOe6m
	Q+mnkTeW+GytgUOtRwCruzXiQvQe5nAUq+qOz1r8ji31Y85nvIPXrptA+7ApdzIP9Q==
X-Gm-Gg: AfdE7cnx0Zne8bBm7WDn4Ic2Z9g3G1okO/5oV8MDmFzwqm9ytyyrdiUoRueV5zB568d
	5uIE1i0+TkcPAD4iVWfAcJlAd5fm6OUBb6DG29BAT2fsxqCHUc2w732Hee3Xw8jsNHlDkmRvQ2/
	D0sO+kdMmw8eXM7bFP4WJucP9S8Ej9z6y4vTg5kdTulcdunWqlw4ly3eyAO+1ddkKAJIiuJGZe7
	YSCVrK6yi4LVHIbfEJyBysPjbuoIqeFY8bMOYXEUZFpjmj3lqBqrqrLEnyyxvwRLEowdtiP8YR1
	EqiQ5ROtw0EX4zVDmBEVYk6+Z0Ujd62O0f8JlYXY+O2hDFitjs63R3TQ1d2LD4eJSqg+cT0UInf
	ktPfz67jgUpMXWVLh0p09rNtwdpNKnSBgxj6/BJYPi9GiWmEQgXcwy89aKo2DHkmw45DS2JbZuI
	Ms8wLrSFszV73W8UOqJCu0K0738W3I9rtd1LZ9+61OEG+BjKWUd0LPVqforRWNdKk62n0=
X-Received: by 2002:a05:6000:2605:b0:46e:6201:5d56 with SMTP id ffacd0b85a97d-477b34b0307mr10270374f8f.7.1783047653144;
        Thu, 02 Jul 2026 20:00:53 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:52 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/11] rust: usb: let drivers choose the transfer allocation flags
Date: Fri,  3 Jul 2026 04:00:15 +0100
Message-ID: <20260703030020.2694-12-mike@fireburn.co.uk>
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
Content-Transfer-Encoding: 8bit

Oliver Neukum review of the synchronous transfer bindings: a USB driver must be able to
specify GFP_KERNEL vs GFP_NOIO/GFP_NOFS (USB shares error handling and power management
across a device's interfaces, so allocations on reset/resume/error paths must not recurse
into I/O). Thread a `gfp: Flags` parameter through bulk_send/bulk_recv/interrupt_recv/
control_send/control_recv (both the Interface wrappers and the Device impls) instead of
hardcoding GFP_KERNEL.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 59 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 1fcaf34433cc..d39ba6246090 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -17,6 +17,7 @@
         from_result,
         to_result, //
     },
+    alloc::Flags,
     prelude::*,
     sync::aref::AlwaysRefCounted,
     time::Delta,
@@ -418,24 +419,40 @@ pub fn clear_halt(&self, endpoint: u8) -> Result {
 
     /// Issues a synchronous bulk OUT transfer of `data` to `endpoint`, returning
     /// the number of bytes transferred. `data` must be DMA-capable. Sleeps.
-    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
-        self.device().bulk_send(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().bulk_send(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous bulk IN transfer into `data`, returning the number of
     /// bytes received. `data` must be DMA-capable. Sleeps.
-    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
-        self.device().bulk_recv(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().bulk_recv(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous interrupt IN transfer into `data`, returning the number
     /// of bytes received. `data` must be DMA-capable. Sleeps.
-    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
-        self.device().interrupt_recv(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().interrupt_recv(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous control OUT transfer on the default control endpoint.
     /// The buffer is copied internally, so `data` need not be DMA-capable. Sleeps.
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
     pub fn control_send(
         &self,
         request: u8,
@@ -444,13 +461,18 @@ pub fn control_send(
         index: u16,
         data: &[u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         self.device()
-            .control_send(request, request_type, value, index, data, timeout)
+            .control_send(request, request_type, value, index, data, timeout, gfp)
     }
 
     /// Issues a synchronous control IN transfer on the default control endpoint,
     /// filling `data` with exactly `data.len()` bytes. Sleeps.
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
     pub fn control_recv(
         &self,
         request: u8,
@@ -459,9 +481,10 @@ pub fn control_recv(
         index: u16,
         data: &mut [u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         self.device()
-            .control_recv(request, request_type, value, index, data, timeout)
+            .control_recv(request, request_type, value, index, data, timeout, gfp)
     }
 
     /// Selects alternate setting `alternate` of interface `interface`
@@ -609,13 +632,13 @@ pub(crate) fn clear_halt(&self, endpoint: u8) -> Result {
     /// not arrange DMA-capable storage themselves.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
         // stack or in `.rodata`, so copy it into a kmalloc'd bounce buffer.
-        let mut buf = KVec::with_capacity(data.len(), GFP_KERNEL)?;
-        buf.extend_from_slice(data, GFP_KERNEL)?;
+        let mut buf = KVec::with_capacity(data.len(), gfp)?;
+        buf.extend_from_slice(data, gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_sndbulkpipe(self.as_raw(), endpoint.into()) };
@@ -655,12 +678,12 @@ pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Res
     /// `data` may be any slice.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
         // bounce buffer and copy out, so `data` need not be DMA-capable itself.
-        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_rcvbulkpipe(self.as_raw(), endpoint.into()) };
@@ -697,12 +720,12 @@ pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) ->
     /// milliseconds; a [`Delta`] of zero, or any non-zero value below 1 ms, waits indefinitely.
     ///
     /// [`bulk_recv`]: Self::bulk_recv
-    pub(crate) fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_interrupt_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
         // bounce buffer and copy out, so `data` need not be DMA-capable itself.
-        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_rcvintpipe(self.as_raw(), endpoint.into()) };
@@ -749,6 +772,7 @@ pub(crate) fn control_send(
         index: u16,
         data: &[u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
         // reads of `data.len()` bytes; `usb_control_msg_send()` copies the buffer.
@@ -763,7 +787,7 @@ pub(crate) fn control_send(
                 data.as_ptr().cast::<kernel::ffi::c_void>(),
                 data.len().try_into()?,
                 timeout.as_millis().try_into()?,
-                bindings::GFP_KERNEL,
+                gfp.as_raw(),
             )
         })
     }
@@ -784,6 +808,7 @@ pub(crate) fn control_recv(
         index: u16,
         data: &mut [u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
         // writes of `data.len()` bytes; `usb_control_msg_recv()` copies into the buffer.
@@ -798,7 +823,7 @@ pub(crate) fn control_recv(
                 data.as_mut_ptr().cast::<kernel::ffi::c_void>(),
                 data.len().try_into()?,
                 timeout.as_millis().try_into()?,
-                bindings::GFP_KERNEL,
+                gfp.as_raw(),
             )
         })
     }
-- 
2.55.0

