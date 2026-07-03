Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784727E076
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047644; cv=none; b=Ecoz6nKSvzVMJK2GXw2NDcwwmllpzpRa0dZycj6tK5urxBaJvIU7CuUs2lEDBs5g7/Vt7hFN/qJncmoGi/nITMiosbsnE783PsZFkFaJ6F222hBinqO4GZNucfh3DuxhA25uElmbN+dzLFfgIlyiOhD1yEHNQryHA8EH12NQNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047644; c=relaxed/simple;
	bh=R7pafxZtnTB8RiZsr6l9LlVOWfwg9mjNnd8zIeHZrQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYqe2esx9Mnk5dxcOqV4imKBFZIWca+Dm+BlbTz+hSG3zZDG/PTS25kXUyEQvHHzY/L8pqequVF4fNwfgPOz1ziD45EdEGE/+huosy9mD+KrFx/yM9M3cY75u6Vr19l1eM3NYSWo/OglR3Zm2SvhcawW+ZC+2YFlG28Sv/NjYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=L5tN/Keg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="L5tN/Keg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47488efcf30so48506f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047641; x=1783652441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/qWpxOilsLHMxCkcCuMt5GG4koplq4ju+XxBWFGFBc=;
        b=L5tN/KegKRehpnJZ1URWRmt+VZfKjLCNp8l7LivPG4DZ958aR+cdW6EviMG4ueWouT
         FT1NWfLPrpFDEmUQNpIKvxbX8opteLhLQggmQdyLi0JaQV44D9x5MIG0gW1BupOh8EBG
         pdZ6hRuu4SeFrRu+GT9Hy8llPiY7so39yo72nTIpieqo+rha6vWYGRmcBSqJlxy/ed8N
         wlGvc3yXjD6V31WRyqzc/oPoHvisvfKoFomMsqLjDJk+5sIxE4Xg8ZRCfDyhd7P3OFdd
         FnnhWjAfqLf2JjzrReLawNWaAqgWcUns5WVM3KowJuZMI/0KtC0hCptTdA2ARRWg4BlL
         nZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047641; x=1783652441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/qWpxOilsLHMxCkcCuMt5GG4koplq4ju+XxBWFGFBc=;
        b=Fk9ZzFSBliXFACAhAUSCeAkjBxpJdz65weMZN2+kindiYYpl6nf2iFU8U6sqr5cYK8
         VufIQSy6aTyQaqshv4nvYFQCaNTO9ec2PdGvIbHZAg26dlH2BaWAp3jxu9P2AbL4aK/1
         gQSUXTfkdwJj4mIVM3JngkPVuqo+ykRkY0m5L1n0cuVVypaweKwvSjmyr7ZmuzooH4yI
         KwvXFPpGluVNxWnallBQYolsbMN7dmAVQYtHFFLRSH8EvOKurAPZfhdsmbG+oHBTLa9o
         6X9wTkygTu6oCmsAAANRoybCfTGmeuS3j02PP/sr/kq7uemYpJ3Q/hvQrVrTbpGTbItX
         nrSw==
X-Gm-Message-State: AOJu0YzfkinvJSb8S3eT4DJmomzmw2guCsd5K3YhPSkz9GXQHw0aKSpS
	gKr7i5GlKxk38t8Vcf0TLjCk8Pb4P2XDL1yZStpsiI1eLqONuNFTL75dB3rZfcJ5aQ==
X-Gm-Gg: AfdE7cmXBY+BmemFB2VjXoZmbjkReA4rR84SxahwFs2LjRk6S70jiCcgnXDyljidsgl
	MuusHWx//m+JI7jqJJRPbZAYysSQzNkkvzG18LQtNbTmVChdxikck5j1NN0WWrK6kbEqxLvk2gL
	1mzjabgJblsyzCrTf8x7bvZ3iW21SSB0A3IiiA+SZ0l3zcwIHeXTwyUSdQlL8wvc178azZEyvx3
	4wGsLfpeyR4SlWaexDRXPuc6YSoVUkOje/ae1Fft/NsLr3OV3cmzRB5ull+bt/uCo3cP1pnCr72
	Ein0CLJMrhcRoTJ2J0wS3bteAbIQLftuG4qbaqsdOy/gSFF1QXtxNZd7FHbDGlBEOvDkfu/+9r6
	QsVfOIOrKvrYdvWe+ajjNcTu69IMXDE9niJ8g/AkZlcLh4IH38zxZyugdAGFaEvat/qwPCfgiv5
	44p3beXgrW3GWVwaosSR7SqEyRq0qMeWTlvyVkwhFP7kyRshZ5hBRN5RT1
