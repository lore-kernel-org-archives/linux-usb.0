Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D077480DD8
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708469; cv=none; b=Tj+Ri7Wh0h/1Y0EKi4PE2pggaTbyumrAUlFQ0Th8Gzl+3JbV38e9ZQDi8MW2QGwH67N9Acg0PKjVMifh/Q10xSVGypxaSvOJrOA7CdxlNPed96qqkJZIWKxAPkjNM3dykPZ3ySrnZPTprMvuNoGOSHgFZm7Y2Ma1BtGGmbxgzZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708469; c=relaxed/simple;
	bh=bt6zDaJ0vnaMQLoNWupzf/a3UM+UiIsrWDMomBp40HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miF5RXhRY+mBsrWALRCzV+0jN1nWGp9sBYTM/R3vgHqz3Tof/hGKn5+VY6R6FnpRX852QI4tubDEwfAX3Vqb9OeJHnel8OuKA1WLNHQrbMHyh3pJsOVT9ll0h4Ly5zAdVQilxqMAZh0VMRa1y0q4FLfy3L+Y5YE2XSIzjt9U9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=x7FnnYAe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="x7FnnYAe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-461a15cce0bso1463000f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708462; x=1782313262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPoNdpy8AP15AC8CXF5QBgukG+bCqakvIlPx8NzDbIM=;
        b=x7FnnYAeua8ZXl0g+lSVpHQsqLe7Yfo2//bOR4mNrOEbKsTO3ms5CEt1ndeEYCJkPo
         1NKCwL1DKLy8qDbK+t6OpMwZmXCbbyxcD3cf5UA8nKWI92+hWpDtWQTufxxhzXKhRl/m
         9CW4TUhaew48vezcy1PEi1fYYdI+gxK+OLFaCzAA1RKJ/XEhOeC0G+CTbnX0w+KQpYD6
         khuW0Ed5xcwGsV677GhzvtpfsuBU7XVGAicNKN/klBSq1GLQRlaobeC6YclQzFSyP0nn
         pA8KaYPPuwcNnPsnp7CxURjWhj0ZGIkSwK4DugNE+Ft7U74Ru8gIO2V/iLtnWPWp3sqU
         v4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708462; x=1782313262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KPoNdpy8AP15AC8CXF5QBgukG+bCqakvIlPx8NzDbIM=;
        b=F2ZeQ46pTo2I/HtdoSXASLwdfy/gOLGGReIB5lLyf7yAjVUMnLHiefmlonNGrmxUoV
         j7q/l/hVYlEETIoZ/53j0NOkOnLKSg1zJwti5B4z39KYodt/9y2L9/2H9j4jnN5giJ7G
         IMBSrenxhkSSj5v6YOFXGd7xr5t+kRBlpbaZYNylFjHV4ql4ZQRrC5iRlubfKTckh5iP
         495SM08VmWdo9x7mIBg1AsbtqJluk2wew5pu+vvFzBhbwtq7UFb6CbFiCHOWvpn37Fie
         W3fIhUQzX6Zc0I1fQlXxZ3GCDdz+aoDo40rOKJqIaqky4eRjyMKVlMmSBpBIiLP0JvnY
         QUQg==
X-Forwarded-Encrypted: i=1; AFNElJ+7ArZMc07MJMVtzNB4OQqlSEvtyvZiTHmvjRcQkImYtaOwYdvVtk10XD8Dpr6XYBpphz1QpRANvuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPuWtkK+KypRYmp4zQBJPiCnrXs3zc6zYjg9twej2rBLzWpP9t
	506CWj2p1/H33IpG0FmEHDlBlS6GbvikJ8J8p4QBWWeVzNUGBb7mjcmrbT6gwx413w==
X-Gm-Gg: Acq92OFaDWNls7ijbQt+nMyeL7DxOfjPJI/330M/pPJ6/lVBif7mCX7rEQbqov+jIsh
	ucFBTmt91yKsf/6uwi4wFLHkL4t1eEYfzFjMzUP29V10ONQzmPW0z/vQGV2kAmMFgKr29TlZRfb
	No2h5CY/n7DO+5dZnMU/TC/l2eiaw9o3APFpw/BW+OIVzmoqag+Mz5sz6kVflWyIs5kOrnRgStw
	PY80SL53IZBlVjEJfnN8PNfP9R1MHgJjcZG2wr+U5B7K2xcqMXB/n2em5/YHgx/e+09Rz106BUi
	g0Om+FH7N1PUq8SU02x/RFsLxmBAoWMliiT+WRaFAZ4B23Yy+kRcg9ihk8yZz4F8v58ydUiN/jX
	B1bK8D5/uuDrtiUuw9D4/k1OmXtAo2djZxGhyKNcyxCGbOwhv0ufGHTVRrWGlY+3hEo/p7tLVRk
	4KD8ll3Oe+9VnhCo+Z2MMdOJpP1HQBfI8WAPb1OdTfBXAVCzIO0MuE0ir4
X-Received: by 2002:a05:600c:6089:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-492333ba29dmr75144445e9.6.1781708453371;
        Wed, 17 Jun 2026 08:00:53 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:52 -0700 (PDT)
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
Subject: [RFC PATCH 7/9] rust: usb: add usb::Device::reset_configuration()
Date: Wed, 17 Jun 2026 15:59:19 +0100
Message-ID: <20260617145946.1894-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe wrapper over usb_reset_configuration() so a Rust driver can
re-issue SET_CONFIGURATION for the device's current configuration,
resetting every endpoint's data toggle and returning each interface to
alternate setting 0 (clearing stalls) without re-enumerating the device.
It sleeps, so it must be called from process context.

This is the in-kernel-coordinated way to recover a device whose endpoint
toggles or stall state have become inconsistent with the host -- e.g.
after another driver was forcibly unbound, after error recovery, or to
return a multi-function device to a known state before re-driving it.
Drivers must not open-code it by sending a raw SET_CONFIGURATION control
request: usb_reset_configuration() also re-installs the host-side
endpoint state and is serialised against the USB core, whereas a bare
control transfer is not and is unsafe on a composite device.

Because it re-issues SET_CONFIGURATION it resets the toggles of all the
device's endpoints, so on a composite device it disturbs sibling
functions; callers should treat it as a heavy reset, not a per-endpoint
operation (for a single stalled endpoint, prefer clear_halt()).

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index c7bf4637ee90..5dc5b496b970 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -697,6 +697,23 @@ pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
             bindings::usb_set_interface(self.as_raw(), interface.into(), alternate.into())
         })
     }
+
+    /// Re-issues `SET_CONFIGURATION` for the device's current configuration, resetting
+    /// per-endpoint data toggles and returning every interface to alternate setting 0
+    /// (clearing any stalls) WITHOUT re-enumerating the device.
+    ///
+    /// Wraps [`usb_reset_configuration()`]. This is a blocking, sleeping call and must
+    /// only be invoked from process context. Note: it resets the toggles of ALL of the
+    /// device's endpoints, so on a composite device it can disturb sibling-interface
+    /// drivers that are mid-transfer.
+    ///
+    /// [`usb_reset_configuration()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_reset_configuration
+    pub fn reset_configuration(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant;
+        // `usb_reset_configuration()` only re-issues SET_CONFIGURATION and updates the
+        // host-side endpoint state for this device.
+        to_result(unsafe { bindings::usb_reset_configuration(self.as_raw()) })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

