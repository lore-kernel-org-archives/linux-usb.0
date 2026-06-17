Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D547F2D9
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708465; cv=none; b=WhzTvSBEMXlNV9x7qkUc6qJOUJyxjOSLThuG92YNGFb6m4Nh141OjvW8LwaUcmS2ANGUseINDoqRbJ/EQ05EdSGMCMsnkssxbIXg9XlhoCs1NfMTEvSR0emhcIzmovVeem9x5vsUG1xgfsewIiG5SkIP4QLGzrqx4p+0zv3CopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708465; c=relaxed/simple;
	bh=F6jQEmuX8Efy1xclNPnlsc0giUo4y44M3dcVMOoLpOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OwcyVpZhwSjjBJJ2Wl4URLEQo3BQMPe8NBVtDNBlHrXjxsGOYW6msgL1NFeKxs4mnzzhEX5q99O0F4wrMICPgvEMs5RNt34T0MGXKeD9w+eJ+GnqpKaPYc1aQlX0rcvK8+ag/3aiVpPE0Fp5QKvlC2QjBAXismnYVNVfsDkwHpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=MwNGZuhT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="MwNGZuhT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49230a567a9so11267655e9.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708455; x=1782313255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWgJgZqcdTwi3W1d488vxFVq3UarMZUCPYVHt0qVRrE=;
        b=MwNGZuhTB3a0tm22iRN68Vkf0Vdja2NgNB6CbkvKokE92Sjsb6+SJRvyPKum/K3/2Y
         NGI87YOO0xKLMSsaQYnyFCMcSPh6yBMwsVqw7BGRS8Vv+FqnwuvghgAoJj1jd3PmdXc6
         Pec2XW8nKopodCVzKUlYPvTwXM7WU2y+DQ8Xq6mh5b5yLpVeYVBxoI12MeVWotSqY3Xj
         D8+StuSL1hlzhR8xVtLEBoqDy8NeLnrti+uVY2g1E+F53RfCP0mTcD3b/vGnJy+13HH3
         p3vARe2luUTK6BAugvqiugkoVFglClazFwQVVHijPXU7GCcuDswWiBKnGViXDn8Ztx2X
         PiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708455; x=1782313255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWgJgZqcdTwi3W1d488vxFVq3UarMZUCPYVHt0qVRrE=;
        b=YAi6NGthbmACfwHWPIdKiP64RweFMYZp2OU8Sis0tdq7h098cvzN+llmNdjpsPMzns
         J23jr7M0sm0yOz+RP1fe3xDw8K0ij2fQiU+f1ANjo0WVhYE9wjTg+IW1VIVnvR2RrxR/
         D1LA8OWpSVKx7QUWs52KEA7qVanahb1gMg7JkfSKA6WCe0FW7TjSZPVE6+P+gYIvWoiR
         LgiQdUZUCaDarr0is/vsk2bGZW22X4iMxHLfhx5UXFFwxYjXqBLlP14gw7cOP7a/9Ntv
         PvqwEZ5zOxjEPwqBrCz6iL8BqqnrTo+Mf3E/GmpOIfHabepSpBgYGw+DQCdnnOgjneJW
         rS+w==
X-Forwarded-Encrypted: i=1; AFNElJ8NeU0qSSZUgNpdCVuCNdNAiHy8saP69/mTF9HPFdLbNIDiqxqzWDjmhJUYhwWGs6kuJqIEXCe776A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtrJ9VuJ3FSOTxsXx+/dkBrB0xzgigBEK/Y2nmf4Dr1OtRibS
	TOBDJsHr1iCN3Oe0KgYmj/xg8hP3e9fIbJonuK/GWfnShi2hU9lhWutbH1q2xjaRnw==
X-Gm-Gg: Acq92OEgT/SPWt1ygnVyaMevcvR94AaUlws/JzsEFTlMonRd9xt0i169uik057DuXUv
	E6KhhV78Iq9atTHMvyVOFK7RYHrTk51iuIQ0HDQizGlfv/hJmpWaF2meG2PCHZ9UyznKhH5K4zK
	/jdY0rxc/1pXOeCP979ULVc29fbscczjlgiQrWTPyhh0scapXyH5MXJ7/nsETmcTSfU94IsneSR
	vcUJrwwMX8UEfqjaIEl6pXzFA2PhQGht3apHMg4uPCq+j7Iub1/w5AO0Bv5PfdRLmbFyr5i4vun
	R94FgGOTUsrpwDCWNXwgHu+0oPyzJVE5myYnqtYUTsgaVQXKppQHLx96dUqZuN6VT5LwEvsOKdF
	2wKYUeX42obe3mPgRqo5JSYFkcsxVdq+4RFKycwl90/gTkqOf+TLbBhwP9UzF+w+8Z5eoMPjZEs
	q0Fw8rZJREFduj81ItcuwG/UFkmfGcx0vNg7rI/ORP7PW23J+2LIhTDU49
