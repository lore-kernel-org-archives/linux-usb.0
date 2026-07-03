Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBC2857CC
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047651; cv=none; b=ahSwulc1Kt44/hbjpWEGSwdyJ6FykajgOzPMMJlvBPzaUp/+16jZ09uS/jCrMevY1wV/mM/Dmdpi+B5V/ucm9JzuANS8L5RZIsUauw900fVZ+dVoJbqSO0NQk5tFW5RQmWTgnhS5UObeGbmKnEZGjKs9i9ZJeobIh9ufH8EVKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047651; c=relaxed/simple;
	bh=uxuzeLnNgjflF3TybJRFCjQpg7K0eWk4556A9oU/6Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0MKS0XwTMrHLC2CKGVpXOCydpz5xX6mEXd8mxvX93hZkOrBv68GZuinYr+6BzycQQyZrw5yRo0/tXCPGmLMulWGHaJfc/fBJ+2zoNHE0HahH6JeDLqBMZGP4pzHkteOwfx9+pVtsy2L7/0CxjxFaEMSV1mjhBS58q5S0fmgxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ifSckSiF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ifSckSiF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4745492ed3aso48793f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047643; x=1783652443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deICmiv9Ch/jTIv/OhIRyQpM4BjXGgxcInUpinxQbZM=;
        b=ifSckSiFFbY9SiuZZCejHf0GFd0JIweriH/LuZoCHr+lmZLb4rPR3612KSYE/US+u9
         S5ecWEnz6to5nhTdYDY9Pc2IyY893l8gpq/YD+S2V+9iEIlucmeLlqn7CVqmkkOIa+PR
         0BQgA/TzIylycy6SGTylgnl6ycCpq+o/w2isF7PTLCi4+3+mcXlTtgjqT+QGH5p8YqU8
         E9NYw9Edxse1VLHwjgwoIK4rKQPXWritz3EJUt38ofJWgi2qnff00BsZZbGoKLpeRhZj
         reX3RAytbgkKDvKfmjdo0waG/YDJKNQBbOMFqin6WvWzeSYO5WxEjneGcNVFkh5GT65i
         53Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047643; x=1783652443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=deICmiv9Ch/jTIv/OhIRyQpM4BjXGgxcInUpinxQbZM=;
        b=d2n9xV2AgGYRU1t41qlQCxdGZfTVpzxRWauAZRaEtfU5HTEAXgIebIxXYCF3NkEa59
         MKiiqpw2ArN4ARDPJfMjDJsOLCGaadN2wvtYWjDozl/Sv6ptAxFfahZEKp9T1UroOCBW
         eszuZRHPWkCQqnnQOILV/o+zskyEt1sCYjkwF9vBTKpPTY9bQIfGoLyq7/+RMkXOhVaJ
         5ptM26gqmw3VzJf9GthMk0237r79Jl3Eh9/QFrpR98omeW+Bbs0dmWgw6xO2yyhfaDLG
         VVPiCCCiqIoSZ9D8W8De81kLhM6793l4zp0OlZ3V8a9OaCFlwypZlwm48Ier5b9Ys8s5
         jXGw==
X-Gm-Message-State: AOJu0YzmIo+FcCntFvL4pRYC9Nyg3SfI3SRuoHnr8sos0CowndDvpR9V
	veaDCCWbL31iC94nr0RJJPvS3/8RlfY20mAiASwdxLyamiIVDESIzGyMeShX502PFg==
X-Gm-Gg: AfdE7ckAaojGd0tBPmsrsf5A3g2BIOIXb6Bj4vcyemuqdMmhFPftReoi7Emq3t2tth4
	y1QBrwnviZCBESKy9vjcTY1FX95DCzXzBJ9vpKoyLi345W+2ALiznMlJdbsqyCEBRK9MG4VEwfP
	12y1kdoov0k5mAveVa0Dhebte14ShlampCXRMSx0YE99Z1HGYjKCpIBzO+KwhRvf87wchkILDXF
	8M5LJ1Ml9M07t4LMM4tFzU286I8J7wM6GSmWoU/k6KnfGnOlMMlXYe77Xl0GMECeT5L4SflhXUE
	+ElW414A5JIJheKOHsNcv91ex+0unxvehzLrnB4Ec6SvnSKS5+HPxAIu4CkG6p9a/xNrhSsLXCR
	LI54E4cYfNH78Y1D9iGZkLI/nErao8bPJ4vIXlevwouF8/0TypYzG4ZoF8jrbJT5zhztT961KVo
	WB4tJvUWZ8MXuy1/iISx5HRnCS02UFT70ZHuA33VgMZDkfrd2v/p/nKkb+
X-Received: by 2002:a05:6000:4687:b0:475:36a:8caa with SMTP id ffacd0b85a97d-47759c263e3mr8943322f8f.46.1783047643464;
        Thu, 02 Jul 2026 20:00:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:41 -0700 (PDT)
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
Subject: [RFC PATCH v2 07/11] rust: usb: add usb::Device::reset_configuration()
Date: Fri,  3 Jul 2026 04:00:11 +0100
Message-ID: <20260703030020.2694-8-mike@fireburn.co.uk>
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
2.55.0

