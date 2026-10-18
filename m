Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E28A3F58DC
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304681; cv=none; b=oMO7VrW4IEAbMBE9TWktW5LHE94jQKU7wqCNBu5IgjivV78uKWS+KudnzeNhwdZY+IbBsN9Ot1Gs7G7GJ7Eg5V8HUnBneuPheX0aa6Demb7sV0iB9wL0s/UAF4fv+SlFmZxtKmZeETe0nW3aw3QZ/hBpUf2z8RfYvJ14EcBU9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304681; c=relaxed/simple;
	bh=arE8oVz2fH+8eS0750nhWq32DGLzP4mMXrxh1y3HsCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMcWOmlNtOhNGHq6/hJFn8AA33jZQy04GYWVShm/bHxoz09x2r70Mflb2McH8+ws3q18PCiBQ4N2cIeSDvoEVDrojGALbWUjDjGJrBTj+P1oTrzo6jmdy01Ka+q75H0NS0I7aWGusrYpdyVmLC7wJFToK5ai6S8/66J/wzfRLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=i/9nro3N; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="i/9nro3N"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1111106a91.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304679; x=1792909479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkEX/9YVHLMJf2nTtXDatYuMtWB76zz4RytnLFluowQ=;
        b=i/9nro3NqFe4vwmeeZspibxo8gBiEki7C1ppw+sEsNM4e0TjH/GilyD1hP73OyL78H
         6clkqv5/4+xW+ro1DUkmQjmWNboOrt1d2/6zOpnVQbUO8nw+5g6UcyMp7ZmDoIgf/FPm
         4ehNmOWrmvYfzxIv9th5bMtpx+mtpwktH0Bmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304679; x=1792909479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DkEX/9YVHLMJf2nTtXDatYuMtWB76zz4RytnLFluowQ=;
        b=rhrMJNQ5h8gpsdoe4FRclGYb1bbVvsA5v9mT8ozLoEPbovzB96YBFfQo6UMUhtJgrW
         Ez7Qdu2hJv9fd6kDMLh9SxjGxNCO/0j4V7Uu4BvS1SXzwv8Bzr+SLQRlMGYgY8Mfhn4h
         zBKY9AG0N5mqVyDqmbyEAHT6VzHZBbgu//EgzyQrafYVvUxSTxHnntmec1zB7vT8ISAq
         S/vUCOSDaWqIGQlFKAZyiigbht2hvXaJ4bvmXzc0HIR7ffMOEZLBl+AK0HgRfoECa41o
         f+l81ym/KtsDDixDPgvx0G3v5HU448rjMDL6jUFchvxGi8C+Wo3SdDeX86dj0mseYLbc
         FnQw==
X-Forwarded-Encrypted: i=1; AKwUvByUqmqrbsHFcEh2PVCE5n2gSmwLPIgXJ3xILrkgXYgQdE/LLwXNQiKvBeDiVnJ4MkpnSFvmE61orl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnYL9Tkt7T2GSmCpx0keEH+GZhThL6339qfIcxNk3RR10iCZ+w
	bPPEsWNSv5Z9W2DwO0mJc0HFKJnxnRx5y4LEApacJ8c+BIc3lHIwx7533UdJC3Zw7F8=
X-Gm-Gg: AYBFou2sjqFwktIsQhz5xIhPTmCw4fx7XPB/5NSrFkcyeGytC1bcQQ9IjTsNM0bCkLA
	qz0zaZcs/UXTApQQvucMe+P2DtW/NDUb1g+UtFv0NKsYRPUd2Mb9+jvbPJYNoQQXfGZS7eBgjH/
	G2obT+9KkZzK8RjhMlF9sDrH9s+tezyWmSKwylpWhPvlvM+vHOK7zavo2LDReNijeRX6n1Dr2cr
	4SjSuBWD73hFppELY4LlrChdhIkhjxSv1zIM3ueE0LoFM9iOZF99AFpLjxDcK24ta3nM7FY3vyq
	NTMtowkVvYtY7CbHpA5hrrqDpcy7KkcYXUXmtnpsjcI+8p+hEOeoNBR3m5ezv1va6qv6rmtK98L
	AOWmKC5slnjHJOHbLdNO0R5vnPiOyUNIQZbdZQCaIjO1IUnaiLwA85DNyEyjDe71FUDhEK3Y3Qo
	Fp/tdm40TdNiMM0H45Obl8VxUeK3MaFitB2PjoRD0cEhywvsleipIllMfrOLbyH4kDlorGPEFqH
	vweXpSR559du0/Q+8R8v1X6H3hcqaMRLNO/+BlndkPInTyG+5grN14=
X-Received: by 2002:a17:90b:2e45:b0:3a6:dc51:cce9 with SMTP id 98e67ed59e1d1-3acef10a75fmr3867761a91.57.1792304679503;
        Sat, 17 Oct 2026 23:24:39 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm10513293a91.4.2026.10.17.23.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:24:38 -0700 (PDT)
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
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Sun, 18 Oct 2026 14:24:19 +0800
Message-ID: <20261018062419.21921-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

With an emulated device on a kernel booted with init_on_alloc=0:

- A reply to the statistics request that is shorter than the 188 byte
  counter block leaves the rest of the kmalloc-192 buffer stale, and
  ethtool -S, which needs no privileges, reports it. Before the
  previous patch, a zero-length reply was enough: one counter pair read
  back as 0xffffffff8a427800, the address of
  usb_api_blocking_completion(), next to several direct map pointers.
  With the previous patch a zero-length reply is already harmless, but
  a reply of 1 to 187 bytes still gets through.

- A zero-length reply to the RX_ADDRL/RX_ADDRH reads in
  lan78xx_init_mac_address() turns uninitialized heap memory into the
  MAC address (12:85:1f:dc:2e:bd and e6:93:44:41:9b:9f on two probes).
  Both of those are valid unicast addresses, so they are used as they
  are: written to MAF_LO(0)/MAF_HI(0) and set as the address of the
  net device, where anyone can read it.

Treat a short transfer as -EIO in both helpers. With this change the
same device fails to probe with -EIO, and a short statistics reply
fails with -EIO and, with the previous patch, leaves the counters
unchanged.

This patch needs the previous one. Without it, a failed statistics read
would make lan78xx_update_stats() compute the counters from its
uninitialized on-stack buffer, so the leak would move from the heap to
the stack. Both patches are Cc: stable and should be backported
together.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb8204371f5c..e6be066349de 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -612,6 +612,9 @@ static int lan78xx_read_reg(struct lan78xx_net *dev, u32 index, u32 *data)
 			      USB_VENDOR_REQUEST_READ_REGISTER,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_GET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		le32_to_cpus(buf);
 		*data = *buf;
@@ -695,6 +698,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
 			      (void *)stats,
 			      sizeof(*stats),
 			      USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*stats))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		src = (u32 *)stats;
 		dst = (u32 *)data;
-- 
2.43.0

