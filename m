Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC570377A96
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946406; cv=none; b=KLBrAPpYmfrI3sXwfBCQbtGIMQI6LRlEdaJEPTA+9bFpDy6eAGLY1qJ4se8a2mvNfGc7thtSkK/mCKiy2lB9lXPg405Ltu7go48zgMC7K1z6txOmqTFNExUe3QfrEEcBIWuRKjvrHZFdTywOsqv97oR2x8xnX0oOrfisSveivyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946406; c=relaxed/simple;
	bh=21pyKGK+IKg/zTXev+HEz90+q9KFZmImFzV+iA62bcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0sbS2PQHUP01SliAYhIYISs1yW/yCXd/KkcpSygi8SWCCKZtwbAWtu/RuOi5P76+vDpW1Ktn1xTYcAH66HfWTQUuLNdbmLhoHAkVXdFRfEjdlVzKUPNefH0olMr2jKPHacs5ZZA985Kdlern7lCN5Q01DuAHu+M5ZYxJPGgCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=KUF0FXw9; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="KUF0FXw9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so716303eec.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 19:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946404; x=1792551204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oY2fKx8mXWxNmYV5ihzs1KI0duZG3Xnqm3LRIyGvrJU=;
        b=KUF0FXw92jXFptAE5i8/1mzTQvnyqKxTbcLrQYlwi4zXVdVyTcDdf9xsZcVzH6JsSu
         7Mpe63/xZ0RsYzLZMfjTZ0FmsuCIO5/mpEEGQgLRAhAYGVT6mRKWuqMY6nFLEVl5DvE4
         1N3pE69QFJtdIY2On4zA3sW4Jq5x0nqfJdnl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946404; x=1792551204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oY2fKx8mXWxNmYV5ihzs1KI0duZG3Xnqm3LRIyGvrJU=;
        b=OAQSr/HSWbJ55P/ASXEyM16cZi0stHXQ9u4O4zGnevMSamhtp9VxOAoWHbs+MkDOhI
         rPwkYfrQ4Uo5PtkvRPPaBDshNeirlbE9s63oGTTGbyRtIfZ9ZGPuMVXWJI45MnAx11zo
         bLCu5VL2NCCRihEtHeIYFuy7GIVMKrigfeN0bJm3PIXLkNpDUR9DtjMBx9DyP3pUxNcK
         HqSvzPC9eHyIcRI5Q8rQWE2il39iOKvC651uTgIs+vxxDgc0C6F61SLRLi1I0mlghUfh
         ucG3XwTzMG0fpI0ELJUHkb94hU1cU0GnErbukkQeDdYwcoIqd6CAunqblLl3NyvOGFiQ
         sQjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9g+FhffSZrlux3YE9LLHUq+tjJCpfIZiVWrzqSP/8duoOjU4CyW4Ba0n/S2Cb/qcNWE1q9Im2jmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeBEGWArllUOyrKanFugvBDYd2oWuLsAHKvuYvzML1+TCYdbMj
	8e8FRnTggiu+p9fjDXPfOezwVzI6SHnxyBg3L06EGQr5BrW9tFPJSglVkbHfitZvBwrt+fh3Ks+
	z13XRAig=
X-Gm-Gg: AYBFou2V4XLX4groP+TS4K8phbvCvYUyZMWJ/VkkqkgPcgo/yEdq6nvv+MyeK1O/lm1
	6lKoslt0csizC8c6LnOiW10m9XNwPyf+OAjvJASZpO5/M9bcOJNzNBjtTJjjovalIDv2smtXRW2
	WG++VcBh/1N6Ty8b/zAGnrDV7ssVUX/26koQGKfMPcmSd8219wksIJiV6S/Q8sKCIvKuML/f0eH
	4uWIqPSGfXHGbVcgdkAdgW9aL0PhCRjdvFa4Ir1U5YOhUc/lXotU2MX5DNWMl8fsoTJfSG1Nno0
	gXYS3mevi4+CkqIyHYffM0bNzUzZsojMdiCMAmPUBpotT4rtOMEzZT+haA+BaMrGX3eOKYBb7LT
	RuGj4Oor2y2HYoKFZ7o5T5uU73+8FsyrkS5BFrXH5Z7hJ4rLfFNAVw7+1Ye9lS5XEVooy3TfzDp
	2UUoJrnq6b2/pOeeAm+26q8GXHPrWmumls9V6gJgLmtY9l9zI6SK85H4SmKJ0lIJ0Lfi7vnoxTE
	ou4GFXorRTQl0OmUOWNXNg56Ac=
X-Received: by 2002:a05:7300:8256:b0:35b:782c:aa29 with SMTP id 5a478bee46e88-35b782caf17mr7301083eec.33.1791946403882;
        Tue, 13 Oct 2026 19:53:23 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm46522557eec.28.2026.10.13.19.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:53:23 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net 0/2] net: usb: pegasus: fix receive length handling
Date: Wed, 14 Oct 2026 10:53:05 +0800
Message-ID: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for read_bulk_callback(), both reachable by a USB device that
identifies itself as a Pegasus II adapter.

Patch 1 fixes an out-of-bounds write: on the 0x8513, every frame that
is dropped because of an oversized length field advances the receive
buffer by two bytes, until the host controller writes past the end of
the skb data area.

Patch 2 drops frames whose claimed length exceeds the data actually
received, instead of passing the uninitialized remainder of the receive
buffer up the stack.

Both bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested on a KASAN kernel with a device emulated by raw-gadget +
dummy_hcd:

- 3000 frames with pkt_len 0xfff, then 20 valid frames. Before: KASAN
  slab-out-of-bounds writes and a general protection fault in
  skb_release_data(). After: no KASAN reports, and all 20 valid frames
  are received.

- Five each of: 1536-byte transfers with pkt_len 1534, 1535 and 1536;
  101-byte transfers claiming 1500 and 97 bytes; normal frames.
  Before: all 30 received. After: the 15 that fit are received, and
  rx_bytes matches; the rest are dropped.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Wei Jie Law (2):
  net: usb: pegasus: do not advance rx_skb->data on dropped frames
  net: usb: pegasus: check rx pkt_len against the received length

 drivers/net/usb/pegasus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.43.0

