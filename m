Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62DD277C9E
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047657; cv=none; b=sJpgLR8VIW8lwhUZFqBVx43awBQtdYeHCaIWZ5e89S+FVNSuZpGT3GVUeWSkq9FGt0dN3cxsbLps8FnIAX0NZrDbrXp6UkNFAgdyPeFa+pNgCITt/ANSeIbtfUofLfsrUucwrpUMCJIEalqiU1hNFjhhJ0KvfpyyNAdUelqat1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047657; c=relaxed/simple;
	bh=8LVhBo2T7BTsl0fsGC8udf8w8n1qiuJizusICzWjqjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jr5KwFIFa/2D5ueu6mShAiGF7xEr1Prye+wBRMkk+DJTuWvICGU/hBlEvHjjnN6yDBFnQU8Dy2j5NY2u6yYXThx52S8ZHFAz/uYEohmZfyWLXqWcDpJHLNBQDKRYZWVfDjbySjHwXq7pg5zHJq4dTcLhGS6nj/k7HapMgkRPttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=B+s3/+4d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="B+s3/+4d"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso105583f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047647; x=1783652447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7LHUu/yCCTdJ2WalGExcdxSMqsYpWWRCtKfTbZ2Ax8Q=;
        b=B+s3/+4djZsBXEh+b6EPkSJedyBTmcdyc/1CJjRi3xTYUuam2C9LdZMWmGhh2wmVCD
         GOZ2DRJtvVrm5zmlzvgMXkfa9s1qtbFnik5K+xFMbWBfgNj+dbAs2HjHZR+oLoVKIUSj
         daQmpiT77Woh6A9ayE2K481hEnVqNwepznmyqVY06BygItZ27T18zpS6raszusXoBr7z
         9L7SqcYqQivVNQky4GIOlFhUPELrTRuPuTyOq2jt6H815zkCvYvCPsHxt1soxb/WxOne
         O8/G7u2CCA2gjeHRSRodviqkVTYsmtSHzscVjMBJh2WH+FA/q7ftQp+/+VkwWcLEd5RS
         BPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047647; x=1783652447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LHUu/yCCTdJ2WalGExcdxSMqsYpWWRCtKfTbZ2Ax8Q=;
        b=Yb0EjqPtz326mRlDaBYoaOHObXM1EDFj3bn/y1dG7/T3Leicy+Q1/fusZfh37N95L+
         PPaOs2QBSDWQysU11DUWW2/8GePf33ola8664mRpo4uVbcSkYVRiosiOzjiUn7j3+FoF
         +IgteQ9GK4mD82IYGUqlZC42PjOLLJv4LuSSTWBvOhGmVmjTe5Ij8rUZWuNtT1xscdNK
         EjZeQg7IBTtyebYMRL8MolzMEFVdUuaoxVz8BAM+o2082spavLAQgxda5Qr417uqnA8/
         U2HN6jMc5lkL2pfrU51rikk3Y+Sz4DlcaQAwMPV5fytWu6d0VN2WDVTuBOYiJPGswJrX
         jMZw==
X-Gm-Message-State: AOJu0YyQ9HPpEQaaVxBw2szo9/sZ6LRcq4TmlZ+oGm4Z2eLnv1RlHoHt
	SyA7hwrv9Yy80XvP2GeKCtaGJbKxH0zwOXZA0zodbKUMWhv4fECxTb5aPwvZBvb+DQ==
X-Gm-Gg: AfdE7ck7DD/bNtE8l4XYL2jJ6v9TddRTs1bvKHO1unUEmaC++i35sZCZ11ARSjxX0fb
	mE7b0GKYjIKF1TDEXiECtSfOAVWfaeOwsDya7jRHYN7Z8IpPiybNP4U+8Np2gtSwLwCV5aICEAr
	sxgJpBgFr6xl1PiPCUfGVMxH4e+xBFVXd4op42JkZPT0bdo+Um+lzjR05f4pxaiROldjtQgyLNr
	D2eqMrRCJeJ5XbZHvUlBj98MGzk5MRIoj0WfaeaNjJ8QYXCMfYFT7ZfLRLVKFwJhymTOg4XgAVM
	7jP6YL1iPuwHXCaYMQvn9OvBkH3jQXqMahorGCtkDlNbGy0kX6+gUd+F8o+uHvUpxiF+0AM7UP1
	KQph/7O08jV2t0XxCL4NOiLZOwFVIhEROKT2GhBAZtJXxuTBqts6opWpFVauxZgWAezD+lDmd/9
	FarcZGw5Wj0HkdLatk0Zgci4sN1MATPq3vOVQxsX4V2zVYS6un6Pn7lY5O
X-Received: by 2002:a5d:6f1c:0:b0:478:6c1:6e34 with SMTP id ffacd0b85a97d-47806c17142mr8918741f8f.13.1783047646961;
        Thu, 02 Jul 2026 20:00:46 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:45 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/11] rust: usb: add an asynchronous persistently-queued bulk IN reader
Date: Fri,  3 Jul 2026 04:00:12 +0100
Message-ID: <20260703030020.2694-9-mike@fireburn.co.uk>
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
2.55.0

