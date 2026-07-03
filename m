Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CD272801
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047642; cv=none; b=gtaeFWdZEyt7C2IwJThE0nfGMUkb/CdvN5zBhgGjtk9yKaB97alHPWxhKKShpKO9Ad7PV95XCdhwT48t/z+mIm9gVUhvvssnTcaHlyqRzPfwBonKQMyR7K317HlxB3qnpO6pYvp3W5c/9fgtyHA8apJQ87vJiAD4Byu9NiP8vt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047642; c=relaxed/simple;
	bh=YcMrtCPBehMskMth8A+KALp71as8gO2BryWNL/Me5vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQVFPlYTpv6aUnHes7DMLjMPOrAUYNT60euxeZHiqVXMmqrRIPN6rG6ctB9yYWBRsFXyLGADIgdexM0zVHO9XvjtMEQbhxohmqgui0hBAlukH8ErJB/wHCOB0CQFngk7uy0E5WZeI03lUZW7YkWrN4LUwT6hb1fQAnB4B/1k7P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=RXmNUPd6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="RXmNUPd6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-461edb387ddso93897f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 20:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047637; x=1783652437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfulRQ67b4sKix536dVwI9SyCCFZIN8ANRqkC/OFpvs=;
        b=RXmNUPd6RTU8f6DFGLUHpkPOlK+/Jjmy1kUjoyUItecZO5ekzOpEQESH1KUUhslZSd
         ZMjoAyJotaMpkqUyfl3c2PZGHxmV14As3mfAaiuXqraQyxJVwxNfdKYNX9ELIBBTXuHP
         3wsidmE6/0NbP3HH8oIBYA6ux3bAY4LTZDazGJ+aGPYSbP6x8zC/+Ya/ziLhPHDP7h+4
         lcE5uI+9PS4dIrDm7xYjk4bMIrVAWl/4WJjNVaJjnhqj78FOZnHnexvKj72+i9t1I0O5
         BZMDVxnTbjUKNgchHnmEqqWoy9oTG2wS7aJwocy0pDI5VU2SxqwSHWUUPYuWIllhuev3
         X6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047637; x=1783652437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfulRQ67b4sKix536dVwI9SyCCFZIN8ANRqkC/OFpvs=;
        b=FHv/L6j1snTgEZlf+qnmJj968UPMZYWG7bSBylrSP20Qbi+0IRYib8ss6pHw70yfZZ
         yGsI8QkqUZ0gKPXVH30YYyUu8q2fsJk8cky6mLk2bj8S1s1Gf9LyihULq2vOWCYdBWU6
         nEn8D/9Cc8p76lyfVKEXxJZK8wmsW39dikFqOC0uugebPLmoyKYdbVZD3gCEwnnbE7JR
         /qjPjDLpOsUovaY3uZeqpmozkGza+Rf82M/U94Hn5tf6flWPreSGfWCynMwUOOpKX2IM
         JAhc+dvpuqVxBEIgDpU+AXGbZNrqS/6cQJx4y1eQ+vkfAANARmk/S+CuXmPrz+yV0EaX
         EFig==
X-Gm-Message-State: AOJu0YxctIzrr9BP5jIZUCZ7hUScv7UeaOSxqY7Kp3NPf0do7+ewo3YR
	3ED2fKigsXnWLfACYNEUosX7jRCgi/cW2YIqlPh0j1xiF5YEvxBWVfb28HozJ/rD/Q==
X-Gm-Gg: AfdE7clPk+4EThwy02sBCPY9qlczY9wzcVlCiA2+CNvgIp8SBY2tl4HLRuIaFil20w8
	c/uzeAYmlxLhzm8FyJLsLlZBDpqufmq3ASoLeKMrrzlO4KA3BEa9Zo0+bJ462vsbyWstaqy0Qxc
	o5c+RYIVk7y1PwhcG9pu90mAe4hIr0GnBhIodXtrfH596kZ4TmG8W5k57E8CpRkrdXtRXym0b6V
	DfSAqw4zx6B2yAj97PSch0vUKqf3zxDgoEkbE0yRNsCCD5CNE6H3ZTHYGB4woMj3w5sb/GIQLy2
	1kv26ZGmh/aql+6iMW5WUwemD9P84VHCas94eFG6Fc7dM2+kAwfr26tmsjO7wJIIid2fcT0bNt4
	WsiESvGYfOMHRORg7nl5Phl1QjhxTRFSrr4lwzSOtHhLKm4AQKcyrBptDlnuye6S4FeiuS+HXxz
	LGfoeL4CHre5Ww6+HLDYivrepdj1JELui/DHGLJuVDh1u813kL6f5aS958
X-Received: by 2002:a05:6000:70d:b0:476:d52b:b85 with SMTP id ffacd0b85a97d-477af217c63mr11901030f8f.16.1783047637615;
        Thu, 02 Jul 2026 20:00:37 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:35 -0700 (PDT)
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
Subject: [RFC PATCH v2 04/11] rust: usb: add usb::Interface::number()
Date: Fri,  3 Jul 2026 04:00:08 +0100
Message-ID: <20260703030020.2694-5-mike@fireburn.co.uk>
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

Add a safe accessor returning an interface's bInterfaceNumber (from its
current alternate setting). A USB function driver's probe() is called once
per matching interface; a multi-interface device therefore needs to know
which interface it was handed so it can drive its protocol on the right one
and stay idle on the others. This exposes that number to Rust drivers.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 73637e3467f1..683e8b52d6d1 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -357,6 +357,17 @@ impl<Ctx: device::DeviceContext> Interface<Ctx> {
     fn as_raw(&self) -> *mut bindings::usb_interface {
         self.0.get()
     }
+
+    /// Returns the interface number (`bInterfaceNumber`) of this interface's
+    /// current alternate setting.
+    pub fn number(&self) -> u8 {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` pointer by the
+        // type invariant, and a bound interface always has a `cur_altsetting`.
+        unsafe {
+            let altsetting = (*self.as_raw()).cur_altsetting;
+            (*altsetting).desc.bInterfaceNumber
+        }
+    }
 }
 
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
-- 
2.55.0

