Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5447DF9D
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708460; cv=none; b=L8GyE5IvuF9pi27Qu1eICSGTOnCkx5EBvOMUbYoyKO+GNkO2veFIMTkjHDjPNaWcVfBDwtcQsioWG4aAh4BRus7vcqH3mKHDYMH02MhCciWuXzWM6B/ow3CXQnNNtOUpbvcOWV6mo9cv0sg8bb21PVAk/uZca/QVwmOc8oemqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708460; c=relaxed/simple;
	bh=Vjmn5zlVy3ENmtOOKrqNlnZSpEZa4C9kI2uXKZhxzvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUo4G9lpuA6+/JqbZIPz38geAUd5MdzxMkshYmInHmB+iLeO48ClzwTgPbCAFrX4r69sdlqZ0luYarQhRZnzubEaR1PVM0r7tYrTD/VCU+JxmB3BbMdt9w6RKkhtyKhIKFBf9lwQ1HZGLZxMJSi1oW08YVsEdNYUavrUGi4w36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LVfFXZnh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LVfFXZnh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso8979095e9.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708452; x=1782313252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLsPxcuAzIdyY6rqQxjux8ncAYLryPIVQK2x1HXprbQ=;
        b=LVfFXZnhD6XmuHGp7Bubg44OlESFDeiY7ZO5icLclyu7pvqh1xBh2NBMcFPY6AwsDu
         xLJp3If/6NWLXZ53uUNDZtWW1RBsNeWPZeKH4nXJ6iGh896PknSJ5ctT7SvaKIi08NoE
         /gX+G7cLLUu8v7C2/KuQ6xYAmz9EwTENkIUL0XUpMI3wM8X769lgyZfr6/OXZcsj9GQ1
         PDg0YbHpwvXIyG0v9+f7uoK/+shWQaJVTAjqetWtiWIbE87sf1jd7YcT3m84dJUl8hiw
         jQh7QyoiqvfbjshWaKFGm6BVk8pEayTJeyJ14IW/dovbkJFT6JTEdaV1Y8/Df4s/Vu43
         ZqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708452; x=1782313252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLsPxcuAzIdyY6rqQxjux8ncAYLryPIVQK2x1HXprbQ=;
        b=Izmqb50V5qADI0j+2tBDnkXHm9OkG1ETZ8a512Zw84HADNofCm+Rxy2kfXxBurgmj2
         cXf2HEAHKDGz0Y5b8NFoYN5wu5zKb9KrYNECn/CL2ypOuGt7tjswyjXMKUUL2b+hhmX8
         8mrHQFvl2DH0ufvQvmPyZJU3uprSUKmlUBZSH8t8QTlIqo8Ou5jYv/gNdYEXgECnebCF
         ko7JaiCf7JnqbyMboz9QPL7xzKX/bdjpf179iNRD9K7EChNiI/E6V7uVuabjzu4ithaU
         u5AvLQMlQTtfc9485TKB18je8GDtQzTtccsyyUdEGduyMjQ0tUkwKQWtZbyO515myTZf
         OzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ98sYqc4a4SvRwBOEQiB1kcUY5fUIRtTO5RINdqxg4VvQNaBbTSBcr/bXIN85ekqa6rLjw//FK9fqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgJxfNkRxXXWvG+xER8fY6PCTIW7t+sOg+muE+HxRuB++Fs+Q
	cKJZaAtlyRSy24EXYN9UURUgjFySCxg0MbkPj6ZaHsDt7+MdKxDiJHwk5WX6KFvXxg==
X-Gm-Gg: Acq92OF7GfkuT94agnEHIqD4q1RSzZJj/GvRu/AtknZ14S6eFquypbbRF63KZuwM2WJ
	1vFBQHnRD1/3wQGK80AgJDjrlR8wc6yRxWqEiOymh3YOP2tgJR2+cDTa3KKq4WYYyRoslQyUvW7
	hmlm4R/bShNMAoLlV+ArLRJIqjqWRA0u2P/hrEDPTPsRo37x4Kn30tSff1wZsZ5yR6DluIy9Z7O
	FjzZaQ4ULYVT+1SvBcaoGz7OfZDP8//ozPEdfFbu5EkRNillSNWDg3w9q4Bu3Au/Bb4dnxCRpla
	95YgVupA1OW2+XiDw6IzV8kw6f3IeW5h5/d5dynk0eZXUY2pbQKHbM8Pq3BLVF5mdwF1QjPnrqm
	MWhJuGO2gLLPdc5Ppsju+3hfpaY2opi4fFT45fCZ+nKOSHXmZalmdCfgnUBZ8ik2Zqxo0t0vjx/
	a5ROIGOOKrPC1RIxRMeKMfyDhzKzNSLLP4ZySkkilBKwslARprKeFsKyAWBk6nntMPuEA=
X-Received: by 2002:a05:600c:34c9:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-492340bc986mr53143255e9.4.1781708450969;
        Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
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
Subject: [RFC PATCH 5/9] rust: usb: add usb::Device::clear_halt()
Date: Wed, 17 Jun 2026 15:59:17 +0100
Message-ID: <20260617145946.1894-6-mike@fireburn.co.uk>
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

Add a safe wrapper over usb_clear_halt() so a Rust driver can recover
a bulk endpoint left in a halt/stall condition (for example a streaming
endpoint that a previous driver left stalled). It clears both the
device-side stall (CLEAR_FEATURE ENDPOINT_HALT) and the host-side data
toggle, and it sleeps, so it must be called from process context.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 683e8b52d6d1..a151a120e82e 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -448,6 +448,30 @@ fn as_raw(&self) -> *mut bindings::usb_device {
         self.0.get()
     }
 
+    /// Clears a halt/stall on bulk `endpoint`, resetting both the device-side stall
+    /// (CLEAR_FEATURE ENDPOINT_HALT) and the host-side data toggle via
+    /// `usb_clear_halt()`. The transfer direction is taken from bit 7 of the endpoint
+    /// address (`USB_DIR_IN`), so this works for both bulk IN and bulk OUT endpoints.
+    /// Must be called from process context (it sleeps). Needed e.g. when another
+    /// driver left a streaming endpoint stalled.
+    pub fn clear_halt(&self, endpoint: u8) -> Result {
+        // `usb_clear_halt()` must be given a pipe whose direction matches the endpoint:
+        // it issues CLEAR_FEATURE to that endpoint address and resets the matching data
+        // toggle. Build an IN or OUT pipe from the `USB_DIR_IN` bit of the address;
+        // using `usb_sndbulkpipe()` unconditionally would force OUT and silently fail
+        // to clear a stalled IN endpoint.
+        let pipe = if endpoint & (bindings::USB_DIR_IN as u8) != 0 {
+            // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+            unsafe { bindings::usb_rcvbulkpipe(self.as_raw(), endpoint.into()) }
+        } else {
+            // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+            unsafe { bindings::usb_sndbulkpipe(self.as_raw(), endpoint.into()) }
+        };
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `usb_clear_halt()`
+        // only issues a control request and updates host-side endpoint state.
+        to_result(unsafe { bindings::usb_clear_halt(self.as_raw(), pipe as kernel::ffi::c_int) })
+    }
+
     /// Issues a synchronous bulk OUT transfer of `data` to bulk endpoint
     /// `endpoint` and returns the number of bytes actually transferred.
     ///
-- 
2.54.0

