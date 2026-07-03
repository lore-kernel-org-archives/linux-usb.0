Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC0277C9E
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047635; cv=none; b=Bl3XgYH5hqBBAeiuxL5DaxrP4OqWA7nBaDc2NmxvE69uDKh+56DNRFFnichO/sW43n6DFG2MxKEx0rBvltl/borXRjMNiTqFQ4Ma9vmBhBTCDPVwfXoTytIWSirDPblhxL411Za0G/1tI+lWW5a0zAbvmDhKEuoK0WxZkYyELQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047635; c=relaxed/simple;
	bh=8idPhF0NpIYXVOe2vQCcXpCk8VOX4ceq2U/HtqSvS5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a77Nq1qXTp+Tszvdof2IYbSJcjNiMhrBdXnYHzKZpXxl+kO95aa7zC1mwSWm+VbXuKgTWEXnugQNiBbaPMluRR3r4cnr5Z3Z86CuxkLazrfvWa8yFaGy5b0jgftWBVyNRKovmIKrXNOy63aiYVuGayWBlMNEW3QfGZwz4pavWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=GZL+JVjY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="GZL+JVjY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4720f3bf164so589899f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047632; x=1783652432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PksdnxPE+dNGdIY1zegG5TA1oxCJt/Oel1SIWa25dcM=;
        b=GZL+JVjYxhdDnPH8TzEHy8l+upisEX4+C1ZsWiNOiXv3d5AFxseitGgtAiuVaHuHTk
         Zh+FRq2uQFNjjwVv5Q5trl41qrjGgchd1jdnRHFFYCwFGdSqljifSv5u8zFW2PNQVs3q
         bXMHY0VNFz6Jk5z8lZNVwDQcomlb+H/VMKHYIy3IZo619yiGYrkHZlPYTdX36lPRS9Ya
         pT49Sz6MLka8jdLBAe4fBx8qoaML29PXpG4VAP3tActrMd3ouEziUSgj5JP1S6tkZHPx
         AGhGMyIFmTIo+75voHNNyUfVR9i54hLeprcKgtLRe7fSj5qCxQM2AyaH2gmhiy6tG3vc
         kvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047632; x=1783652432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PksdnxPE+dNGdIY1zegG5TA1oxCJt/Oel1SIWa25dcM=;
        b=B5clGJDQZF4zcBSLNM0SSZcTGJytgQzcmE1lxbH+lqkEjGLGnatZSfVe5jQZIYmCOQ
         TYG629aNFgdrEV1i5I2jC8UIETceudy2vb8Dd1/UL0yrVzIlR705ztU0Qagjgkm1AvWh
         gURdScYpcs8JCE2zAWlUDBy9cWvQ9bB65JFvjC9IuT23wr5qNduRwR5CkwQcmfWwhINc
         h/bI5I0CGgfH8KxkxJIDqeSNwEHEsGh0TdTyWnOnJ8AkEondELEmoQNccqlqT5nvXp3L
         y3x+V1yUuBPJ2Lx9cv+Xr2ZtxOJAgVTPSwnIoVW/UrzkAC1NDqYCCCmr/i7z6oNS0Cd4
         YYEg==
X-Gm-Message-State: AOJu0YzDKn5pslzYl2837hEQv2P2ND+URvJz5yZy+l5tuJf3WAg4ppFr
	oCDl+IWcuUW0UQv5Gj1uK7GnVDynEW28bDuWMNH/UQGy3IdS6lDU7MIjQlEVrFkDy07DhfOz8zf
	wtJJrcaGn
X-Gm-Gg: AfdE7ck/7WGdiDYwqqfw85u3HRxTPAomAEdJd5Dbw8O7bpL9o6T9u00FJcwO2mFP1wc
	IkAoKMytgXciK0jymNmBU8RVv76syiMfvCB2CgcIJkjdt9D7Ji21687MGEOe8kGl+QOL2nFTvMR
	nv5krG7IbHliLmRKttL7QAbKGvHV0Zg9Uwd0CBwtns3ThosDfJ3qdTKw8DKkvyXyTASm/5g6/Ww
	aqSNfxrrgf8zp10+sRYVfkzIH0zKmawaNAIVluDqhwh4OcOGPQDX6QLMDJFsKk+nilbsgdhTwop
	wTPf6Wp4fhCr3QGzLM47JgnJwdUSsApEUznDoGcPaCxJuQXqzi/dPhbyinaiBZorpVkI6+Hl6E3
	Of1twBCf4gIJl/ucWGinypW9QGpZi+noNciRHN9VssgbYtzOwvVKF6zAU1rrEYQigsBect00GQH
	JoC6kqUseA+4UzwmPFY3t97cCYy5g7MBRap1ZlcSxu3scupVbGiiydHNErP0797w+6Mjw=
X-Received: by 2002:a5d:5f8c:0:b0:473:536b:5d1a with SMTP id ffacd0b85a97d-47934d7563fmr3281356f8f.7.1783047631599;
        Thu, 02 Jul 2026 20:00:31 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:30 -0700 (PDT)
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
Subject: [RFC PATCH v2 01/11] rust: usb: add synchronous bulk transfer support
Date: Fri,  3 Jul 2026 04:00:05 +0100
Message-ID: <20260703030020.2694-2-mike@fireburn.co.uk>
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
2.55.0

