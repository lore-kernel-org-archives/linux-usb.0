Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2047DD65
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708454; cv=none; b=NnH5YFnb1DSES4mXsNQ6dKx606RsWFzWXncMXbjiVkWAEZTwtOwITGwXP2YeQvHZmkipCMpnwYqnPN5zvlNeEkVYPsEhS1XQoiR1UJUfodjhBZiU6SJSKvTDj4Qb/5kyXv1G6wBYpxKBzXe4S267CKdpJ8QV5iZwhm1CHJCmdJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708454; c=relaxed/simple;
	bh=jQXIbkZPTlx0Vgngv9dkw/KwltbenoRqDBTRSViQLkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7QT4pDvl0S6I9X9JOKGY2z3j24V8ZOA3nqOFEgx2/E9MuZYt7o7crbObQvdNTBEnNxLuLm5ctJCzG4VeemHoOohFGC7exqa1eSrEVbCivFEIvnx7A7Jb137H1LGmXEpbih4jpf8T06Dx5ejriuCg+cqQ7N0+YYWA/wA7pEIyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=MCldw33q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="MCldw33q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4392017f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708446; x=1782313246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWZ98RGC+mUgaExZQOLC3zMe/TcesbqpVW9DuHmXdX0=;
        b=MCldw33qJ/kR68GtxlNRVH8NyJNrrhTLinnkp7s7LQEPEP97W3qNXbVWo4J2bAaRWS
         jHtvvPKaM7xp4KlMGsh/Gs6UhxGr352817hhF+0yskEQaLpKMpmcTV0+bJkhQGu2Kvsm
         8Tx8kpD46r31BNFBuNIgO36ZJWdJkU8zOrl3TwGOla3AKACs0O3u3GScD2HKooJbmem/
         cBGTq3uSuJrhuUnlEzxW8PNIO3MqMzMh8Qc2t34ges1dQqNYSt7Lm6hxsbWeHP5yNtag
         rCZOIcU1KuA3blKwaHs2h31eKjZUrqX7XG7rpMvU59Fetj9bYO3U05tGr0bIQzRnwvl6
         DsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708446; x=1782313246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWZ98RGC+mUgaExZQOLC3zMe/TcesbqpVW9DuHmXdX0=;
        b=ksyZnUVbsgt22YdGU2+Y8VeeF5nujreNGo7Uh0CkTNNA5d4PZSZ5+aaZ9RZZ9u2DU6
         hS0UKZc5BV3lSH6VaLQUJVefNMIwX9OnrmqYM8fkOjjKYmWE7Hy0G5IYOoTIGY1b68ov
         FQbrGjSnn6vYw7UhMbDI62MzdTbxHKtv1XTJq3P7W5MfvWGGcVEidZngHO8IRouatg5P
         9GsV9uSZmr5hSYGdM1/5iQzu2BthgtMc1wZSgiIuyt0TKuj07HjjUz7KxQP9pNbocKT6
         kw3lvpuQgMIgRLYjg7TROVn6uJodY02xap/DKOzgxEDkm5soCKmYki5SnSUX/uiWw+hq
         27ow==
X-Forwarded-Encrypted: i=1; AFNElJ+fyd2bRDbhdUL74fOpykRepCN1v/BOsCOOUo4iheHjjCl/0ZrVO8v9y/oPAJ2T9i12oOTsFDw1qUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJV/42I05+aXYw56Dq8tMG3HEQccixEIcFD+CU+qzDGw5YHEo
	+N/fm5kMXXPlAHURQa7nxrCPvEWYrAaqF5mqm31//j5grYezc5QPFn0v3jQW5sQeSA==