X-Received: by 2002:a05:600c:c114:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-492333faba1mr57401975e9.16.1781708454709;
        Wed, 17 Jun 2026 08:00:54 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:54 -0700 (PDT)
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
Subject: [RFC PATCH 8/9] rust: usb: add an asynchronous persistently-queued bulk IN reader
Date: Wed, 17 Jun 2026 15:59:20 +0100
Message-ID: <20260617145946.1894-9-mike@fireburn.co.uk>
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

`usb::Device::bulk_recv()` posts a single URB for the duration of the
call, leaving the IN endpoint un-posted between calls. A device that
pushes a large reply while the host is blocked on an OUT transfer can
then stall the bus in a FIFO deadlock.

Add `usb::Device::bulk_in_queue()`, which allocates `depth` URBs (each
with its own kmalloc'd DMA buffer) and submits them all up front, keeping
`depth` IN transfers continuously posted to the device -- the
always-pending-IN behaviour of a libusb async event loop. The returned
`BulkInQueue::recv()` waits for the next completion, copies it out, and
immediately re-submits that URB so the endpoint stays posted. Completion
callbacks run in interrupt context and do nothing but signal a per-URB
completion; all data handling and re-submission happen in process
context, so no IRQ-context locking is required. `Drop` cancels every URB
(`usb_kill_urb`) and only then frees them and releases the device
reference.

The URBs are filled with `usb_fill_bulk_urb()` and re-armed with
`reinit_completion()`, both reached through `rust_helper_` shims since
they are static inlines; the queue owns its URBs for its whole lifetime
in a fixed slot pool, so teardown kills them directly rather than via a
`usb_anchor` (whose group-wait primitive does not fit the per-completion
delivery this reader needs).

This is consumed by the Vino DisplayLink DL3 driver, whose EP84
control-plane endpoint must stay drained concurrently with the
OUT-direction handshake bursts.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/helpers/usb.c |  17 ++++
 rust/kernel/usb.rs | 193 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 210 insertions(+)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index ac7b30334882..1501f5438e43 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/completion.h>
 #include <linux/usb.h>
 
 __rust_helper struct usb_device *
@@ -8,6 +9,22 @@ rust_helper_interface_to_usbdev(struct usb_interface *intf)
 	return interface_to_usbdev(intf);
 }
 
