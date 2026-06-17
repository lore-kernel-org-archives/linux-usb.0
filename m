Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798EE392C2F
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708455; cv=none; b=shYOf0wQD3wP4qJZ3qSvX/psF0EpS5G+rvm9iq6vWL4a1xedB0F2mMT+fXEhgd9xdT5mhRnMkyxaoxBxO9xemW4jeMw2zQd3OPhI82LYUK6vQz4kXulila6nvv2wjXrMHyfKgIIFfRqECK2tkMbSJr5ohOyIL91t6PNNu1oGz/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708455; c=relaxed/simple;
	bh=sdp2t6vfqEppC/dVPMLIuJInICylhXtRkr9AwFlbGFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPoKWczoO3EyV6fYF0/7kPDDOXqI1s+VqqEhyrKXfNzX43fSjV4PllEx2EVRi+drxXIDoy4+O2uQVnoMCrDIw2y8pKVCdbb7HGT+HhwQqIi+KlRBSp8Uw9R+KPDyJw3yVfwOBx14i2r1hcHjuXkSsL4NU7GIepyIB3WOTV/D88k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LShXWH1r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LShXWH1r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-492329c5514so5133225e9.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708449; x=1782313249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+sHLws/3qJi46z31ZQSkIz66AhJ7UkYvYrNInNWLLA=;
        b=LShXWH1r79gml+u8JtYvzpMd6dn5phptv3uvX34ToEkFfThiGdh1sILnYhE3xiHCks
         Us2regbHUfWxBsh6kxbggcV7JYBRgMoBM9oY41ThEiv8ErDwzydAemcxQySrMm19FYrE
         0pof7IOkqfWQbAOPCe3kfsd/1nIkCuVQACNB/mDdNVWJkV+JJP3VPA3wxAaeiYV6lCnZ
         y6VUPDbtFmI1flhVPFr49KWkhtxiMrPB3PRg9y4DoE99fhFUroYh0ZdAdHcYccQAhP89
         zh3H2sI2kJVbMyaDW6JcdoflUPIOwGt1EC2E4+NPwmPvyNHE1YbSrMRzoTPehqhP+QnB
         i74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708449; x=1782313249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+sHLws/3qJi46z31ZQSkIz66AhJ7UkYvYrNInNWLLA=;
        b=pIKVmfB9PeV0a5r7TboccXQ51MpnYa2B1Vuozfgk/iiwKiIrQ6yIkTleUFQzHSXPct
         wvC5RNypznZEvYG/ZTHHtV9o+NtnhQrqW5r1PwfKcXxpdSr8OLqjhlul+SqmpYo3DbM5
         kZvxwsEsXgK7pthBPuHJNTG295glpq8OJlJCiWHrDySeqpBki1+TiC0Q9Fy1rxs6IDUJ
         KrlYFOHL6WlOzAWzy+ERa0866Fy6X9W4HfFCiHfuwM/Cjg8HvDpb6FwlHpShz7rf9Hjq
         ewOXHZASk/UDBEwHr7v/YJv6fDPMp4ZE6XtYoRxTcHBP7gZgZFxtpXY+UvDi8zn25IVt
         sZhw==
X-Forwarded-Encrypted: i=1; AFNElJ95tH7mGTDFaH8vuTrvZHIdAj58lw7IPiJLCT83//aWMdos75tkzBuPYIpvC2RdpjlH9jU5kHiWwGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0OKIjJGz38fNT/sE0CTbYV3cakSIgj5pymZ97WOoU7InKkQLz
	3OUgsXuZNYeQKZrBjvMyM/Kn1D8r5N9ZNSxMGJ0QITw0C/Ua9xG+uH2Ia2kG5cEaxg==
X-Gm-Gg: Acq92OGEc7P6VtxadI/lsdHCq3w2Zxnuj16VPESNkO45nZdKtGZVB6Qn8n2G/yCS406
	+e708g6eJ0DqiZl4tzMAdN4kylUd6lSNqCtAK1fVutcvpdvCrsOsz6jddAKF0wEUtFDhqaxEGnM
	5dBxmpf/BFDfq3zLed6UvlzUoQruH+/DdkjEZtlFo8o0GzSKGJdS26M/moR69c+lgDm9g5+9Lnw
	XHmHBiutFxvVCT8Iu2Q5smMnTvfymRL5EBSQjiNEgM23pK5pFbgwhC63fesNmBK2+FycfkDKh9i
	Cb2Ub9xUiw4s/RuiS2lO2+8olSTUPaoTiYUTEddOXFHqOn8SoqewYrdtx1OT/3aUlsa6mhtFvGn
	XtG8zIZJpTeZsNHk4k01BhIFeuuYtJMOSBioWsxVGvgZYHoPFhzwy4fQVGrjcAaYSyj//08GnPG
	jW9eXJHZtbtTn48DW6Nzj2jlsiJ33vFGk+66ZMHDyM6lmSWed2aLhqzBfE
X-Received: by 2002:a05:600c:1e0f:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-492340bc974mr52545715e9.2.1781708448384;
        Wed, 17 Jun 2026 08:00:48 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:47 -0700 (PDT)
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
Subject: [RFC PATCH 3/9] rust: usb: add usb::Device::set_interface()
Date: Wed, 17 Jun 2026 15:59:15 +0100
Message-ID: <20260617145946.1894-4-mike@fireburn.co.uk>
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

Add a safe wrapper over `usb_set_interface()` (the standard SET_INTERFACE
request) so a Rust driver can select an interface's alternate setting
during bring-up. It blocks and sleeps, so it must be called from process
context only.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index e1fb50fd6997..73637e3467f1 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -605,6 +605,19 @@ pub fn control_recv(
             )
         })
     }
+
+    /// Selects alternate setting `alternate` of interface `interface`.
+    ///
+    /// Wraps [`usb_set_interface()`] (the standard `SET_INTERFACE` request). This is
+    /// a blocking, sleeping call and must only be invoked from process context.
+    ///
+    /// [`usb_set_interface()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_set_interface
+    pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        to_result(unsafe {
+            bindings::usb_set_interface(self.as_raw(), interface.into(), alternate.into())
+        })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