X-Gm-Gg: Acq92OEL7qOcgYdnR4XMEFhecODJ7Ai+vLCafps9jSOS5Kxl25+uGMP5xHQsgyuXX4m
	YShXA5c/I8jgq1KPUXIwHdHcI+s7ROJHFq0HyIhQ2V/C2YiZw32L5NPfpPtln8f0i5yQt99AHFd
	g+GyT5uJUfPGZ9WGVm6d7d9rS17DbX3k9y44337ILZ3znYzzXBefUXsrTYJjTMMC6gQO2bj6XAY
	vPazYWXYnm3ZthqhMuSMkV9CrHS140R39YLLogYD9vaTcdB530s7LrZYzo7lEKGRvl0Fw5whnu6
	twM6KIZbr61fOC6jokRWonaSTwVjmQbkEk0VEtx03osmc4w9DtiKLbfpcI4AD3gdtSkTFlsKz+7
	S4/WAvZhPoatRnEiacLEoP4CEJv5cWqTK5UoVwMNkaQrwuw3cTbvLzyup6QCy0oZPJ+Cf35T4Z7
	2SuXHz8p4i7vKyimLEXqtLy1z6rXf/hRrDex12n7d6PX1HX8IpzNHbVpBe
X-Received: by 2002:a05:600c:e54a:10b0:490:e104:7943 with SMTP id 5b1f17b1804b1-492333e294dmr54936095e9.18.1781708445930;
        Wed, 17 Jun 2026 08:00:45 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:45 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-usb@vger.kernel.org,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/9] rust: usb: add synchronous bulk transfer support
Date: Wed, 17 Jun 2026 15:59:13 +0100
Message-ID: <20260617145946.1894-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB abstractions currently let a Rust driver bind a device
(probe/disconnect) but provide no way to move data, so any real driver
still has to drop to C. Add synchronous bulk IN/OUT transfers, the most
common need, as safe methods on `usb::Device`.

`Device` is made public and gains `bulk_send()` and `bulk_recv()`,
wrappers over `usb_bulk_msg()`. The endpoint pipe is built with the
`usb_sndbulkpipe()` / `usb_rcvbulkpipe()` macros, exposed to Rust via new
`rust_helper_*` shims (they are function-like macros that bindgen cannot
bind directly). Both methods take the endpoint's `bEndpointAddress` as it
appears in the descriptor (e.g. 0x84) -- matching the later `clear_halt()`
-- and use its low four bits as the endpoint number; the direction is
fixed by the method. The transfer length and timeout are range-checked
into the C `int` types, and the timeout is a `Delta` (a zero `Delta`, or
any sub-millisecond value once truncated to whole ms, waits indefinitely,
matching `usb_bulk_msg()`).

`usb_bulk_msg()` DMAs directly to/from the transfer buffer, which must
therefore be kmalloc'd (DMA-capable) memory -- not the stack, `.rodata`
or vmalloc. Rather than push that onto callers as an unenforced
precondition (which would make these safe methods unsound for an
arbitrary `&[u8]`), the payload is copied through a kmalloc'd bounce
buffer internally, so any slice is accepted. A future zero-copy fast path
could take a dedicated DMA-buffer type once one exists; feedback on that
API shape is a main reason this is posted as an RFC.

Both methods block and sleep, so they must be called from process context
only.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/helpers/usb.c | 12 ++++++
 rust/kernel/usb.rs | 97 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index eff1cf7be3c2..d398eb2f6669 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -7,3 +7,15 @@ rust_helper_interface_to_usbdev(struct usb_interface *intf)
 {
 	return interface_to_usbdev(intf);
 }
+
+__rust_helper unsigned int
+rust_helper_usb_sndbulkpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_sndbulkpipe(dev, endpoint);
+}
+
+__rust_helper unsigned int
+rust_helper_usb_rcvbulkpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_rcvbulkpipe(dev, endpoint);
+}
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..c9acadb2deaf 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -19,6 +19,7 @@
     },
     prelude::*,
     sync::aref::AlwaysRefCounted,
+    time::Delta,
     types::Opaque,
     ThisModule, //
 };
@@ -426,7 +427,7 @@ unsafe impl Sync for Interface {}
 ///
 /// [`struct usb_device`]: https://www.kernel.org/doc/html/latest/driver-api/usb/usb.html#c.usb_device
 #[repr(transparent)]
-struct Device<Ctx: device::DeviceContext = device::Normal>(
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
     Opaque<bindings::usb_device>,
     PhantomData<Ctx>,
 );
