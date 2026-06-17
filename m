Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16A47DF92
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708456; cv=none; b=IR89bHpU8ZuAjg8Mk37SR0VVnlyEZgkyjoLShdtepP92lIcZjTTkxuoEHq6eTXicOQEkbfG25vc0m0yR4DxpSFUhGYTijFFajNomjUoyO9nZuK3+44veWpiodATs6U8ixF38O3RRy8fZGRPIJSOddbrnm1ghR+yMMr/vF5P7bYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708456; c=relaxed/simple;
	bh=qMZZk38qjpvNtR0Uhz2whLdQXCAGa/tLw954Ev+lV8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv/tQBR9rX6prymVbhwCLeBBYMsIfmrH6K7mn1mqb634pusPzn2PaLuXkE3ih+xiyJb8Lr4jFzJKMpUo96k5xcTdFTn8Pm3CbnoAppFqN21vZavJwZLzKflYdWX6o25FM5TJNfhUcVApGMmfADsHR8wrL4iRCvLJeBTQiPPSdvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=t+Pd2wEc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="t+Pd2wEc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so41170765e9.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708450; x=1782313250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBJL7lbxolFQpvxeBg6chjr1TSQl6/jrqgGzGn/4OiA=;
        b=t+Pd2wEc9gZlJAY8TWzARhQFaV3yudB8nJxR/MDuOVwGOjoPfE9RBIpoHVkjPkekT0
         pgJZfKrCBnQIvAnfwydNf9HHCUP7HhsS2BBvd78/uBpE3N3QZqPDFBSDgYQkSdw7uYiq
         aLCrGCbC7wzTnhD+ZnympTDnP3Kv7ERdCQeLHsVa+DsbE5VIRzZURqAeGpZKCiK/jbhX
         Vs1Z3afm4blkNJ2lwOXxG+PV1fntx1yvra+PdaaKHE//BD+XnmleySdzSEpvnLLhqmx3
         Hohb9/SPXYn5h1JEN+ZgCwFqtLzUK3BNujisyOVY9nbYe8J6b3N1BOmPJt3+UEzsqj49
         3H0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708450; x=1782313250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KBJL7lbxolFQpvxeBg6chjr1TSQl6/jrqgGzGn/4OiA=;
        b=VW4CjXWN6btGj7o5H1LH4o4TA3HzsHfyHG/cjIiZETJBHpwNFD9Lvy9ixjoO5DcseN
         KuigqWnnVVGUGYWtYeRMK90ZqnK6ZUReshHW59rO8eH1qzYw3WmIAmLInTwqTJsOIu4m
         8gaGJ9Ly/3aks2dH2eAfWr18e1DL3pcuTmuBtovYC14oGf+479NEOaNbcLA7KCPZKDzn
         9T0ssAq0nNGxE0myhlC3JGGutU5KXt/h/23u03VU2MpYLDOdTaWQpY3XBenpv4geERxU
         Wq4VeQ3wyHV2rbp6H+cjz6UCQQ91BJT4tYsDkMw2lvyKUzVmHHAHM9WPJXihYwKs4h/1
         hXFg==
X-Forwarded-Encrypted: i=1; AFNElJ/jZI8gAByjxr8Blh3e/xmf+xLmsLHHIjQYcIvadEE6XkjBwXwyHF14rukk4+4Fx4kSd23PaV9tvPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pUGaTwrXLHGBVP4RL5JxBb6pAcdl3/mrnT267cIYkEHQK+az
	yfxRiHWemeEzDRjepPNTlGJSBeV8qYP4q7GHmeQcAR/gh7tBJZbPQb1RTEYjZkeYbw==
X-Gm-Gg: Acq92OHCeyM7OJIGnGWaEnS3RTWpMqyJ9cRPmyv6aIokoXfQFJXKLT9Ud1zeZ7jaAAv
	ZD0TEXcQu16aJMtXtcoXAgi7+uq4tBDeooizpir1kUIqKN6Us/go9DmljM5q3nKUeVzSYgpD2XH
	TJPqOkpKjISIDGvBPjjfUL5ym6BnFLk/xD24s3HKvtUQZdmjcGDs4lybyzPU2WzValm7jhOt472
	d80Jod6BHXXWFB55ZB2n2LGrUc9/cFkNtxZHxyxtVp0l+Pj9noIgse5nc/Atom2hTry8CUBz2/1
	jIUFMCXaKwLkYqXGE6UtPZer+XwrRZmalzmDh2T85vcW0P9jAEsDN1E/ypgtsavKAC/8UI9mgFZ
	NVuXJGpn/zOo6ePMaytRk+a366J2ef827ouQoqPAxH3A1G6gpDo3KJhKKvqnaDAbi+STaJ4G4az
	ZCZl7xXre+XNxCXQoAkVIDjkDMtryPxEzgNmci1QWLRiQxUu++50dk8uDe
X-Received: by 2002:a05:600d:108:20b0:490:c2a3:23d3 with SMTP id 5b1f17b1804b1-492333e2af5mr62784095e9.35.1781708449670;
        Wed, 17 Jun 2026 08:00:49 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:49 -0700 (PDT)
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
Subject: [RFC PATCH 4/9] rust: usb: add usb::Interface::number()
Date: Wed, 17 Jun 2026 15:59:16 +0100
Message-ID: <20260617145946.1894-5-mike@fireburn.co.uk>
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
2.54.0

