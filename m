Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0B47CC7E
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708455; cv=none; b=XNt3Al+uzcwylmllDy+Eyg2lrdF3KBYP5fMFNSgc4iQrWmGKSCAd435VR8yQkh+OxfuIwe9J/tiWnrfvDSzZ5kKhL9RovRjVg+4pQg00QHDxszohzP+dIHDuEjaUlpmMq8FkIFavN2yKEAZGYqZWh0jbvyPWXwutQN7WWhN8Hws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708455; c=relaxed/simple;
	bh=mz25HxvzR3lc6zELqWg58rQIeEXR0lfdEHWs71MyGvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihz7/F95f7hBzMa7C4d2d82ctYNpJNZEckOU+L1qw+/joRIJkwxiclBiqujqTijzhgYH+dpuWCooxcWg82zdJ2HmJho2sY2djNmVqSOApVEHjmsz/0nPYqLTh/wHvl+XAAJcW4O1AaQYzncVXIqBydocr7Z3OdlBMLuenA4okDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=o4luoQMO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="o4luoQMO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so40652065e9.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708447; x=1782313247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tgzOBV4pKNUk6kdpGttXymW8QGb9VnD8zatKC61uXU=;
        b=o4luoQMO5c1GO7QQmuer0tixXDgP6ZnNDjSYlABUG4mwhXLwhluXBh6vMaN3cB8e6U
         WkDgQElJVWuxPL6I2jsRj2JXbp9LizJ+OWcQy2YmHL8PIGQh3epUI3o4wdftP0bhUb9X
         JBcTNnYm6/u7B1PabosAN8Djgb8kvATv5y64lo+NPpjQqTM4gcup2qPajGm4q2QhhPGD
         Cohgr66+tbxxpoiKFyNbiZ/8fM2Lb2j0h6UKF7pdjFX5b2a7yLfLaFhktkARTAzeAMd9
         x7BsUt9UZuqQmFNdo1aM/4bk0GVjvf8z2mw89JV0/N7Jha3FGzp2T2s5gBu8b/tELHjn
         Obkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708447; x=1782313247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tgzOBV4pKNUk6kdpGttXymW8QGb9VnD8zatKC61uXU=;
        b=O8/Pt4d2RIMug943gWDSYlMCbcLFqrExDlT54VRIWovDA/LIJW0Wf+KKE0TNmHb6Oo
         dgrda/3Sz5P+UFZsqq61PdXmw/M1TiaKK69KmSS2shwLZzPlqeDeKgGY1BKxWbrzpg+q
         ycWlyUdZF0HRiBBpGeBUqhlwbdfxD0KDzkcMBBnMDcYRKzBi8YRVXHjaI3LKxiuVsC89
         Xl9/6CiEuySwDJFmEiIgPEf0xnLFxE5yc1ybkeunoY5PCfbCxXR8Vfwysw6jZaUBGhAj
         PZ2bFwMpCwJi8O4n/rwadqJ5bbG54v7dGdSv3Nv4FJPaiu2og9MHQQwYAk9ZyQcvMIoQ
         tSQw==
X-Forwarded-Encrypted: i=1; AFNElJ/zV8S5sIUSoEgErVVl1fQE9/JhMXnzY3se2SdEmmpjSIbjBtsnJA6ToCtrRrOQ5cEGKC34bHlyra0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFj7EeUzDr/Q+n5fEeTJ+TZv1kyS15D9/65tQTFNncnpg4cSzu
	d946prgOV7qcjv9mFR2Gqnd+gGY2z5IGYeVyifmtM+8Xa/oLNQnYl3OyM/egOMOtJg==
X-Gm-Gg: Acq92OGpu8D1PtFmplXZ8TsOY/alSVWDfxQhhoLsyOqmoPmA9/8odFkEwIyILAeRZIi
	thdE54ISmV5nTdSmgIvfh3/QodRhsPfpQYbAdH96kSW7HoPwxUmIEchiIwCCjEQVNXJuXlHy4/8
	stVUyKB/I/f1FkX78A+o/y9YgdJrkDqiRNnU/ufUUW4Up/r1P4Vzqgg4YTwAR9uj6eQOGo0Yhwt
	czxDAbxG4GnXHCnbG4pbUasUGD/rk/NnbmDo5vgsrewGZZhnj+YCen7ENpsPAJTk6CaKzaA34QR
	hpO89/QFNQd6NRqWwvYAc1kymT7vX6WlsbZ/vVHUL/w+e9RJSG/0BOdR5uWtCbNEude18csjam8
	60ahhltxji3hmSgIiqmEkm1ihy2wXcwwL/OgoYWpFbeSe/8SBwvpSGP4reZsHRdI4IFUvy2/uxQ
	4ZUyLKK+k/PL2dB5YlyzVTHDcpPoxJI5X64HCo/nbYjcnoqoJJTqWQEFK3
X-Received: by 2002:a05:600d:4453:10b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-492341086a1mr47610865e9.11.1781708447177;
        Wed, 17 Jun 2026 08:00:47 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:46 -0700 (PDT)
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
Subject: [RFC PATCH 2/9] rust: usb: add synchronous control transfer support
Date: Wed, 17 Jun 2026 15:59:14 +0100
Message-ID: <20260617145946.1894-3-mike@fireburn.co.uk>
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
2.54.0

