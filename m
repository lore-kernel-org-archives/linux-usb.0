Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9A35675E
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304265; cv=none; b=hy8BuEAh6OYpg3kikZ+9eVc6nyRBRyGfDDGmMuYeb6mAjwn7WFL9z26fpkAkJkrkewImf/y4GaP1vpBuue5JDv5j++3aCfi4YgjfeW/3LcHd4LME+DOZETFlz4B/8fa9qvs+/OMy5AVwJB9dhro5dc1B/AsXd85uGQqWcz6j1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304265; c=relaxed/simple;
	bh=gq6gPWjlXWTpgggTh6qVeJbK3k0jEZ8oMXcfLm9kaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXbW0GkoUqChcq2hgdp8N5CTpTrKJyIIGvyn8pOOYAR5fP6PkoR1dpIzt27yeCEBosuFJM1BfGM3oEH9LnO+b18CKOM2OrFMhNifCGw/amM/mUX5eXop7oZH4+bBQfRqZLQxRiUWMPkSmRExYdTfWB0Ws+IKdNtXnW8I79vk3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=cKKRTsEq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="cKKRTsEq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so618963a91.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304263; x=1792909063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EaD3mjRasIGte4hZqwmjWl11AAvJaiM9yV5LHuDVgM=;
        b=cKKRTsEquZfffDlvCgPEg0fI/Oi2qvO96KYrcmenTBWoPIwJFbvIg1MuQQW9DRu70n
         jWfOJTCXvSR96YJEfDDCpYOvhppfsvR+0bLrEPjfZr07EmOA4USAvoKOkSOXlslcxWg3
         xapLYW8YEOBprVMyo+sZDichcQFa+gKUV0eBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304263; x=1792909063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EaD3mjRasIGte4hZqwmjWl11AAvJaiM9yV5LHuDVgM=;
        b=WTNBzmZXsrK9sFJ7nvDKpDEu3k9mNLz2sVD+jZDW2cFFMOBiGwjtIELTyvYzvXDnaM
         w6fv26LLb42KPMbib3V/3/7aITqCt4JqmsjhGjKbcJriApAwztvL74oXxuiTwxO6FGGr
         /1AeqGYKg/jBpACLmATNPGM/mBXBeoh/yJrdFj2TLqW05TNbMt1I8ZTW5EKiPERCxSyR
         qOIdl0384aJMTYoku7J1cYt4fpHYPRE7M16Y54jYX0dGtVDBFFU5Si4hRXtzisUjmXO4
         OZHEY0EMyGXbeW9efGLSMGGpsCS5mMnONvEgsi6WIc9w4BTilt/aX0YN/2osyQOyzvkL
         qEsA==
X-Forwarded-Encrypted: i=1; AKwUvBxA86GG6Z/yGYw53tm5InqKMM8HQfvtW27nmrPPpPekiEYN3o0+YWUXrPDYbsFyZQmOWCg7a8VDsps=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUszW+HdVoIy1Ikc5VdiGntyfThdfciEntBE/uRC0EHASlzuiB
	nqyEwKtATrjaCvRh/ogPugia40APl5Y0DpK29V0fD9EwivYBXERFjA74FFz5A2rQPcw=
X-Gm-Gg: AYBFou2l679kjzm9M+Kgpi8A1Fy+AeA7IQJ6k4zOul91GsxAlOlcXBp4b2SK583Fq3R
	7xtZ+jxoOxRgR9u5HufSX9/1XsMpGSyIt+gPWjiAuAUGxjMcvpEFriQqf7OW75MFE/Vi2p4nF6e
	zORwYxakxEo+EJfW0HemwxiWBU5XakTTOodK6bpdOHLNr4Pb2IyAI+Hp/ek2hUpK3usyc4lxDvs
	uJMMZ/gFCq1aBhDlTsLtPg85lozm8UNS0emRKAaerzydpUzyUxyq3MpUSGFnkNlfkc/fPT86Axj
	Jc21fLw9nyxr5H/FYDFzGAWvSo7iZfB6Ef6ugEsTdrJDChpdRPZmt6sUNkdVn1TZLg7/65IYUtj
	A38gwPt9Sl5mdA9s3IJxeTxKuABPD2MUJm3nDwRK8rTtzeo6Kr5jTJ7g7ZJVzz4KFJUir9T4/xK
	+vDBd8D7LH0gs5ED9JKDmjrEKMEfTNBz5eAm/+59/2EG/NmVgnbL4HM6l2rOr53juRs6PJb7RP8
	KwQY4XHTm5So2Nxd1P2xAFJxOhM8A3d/v3wosKtYtFggwZn3dD9BeU=
X-Received: by 2002:a17:90b:50:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3aced867f5fmr3988514a91.0.1792304263243;
        Sat, 17 Oct 2026 23:17:43 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm11025963a91.3.2026.10.17.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:17:42 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v2 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Sun, 18 Oct 2026 14:17:32 +0800
Message-ID: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents used as the MAC address of the interface, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers.

Patch 2 makes both helpers fail on short reads. Patch 1 comes first so
that a failing statistics read does not report uninitialized stack data
instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- 100 byte statistics replies. Before: 110 of the 235 counters are
  non-zero. With patch 1 only: 29 are, so the stale tail of the buffer
  still gets through. With both patches: the read fails with -EIO and
  all counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe, is programmed into the MAC filter and is
  used as the address of the interface. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v2 (review by Sashiko):
- 2/2: the commit message now says that with patch 1 only a partial
  statistics reply (1 to 187 bytes) still leaks, and that patch 2 depends on
  patch 1; the MAC address paragraph no longer claims a write-back to
  RX_ADDRL/RX_ADDRH, which happens only for an invalid address. The cover
  letter gains a partial-reply test. No code change.

Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics reads

 drivers/net/usb/lan78xx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.43.0

