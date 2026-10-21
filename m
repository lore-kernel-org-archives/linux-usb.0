Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548213;
	b=bXukMTF5RcsbxF0xN5d1IoCrb7YZ0v9uUUUsEeOz5EXBsQYafuFsD6yiWMbaD0BTA4CQ
	 c3nQhDBI3w04uo74ow5n72rl/XIRnLjFxSfEGcr727Kgf+VIg1Py0aXZdZFIkFA38ot4D
	 LlT4Y9WTeSHc4aYF3ihDCBzEz1MtnXmVWoOP5zIltl72SHKew2u7nN0PFL4ghrbsGrokG
	 8+9taabVChDvnWgLTw0TBvwbss4lg9WLC5U7UaGSfEnKWLf43jMRxe7Cu4lEkGw09wiwb
	 yBxQD8udyihP7xEuqsjz2VDWInKWlrpdMMjFI0FgdtStl2C6ZuVM8I3B/J4NSRja9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
	b=myeDIPJ+hUiE4NgKiO8c9sPRToIUaS24o24mFYX80x7qEh3pDDbZKeClk2voRsivMlIU
	 2Ie8UpH3U+oeG21gqXiERq5eg5rdz26hEJkBA3en7Npt2t0o/O5LbxuAdH1vcCPPrgTlX
	 CCNgBCkGJX4YY5Eur5qTUaRT8ETqXjQH2mSyDAc4qBf/rdV38kinH9Q6Qc3JHvRfFRQgH
	 ZBKTdNa4xA0xc5K5fL6iWrLTbNpzfb8Zwt8/xn3zPiUGDn3llYA03odY3/EeOd7FVRKIo
	 gQVbhAeYbSbR+WfEaU6IIHADJUn0nsEezry/MKNCgXnqClvtGBIvGQbJnKqXZ9TP9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b="dvtQ/eXp";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBB1606A321
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=dvtQ/eXp
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso51132a12.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 19:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548212; x=1793153012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
        b=dvtQ/eXpo32lHyhLwqFl9vjtijFuvUXD0k4fUg3eKQkb/ZJok/Q/UvT7A+AakZpMI0
         F7ZEcrOYnDvhq3mc3ceGamARn/4oUV5yceGrxn+6ZbBl7DMtD9wtO4DUoTBkjP1ckkyb
         zJN8ufTfKECSFZJlgpEZvcjT8N5BTdrujGhcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548212; x=1793153012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
        b=DyGfXciDYqwNWM9feMjvAeSB5gtROd+lg6H51hbVoRqDDxorT/2loj8ZjIxklvmoXK
         e9Qsj9h0Xly93fQl1q0pN3/OIPFxfjxuyR6gVblvkf/uZcfeD12LR2PY2a7ZET/r2Ofn
         KjU6zzBoch1sx9RTAY16V1QH5MFfkAtpuAAcBsku8tq4Aumunu/57L88pcKWEeC3oCAl
         0d0cdg7JhQ2oTZMWc4ZffFRlnEVm9Yw7aZPY+YU4W9FOMf9IeLkn4fLN7vMi434SSC4T
         7OWovjWgXgP4SI+G1iHc+xY6uqsA1Uw7GNdhM3SmWkiGe4ybSM6d/F4/ftCuNaLBA/rK
         8etQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbBLOM9nf0aMGmgwfqLY9sXAxAyhUYx+2/6W741F9QwSRW9FH32nI/CFupozszFMc5eHqff5lfR7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5TyQ5xTxu0Fhml9oNHSmOqzARgUCRNsvhPK1bTUOQ31QWx2yy
	IS65zHEzTMWMJU0u2w6ZHF2Wy7GpIwKE3ee0scxVCqJAEu5NLxgEcwME0qu9/O3VDIg=
X-Gm-Gg: AYBFou1SX/1ks+O82PxDXJsTrGnqBHs+Y2ViHxP0evDnhDeSU5NiANkzklbUM7w6xD6
	IhOBNHpGDB1ss9CJBzCgVrYJEWNGSWvJV8ErZxdkEI53qVT5OQ4iOFGhaktVdz6jGOdxjN1TchJ
	MpYycsijZyunGrLQtWBAXhUUCnaq4KWvOIveNph15Ga4QK8mRSlcEyzupdOy0HqY2CI+TkGyRgY
	kPFZ8Gy3jGru75veVcIebPD/rnCZbn5PmaWZykk7o1i0F2Lh9Qn3YdPzvvuxhugTWQMa4JlwRh2
	LCQeohkGhHRmlTfW/p7hOrFL9YWYAHV9YnrRw72a968AmMq5n7NayX0GwEADGG8AdZxFTD68KTc
	S7nxwhgiHVmtO+gsnLQflr9fVXryNDKIkkwvYxH5AuMCYf1pXiSe+BBj+qelAOu9x4LpDWqEx8y
	7bthNjU3rKnqSkGTJv/DUHgUEEI+fL9zMyu13AQ60vQqBJa2u4QVoItUlmZ+HXAabBI/8A+xlsM
	Hm75c4wQYB3h6Z2u0k3xlI8FhNYo/wPjqyQDJSJ5iezuZ4kkN8/crJOc4weqNbboWYS7p4HwpkM
	jqE9CBOgcA==
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr533892a91.57.1792548211109;
        Tue, 20 Oct 2026 19:03:31 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:30 -0700 (PDT)
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
Subject: [PATCH net v2 0/2] net: usb: pegasus: fix receive length handling
Date: Wed, 21 Oct 2026 10:03:08 +0800
Message-ID: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for read_bulk_callback(), both reachable by a USB device that
identifies itself as a Pegasus II adapter.

Patch 1 fixes an out-of-bounds write: on the 0x8513, every frame that
is dropped because of an oversized length field advances the receive
buffer by two bytes, until the host controller writes past the end of
the skb data area.

Patch 2 drops frames whose claimed length exceeds the data actually
received, or is shorter than an Ethernet header, instead of passing
stale or uninitialized buffer contents up the stack.

Both bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested on a KASAN kernel with a device emulated by raw-gadget +
dummy_hcd:

The first two tests ran against v1; v2 only adds the lower bound in
patch 2, which does not affect those frames. The third ran against v2.

- 3000 frames with pkt_len 0xfff, then 20 valid frames. Before: KASAN
  slab-out-of-bounds writes and a general protection fault in
  skb_release_data(). After: no KASAN reports, and all 20 valid frames
  are received.

- Five each of: 1536-byte transfers with pkt_len 1534, 1535 and 1536;
  101-byte transfers claiming 1500 and 97 bytes; normal frames.
  Before: all 30 received. After: the 15 that fit are received, and
  rx_bytes matches; the rest are dropped.

- Frames claiming 0, 4 and 13 bytes (three each) with five normal frames.
  Before: all 14 are received, including the runts. After: five are
  received and nine are counted in rx_length_errors.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v2 (review by Sashiko):
- 2/2: also drop frames shorter than ETH_HLEN and count them as length
  errors, because eth_type_trans() reads h_dest and h_proto without
  checking skb->len.
v1: https://lore.kernel.org/all/20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg/



Wei Jie Law (2):
  net: usb: pegasus: do not advance rx_skb->data on dropped frames
  net: usb: pegasus: check rx pkt_len against the received length

 drivers/net/usb/pegasus.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)


base-commit: 746d0e7e851edefce9656ce744d4ec5e94de6b5f
-- 
2.43.0