X-Received: by 2002:a05:6000:24ca:b0:475:f0f0:9eed with SMTP id ffacd0b85a97d-4775ac9f83emr13482965f8f.50.1783047641156;
        Thu, 02 Jul 2026 20:00:41 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:40 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/11] rust: usb: add usb::Device::interrupt_recv()
Date: Fri,  3 Jul 2026 04:00:10 +0100
Message-ID: <20260703030020.2694-7-mike@fireburn.co.uk>
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

Add a safe wrapper for synchronous interrupt IN transfers, mirroring
bulk_recv() but using usb_interrupt_msg() over an interrupt pipe so the
URB's transfer type matches the endpoint. This is the correctly-typed API
for reading a device's interrupt-IN status endpoints; usb_bulk_msg() would
also work (it detects an interrupt endpoint and rewrites the pipe to
PIPE_INTERRUPT), but interrupt_recv() exists precisely so callers do not
have to rely on that legacy fixup.

The interrupt pipe is built with a new rust_helper_usb_rcvintpipe() shim,
matching the existing bulk-pipe helpers (usb_rcvintpipe() is a
function-like macro). It sleeps, so it must be called from process
context, and like bulk_recv() it copies through an internal kmalloc'd
bounce buffer, so the caller's buffer need not be DMA-capable.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/helpers/usb.c |  6 ++++++
 rust/kernel/usb.rs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index d398eb2f6669..ac7b30334882 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -19,3 +19,9 @@ rust_helper_usb_rcvbulkpipe(struct usb_device *dev, unsigned int endpoint)
 {
 	return usb_rcvbulkpipe(dev, endpoint);
 }
+
+__rust_helper unsigned int
+rust_helper_usb_rcvintpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_rcvintpipe(dev, endpoint);
+}
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index a151a120e82e..c7bf4637ee90 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -566,6 +566,50 @@ pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result
         Ok(n)
     }
 
+    /// Issues a synchronous interrupt IN transfer on `endpoint`, returning the number of bytes
+    /// received. Uses `usb_interrupt_msg()` over an interrupt pipe (built with `usb_rcvintpipe()`)
+    /// so the URB's transfer type matches the endpoint — the correctly-typed counterpart to
+    /// [`bulk_recv`] for interrupt-IN status endpoints.
+    ///
+    /// This is a blocking, sleeping call and must only be invoked from process context. `endpoint`
+    /// is the endpoint's `bEndpointAddress` (e.g. `0x83`); only its low four bits — the endpoint
+    /// number — are used and the direction is fixed by the method (IN). As for [`bulk_recv`], the
+    /// data is received into a kmalloc'd bounce buffer internally and copied into `data`, so `data`
+    /// need not be DMA-capable. `timeout` is the maximum time to wait, rounded down to whole
+    /// milliseconds; a [`Delta`] of zero, or any non-zero value below 1 ms, waits indefinitely.
+    ///
+    /// [`bulk_recv`]: Self::bulk_recv
+    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+
+        // `usb_interrupt_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
+        // bounce buffer and copy out, so `data` need not be DMA-capable itself.
+        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        let pipe = unsafe { bindings::usb_rcvintpipe(self.as_raw(), endpoint.into()) };
+
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `buf` is a kmalloc'd buffer
+        // valid for writes of `buf.len()` bytes; `actual` is a valid out-pointer.
+        // `usb_interrupt_msg()` fills an interrupt URB for `pipe` and blocks until it completes
+        // or `timeout` elapses.
+        to_result(unsafe {
+            bindings::usb_interrupt_msg(
+                self.as_raw(),
+                pipe,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                buf.len().try_into()?,
+                &mut actual,
+                timeout.as_millis().try_into()?,
+            )
+        })?;
+
+        // `usb_interrupt_msg()` never reports more than the requested length.
+        let n = (actual as usize).min(data.len());
+        data[..n].copy_from_slice(&buf[..n]);
+        Ok(n)
+    }
+
     /// Issues a synchronous control OUT transfer on the default control endpoint.
     ///
     /// Wraps [`usb_control_msg_send()`]; `request`, `request_type`, `value` and
-- 
2.55.0