+__rust_helper void
+rust_helper_usb_fill_bulk_urb(struct urb *urb, struct usb_device *dev,
+			      unsigned int pipe, void *transfer_buffer,
+			      int buffer_length, usb_complete_t complete_fn,
+			      void *context)
+{
+	usb_fill_bulk_urb(urb, dev, pipe, transfer_buffer, buffer_length,
+			  complete_fn, context);
+}
+
+__rust_helper void
+rust_helper_reinit_completion(struct completion *x)
+{
+	reinit_completion(x);
+}
+
 __rust_helper unsigned int
 rust_helper_usb_sndbulkpipe(struct usb_device *dev, unsigned int endpoint)
 {
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 5dc5b496b970..d77cda9ac15d 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -714,6 +714,199 @@ pub fn reset_configuration(&self) -> Result {
         // host-side endpoint state for this device.
         to_result(unsafe { bindings::usb_reset_configuration(self.as_raw()) })
     }
+
+    /// Opens a persistently-queued asynchronous bulk IN reader on `endpoint`.
+    ///
+    /// Allocates `depth` URBs, each with its own `buf_len`-byte DMA buffer, and submits
+    /// them all up front. The host controller then keeps `depth` IN transfers posted to
+    /// the device continuously — matching the always-pending-IN behaviour of a libusb
+    /// async event loop, and unlike the synchronous [`bulk_recv`] which posts a single
+    /// URB only for the duration of each call (leaving the IN endpoint un-posted between
+    /// calls — a window in which a device that pushes a large reply while the host is
+    /// blocked sending an OUT can stall the bus in a FIFO deadlock).
+    ///
+    /// Completion callbacks run in interrupt context but do nothing except signal a
+    /// per-URB completion; all data handling and re-submission happen in process context
+    /// inside [`BulkInQueue::recv`], so no IRQ-context locking is required.
+    ///
+    /// Must be called from process (sleepable) context. `endpoint` is the bulk endpoint
+    /// number (low nibble of the address, e.g. `4` for `0x84`).
+    ///
+    /// [`bulk_recv`]: Self::bulk_recv
+    /// [`BulkInQueue::recv`]: BulkInQueue::recv
+    pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Result<BulkInQueue> {
+        let dev = self.as_raw();
+
+        // SAFETY: `dev` is a valid `struct usb_device` by the type invariant; take a
+        // refcount so the device outlives the queue (released in `BulkInQueue::drop`).
+        unsafe { bindings::usb_get_dev(dev) };
+
+        // SAFETY: `dev` is valid by the type invariant.
+        let pipe = unsafe { bindings::usb_rcvbulkpipe(dev, endpoint.into()) };
+
+        // Build the queue first so that on any early error its `Drop` cleans up whatever
+        // has been allocated/submitted so far (and releases the device refcount).
+        let mut q = BulkInQueue {
+            dev: NonNull::new(dev).ok_or(ENODEV)?,
+            slots: KVec::with_capacity(depth, GFP_KERNEL)?,
+            cursor: 0,
+        };
+
+        for _ in 0..depth {
+            // DMA-capable IN buffer (kmalloc-backed `KVec`; contents are overwritten by
+            // the device, so zero-fill is just to establish `len == buf_len`).
+            let mut buf = KVec::from_elem(0u8, buf_len, GFP_KERNEL)?;
+
+            // Per-URB completion, signaled by the IRQ-context callback. Heap-allocated so
+            // its address is stable for the lifetime the URB references it via `context`.
+            let done: KBox<Opaque<bindings::completion>> =
+                KBox::new(Opaque::uninit(), GFP_KERNEL)?;
+            // SAFETY: `done.get()` is a valid, uninitialized `struct completion`.
+            unsafe { bindings::init_completion(done.get()) };
+
+            // SAFETY: standard URB allocation; returns NULL on OOM.
+            let urb = unsafe { bindings::usb_alloc_urb(0, bindings::GFP_KERNEL) };
+            let urb = NonNull::new(urb).ok_or(ENOMEM)?;
+
+            // Fill the URB as a bulk IN transfer. `done` is the per-URB completion the
+            // callback signals; `buf`/`done` outlive the URB (owned by the slot below).
+            // SAFETY: `urb` is a freshly-allocated URB; `dev`, `buf` and `done` are valid
+            // and outlive it.
+            unsafe {
+                bindings::usb_fill_bulk_urb(
+                    urb.as_ptr(),
+                    dev,
+                    pipe,
+                    buf.as_mut_ptr().cast(),
+                    buf_len.try_into()?,
+                    Some(bulk_in_complete),
+                    done.get().cast(),
+                );
+            }
+
+            q.slots.push(UrbSlot { urb, buf, done }, GFP_KERNEL)?;
+        }
+
+        // Submit every URB. On failure, `q`'s Drop kills/frees the already-submitted ones.
+        for slot in q.slots.iter() {
+            // SAFETY: `slot.urb` is a valid, filled URB; submitting transfers ownership of
+            // the buffer to the controller until completion.
+            to_result(unsafe {
+                bindings::usb_submit_urb(slot.urb.as_ptr(), bindings::GFP_KERNEL)
+            })?;
+        }
+
+        Ok(q)
+    }
+}
+
+/// One slot of a [`BulkInQueue`]: a URB, its DMA buffer, and the completion the URB's
+/// callback signals. The buffer and completion outlive the URB's submission; both are
+/// freed only after the URB is killed in [`BulkInQueue::drop`].
+struct UrbSlot {
+    urb: NonNull<bindings::urb>,
+    buf: KVec<u8>,
+    done: KBox<Opaque<bindings::completion>>,
+}
+
+/// A persistently-queued asynchronous bulk IN reader. See [`Device::bulk_in_queue`].
+///
+/// Keeps `depth` IN URBs posted to the device at all times: [`recv`] waits for the next
+/// one to complete, copies its data out, and immediately re-submits it, so at least
+/// `depth - 1` transfers stay outstanding while one is being serviced.
+///
+/// [`recv`]: BulkInQueue::recv
+pub struct BulkInQueue {
+    dev: NonNull<bindings::usb_device>,
+    slots: KVec<UrbSlot>,
+    cursor: usize,
+}
+
+impl BulkInQueue {
+    /// Waits up to `timeout` for the next queued IN transfer and copies up to `out.len()`
+    /// bytes of it into `out`.
+    ///
+    /// Returns `Ok(Some(n))` when a transfer completed (`n` bytes copied; the URB is
+    /// re-submitted before returning so the endpoint stays posted), `Ok(None)` on timeout
+    /// (the URB is left outstanding — call again to keep waiting on it), or `Err` if the
+    /// completed transfer carried an error status (the URB is still re-submitted).
+    ///
+    /// Must be called from process (sleepable) context.
+    pub fn recv(&mut self, out: &mut [u8], timeout: Delta) -> Result<Option<usize>> {
+        let i = self.cursor;
+        let jiffies = unsafe {
+            bindings::__msecs_to_jiffies(timeout.as_millis().try_into().unwrap_or(u32::MAX))
+        };
+
+        let slot = &self.slots[i];
+
+        // SAFETY: `slot.done` is a valid, initialized completion.
+        let remaining = unsafe { bindings::wait_for_completion_timeout(slot.done.get(), jiffies) };
+        if remaining == 0 {
+            // Timed out: the URB is still outstanding (posted). Leave it; the caller can
+            // retry and we keep waiting on the same slot.
+            return Ok(None);
+        }
+
+        let urb = slot.urb.as_ptr();
+        // SAFETY: the completion fired, so the controller is done with this URB; reading
+        // its result fields and buffer is now race-free until we re-submit below.
+        let status = unsafe { (*urb).status };
+        let len = unsafe { (*urb).actual_length } as usize;
+        let n = core::cmp::min(len, out.len());
+        out[..n].copy_from_slice(&slot.buf[..n]);
+
+        // Re-arm: reset the completion (the URB is not outstanding right now, so nothing
+        // races this) and re-submit to keep the endpoint posted.
+        // SAFETY: `slot.done` is a valid, initialized completion.
+        unsafe { bindings::reinit_completion(slot.done.get()) };
+        // SAFETY: `urb` is valid and not currently submitted.
+        let rc = unsafe { bindings::usb_submit_urb(urb, bindings::GFP_KERNEL) };
+
+        self.cursor = (i + 1) % self.slots.len();
+
+        to_result(rc)?;
+        if status != 0 {
+            return Err(Error::from_errno(status));
+        }
+        Ok(Some(n))
+    }
+}
+
+impl Drop for BulkInQueue {
+    fn drop(&mut self) {
+        // Cancel every URB first (waits for any in-flight completion callback to finish),
+        // THEN free them. Only after this do the slots' buffers/completions get dropped
+        // (struct fields drop after this body), so nothing the controller could touch is
+        // freed while a URB is still live.
+        for slot in self.slots.iter() {
+            // SAFETY: `slot.urb` is a valid URB allocated by `usb_alloc_urb`.
+            unsafe { bindings::usb_kill_urb(slot.urb.as_ptr()) };
+        }
+        for slot in self.slots.iter() {
+            // SAFETY: `slot.urb` is a valid, now-cancelled URB; freeing drops the
+            // allocation's reference.
+            unsafe { bindings::usb_free_urb(slot.urb.as_ptr()) };
+        }
+        // SAFETY: balances the `usb_get_dev` taken in `bulk_in_queue`.
+        unsafe { bindings::usb_put_dev(self.dev.as_ptr()) };
+    }
+}
+
+/// URB completion callback (interrupt context). Does nothing but signal the per-URB
+/// completion whose pointer was stored in `urb->context`; all data handling and
+/// re-submission happen in process context in [`BulkInQueue::recv`].
+///
+/// # Safety
+///
+/// `urb` must be a valid URB whose `context` is a live `struct completion` (guaranteed by
+/// construction in [`Device::bulk_in_queue`]).
+unsafe extern "C" fn bulk_in_complete(urb: *mut bindings::urb) {
+    // SAFETY: by construction `context` points to a live, initialized `struct completion`
+    // that outlives the URB.
+    let done = unsafe { (*urb).context } as *mut bindings::completion;
+    // SAFETY: `done` is a valid completion; `complete()` is safe from interrupt context.
+    unsafe { bindings::complete(done) };
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