@@ -435,6 +436,100 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
     fn as_raw(&self) -> *mut bindings::usb_device {
         self.0.get()
     }
+
+    /// Issues a synchronous bulk OUT transfer of `data` to bulk endpoint
+    /// `endpoint` and returns the number of bytes actually transferred.
+    ///
+    /// This is a blocking, sleeping call and therefore must only be invoked from
+    /// a process (sleepable) context, never from atomic or interrupt context.
+    ///
+    /// `endpoint` is the endpoint's `bEndpointAddress` as it appears in the
+    /// descriptor (e.g. `0x02`); the transfer direction is fixed by the method
+    /// (OUT), so only the low four bits — the endpoint number — are used.
+    /// `timeout` is the maximum time to wait, rounded down to whole
+    /// milliseconds; a [`Delta`] of zero — or any non-zero value below 1 ms —
+    /// waits indefinitely (the `usb_bulk_msg()` `timeout == 0` contract).
+    ///
+    /// `usb_bulk_msg()` DMAs directly from the transfer buffer, so the buffer
+    /// must reside in DMA-capable (kmalloc'd) memory. `data` may be any slice —
+    /// it is copied into a kmalloc'd bounce buffer internally — so callers need
+    /// not arrange DMA-capable storage themselves.
+    ///
+    /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
+    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+
+        // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
+        // stack or in `.rodata`, so copy it into a kmalloc'd bounce buffer.
+        let mut buf = KVec::with_capacity(data.len(), GFP_KERNEL)?;
+        buf.extend_from_slice(data, GFP_KERNEL)?;
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        let pipe = unsafe { bindings::usb_sndbulkpipe(self.as_raw(), endpoint.into()) };
+
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `buf` is a kmalloc'd
+        // buffer valid for reads of `buf.len()` bytes; `actual` is a valid out-pointer.
+        to_result(unsafe {
+            bindings::usb_bulk_msg(
+                self.as_raw(),
+                pipe,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                buf.len().try_into()?,
+                &mut actual,
+                timeout.as_millis().try_into()?,
+            )
+        })?;
+
+        Ok(actual as usize)
+    }
+
+    /// Issues a synchronous bulk IN transfer of up to `data.len()` bytes from bulk
+    /// endpoint `endpoint` into `data` and returns the number of bytes received.
+    ///
+    /// This is a blocking, sleeping call and therefore must only be invoked from a
+    /// process (sleepable) context, never from atomic or interrupt context.
+    ///
+    /// `endpoint` is the endpoint's `bEndpointAddress` as it appears in the
+    /// descriptor (e.g. `0x84`); the transfer direction is fixed by the method
+    /// (IN), so only the low four bits — the endpoint number — are used.
+    /// `timeout` is the maximum time to wait, rounded down to whole
+    /// milliseconds; a [`Delta`] of zero — or any non-zero value below 1 ms —
+    /// waits indefinitely (the `usb_bulk_msg()` `timeout == 0` contract).
+    ///
+    /// `usb_bulk_msg()` DMAs directly into the transfer buffer, so the buffer
+    /// must reside in DMA-capable (kmalloc'd) memory. The data is received into
+    /// a kmalloc'd bounce buffer internally and then copied into `data`, so
+    /// `data` may be any slice.
+    ///
+    /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
+    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+
+        // `usb_bulk_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
+        // bounce buffer and copy out, so `data` need not be DMA-capable itself.
+        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        let pipe = unsafe { bindings::usb_rcvbulkpipe(self.as_raw(), endpoint.into()) };
+
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `buf` is a kmalloc'd
+        // buffer valid for writes of `buf.len()` bytes; `actual` is a valid out-pointer.
+        to_result(unsafe {
+            bindings::usb_bulk_msg(
+                self.as_raw(),
+                pipe,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                buf.len().try_into()?,
+                &mut actual,
+                timeout.as_millis().try_into()?,
+            )
+        })?;
+
+        // `usb_bulk_msg()` never reports more than the requested length.
+        let n = (actual as usize).min(data.len());
+        data[..n].copy_from_slice(&buf[..n]);
+        Ok(n)
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

