Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777525;
	b=Mdyjb8i6cyY2sffycbLzT9/8u/TqMMMzyOK3y19lva5kbdX1TnoIzZKzqaoc/iWIvjCS
	 pKk0HoyOlZQGBpPPI7c5ptSVuwq7sYcAkI/9niK0YmceJO0chT+2LOvghCBVRkAy29hRR
	 p9pg0V4OGgaNTfxH64FTLAfg2tVs1RrtUMgFveeVBb0P2/K+MyxKN0KtI6/+AcWzBmPhU
	 XYYL5R3wUaVKeTdLG0WmYcch6Xjj39gDddD5Z/ZkjHVW5IXD81cNHRAaph9+LSFBaxtW/
	 OcY4UHV4fj9IAn13LLst6nKAdtmYv6OAgLS/4lsymviedMnIscqEOYLeijFWnkoyqMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U9ANJ3B6+URyp8PWUZ9qIzc4cW2GM4LcDUwic8AgW+c=;
	b=bwOpFHBr6lWkC07Gz0vlbHR16zRfC1qdZqVHYYPBNjDwrkzXyiq6a5vbM5z8AhvJTCAh
	 BUXfvSMieacAQcdMT3qjVOFAp/S5c+FTqwIlJ98K7tSm/sKNsbPoUAOYXkukHEView2tn
	 n/06xuSMrvzCAdKTp2i7IiRw2WnjKfkwMfdvKNz9nJPi2JPzU0/FLSHEsNwhg1IcWDcsX
	 ZkAULYbNZmpQtqP8g/Rj7GpE4Nr8PIi7C8/vIQg3gwbueFEH6mvsRAhCH6MlqJKkGIdOO
	 Q/QSJhfQSYz51eUav51urCjXVi+28VMQWzHL2u0mUjzu9bjuaEQTOuWZNuC24rB+UfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eqeVT47p;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CA606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eqeVT47p
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3838702b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795777524; x=1796382324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9ANJ3B6+URyp8PWUZ9qIzc4cW2GM4LcDUwic8AgW+c=;
        b=eqeVT47pJpbojwUSkka7lRiGS7EKd7+nSow9IiGOrxs/BnWNagVHsdo3bsVJ/1UTXj
         X6j1AtWOoBQdgX5JHb+WZWkVsvIEGTH+JTwfHsoCof3wZMitsBLcq/XwcpGt72jN6QHc
         c1x3GpyI9qUlOVMV8bXWZ0YQ6OBKAZF1Rb62++h8AMmSr50VKSERLfpCB2IouGn4pZcr
         BUpoWon/eA7/yWrJKdhlyVu1O0LSELrgdhhT/t+ASoq8CeoUr+vu+iqDsyljLZ6R9rY6
         O7GM2CbeFVgWN9W5bhPotOYu93reY9sVItY8HBIhtDXdWVK0+4EzEJkxaz04pr3riehp
         BpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777524; x=1796382324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9ANJ3B6+URyp8PWUZ9qIzc4cW2GM4LcDUwic8AgW+c=;
        b=kgZQKoHFMrzx0JUUtWOSuFRn0TZzO8e0S/wCv99Arr+jO/tm1XjINto8DnTAplYOxp
         IeLpM/K/i0ETkSOR7VqyryeVjejn64d0V/4Q+SkL0M1pXIU5WCgVTDyL/XXBI3QBt4qN
         OdT2eAE8NOWxlUMCEgajLcktQtkk2acXnjyhxCQirW7cSZ3QP9Wl0KsGBVzEEKmNBc8w
         /gHo/US/QwXqiHVKE8Fm1sgp+Hy7RWGEwwiwVnNZCsNO+Y2/awmRR2OyB8eYhMX4Mkyx
         B6MNzzJCPI2GxVVWhZSzFFp0oKlagn69V8v5Nw/tYx4mGUQq3Bbf+4uEQiYdGncCdWna
         zaIw==
X-Gm-Message-State: APuU4Z8V427LRBlvOGHRgGLdxRgGXl0cD7zRCTXA/JHiOq5XWviBH5Eo
	KTZaPu8zhZMEb+M3sip4bKUxIk8zcFY3iDEg25aTOYNXTAyWjdFvFSF3ak9p9VvDrrA=
X-Gm-Gg: AZFdTZc0f9WmHD79aXjKUK0Ij/mVvfEjjXX+X2SmcbYyqQi9zL+X9kJ05pcRP1c6vwV
	MdS/MhXZWV3u41mOGCTcF5ue3IMHoPFAe6M+P91p/y3yW9YgY9SmWAnDx+sJoqXSTdCH/MrzfAN
	fyksdcA6uvCSx6vp2UOw+QOfQUEJII/c03kXMCzxYUoyVfce2itpWDwUrFyulDP7BxHzQUY5Gr/
	uhd0POm4TnM3rk7RsoPsUJNMvfeeztP5175inM4p3UBbRdsLjCC9pokuw6HfEpyOcWgoPaBOr0+
	HckUZV/pZFT7/PhKWYy9A0/OP4PoA1q8ijXvdGCJskbUl39brUBOOUnm6s3pwVn/0SPrx9T39Ih
	uZdJclLIwcveyiW+7ifZv7FR/DcTr0gRY/ERXiHpfuDeNHokZFsEXfabGoRA0uaC5jbrkzyC7tE
	bteNkEjnAkmK1bcZCG5qKq9RcaPkHOU0d3dDgWhBlHzBjLTy3tvsZ/PkMmdmatfUMMH9/BCTNiO
	EBq12Me+C3uIwoFEULRpQyv4HoThxb7Nqz+O2i6IaztWrjvoV1M8j/LNKIyHkUztW6OxEovuqFa
	3odLQEIea1RZHKKod22k+FjEFf3nUWIAB6nBZ7TZE+aACPzKamIIuzb7QfCeQ7aVk0MyIOFxHfq
	hNvZqgSvbjHw42ifCNahklZV0GxBLug4gZsg=
X-Received: by 2002:a05:6a20:3d07:b0:3e1:89d6:ba1 with SMTP id adf61e73a8af0-401493a748cmr33033618637.3.1795777523884;
        Fri, 27 Nov 2026 03:05:23 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm12857789a12.2.2026.11.27.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:05:23 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oliver@neukum.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH net v2] net: usb: cdc_ncm: send the NTB once another datagram would not fit
Date: Fri, 27 Nov 2026 11:05:21 +0000
Message-ID: <20261127110521.1235409-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Observed on BMCs in real use communicating with a USB NCM gadget over an
EHCI host controller, where bulk TCP traffic caused steady tx_dropped
growth and retransmits. Tracing the link with kprobes and the kfree_skb
tracepoint during iperf3 TCP runs confirmed that every drop came from
cdc_ncm_txpath_bh() calling usbnet_start_xmit(NULL, ...) into a stopped
TX queue.

cdc_ncm_fill_tx_frame() only learns that an NTB is full when it is given
a datagram that no longer fits. It then hands the NTB to usbnet and
parks that datagram in tx_rem_skb for the next NTB. If the stack sends
nothing more, only the TX timer is left to send it.

With 16 KiB NTBs usbnet allows 5 TX URBs in flight at high speed. When
the NTB that was just handed over is the fifth, usbnet stops the TX
queue. The timer then builds an NTB for the parked datagram and calls
usbnet_start_xmit(NULL, ...) directly, bypassing the qdisc. Since commit
ad70411a978d ("usbnet: fix kernel crash after disconnect")
usbnet_start_xmit() frees what it is given while the queue is stopped,
so the datagram is lost and counted in tx_dropped. A bulk TCP sender
hits this several times per second.

Send the NTB as soon as another datagram of the interface MTU, with a
VLAN tag, would not fit, provided no datagram is still parked in
tx_rem_skb. Nothing is parked on that path, so cdc_ncm holds no
datagram when usbnet stops the queue for a full TX queue, and the timer
has nothing to flush into it. An NTB also no longer waits for the next
datagram to arrive before it is sent.

tx_rem_skb is still used when a datagram needs a new NDP that does not
fit, as with several MBIM sessions.

The cost is that an NTB is closed while it could still take a datagram
smaller than the MTU. With 16 KiB NTBs and a 1500 byte MTU this does
not change the 10 full size frames per NTB.

Tested on an NPCM730 BMC (EHCI host, Linux 7.3.6 with BQL and fq_codel)
running 30 s iperf3 IPv6 TCP streams to an NCM gadget, same board
before and after:

                        tx_dropped  Mbit/s (before -> after)
  1 stream,  fwd        106 -> 0    119.8 -> 141.0
  4 streams, fwd        128 -> 0    164.3 -> 172.4
  1 stream,  bidir       51 -> 0     39.5/118.3 -> 73.0/107.7
  4 streams, bidir       62 -> 0     36.7/150.3 -> 78.0/130.2
  4 streams, MSS 512     81 -> 0    129.2 -> 152.8

Fixes: ad70411a978d ("usbnet: fix kernel crash after disconnect")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
v2:
  - Replace the timer re-arm polling from v1 with closing the NTB as
    soon as another full-MTU (plus VLAN) datagram would not fit, so no
    datagram is parked in tx_rem_skb when usbnet stops the TX queue.
  - Add real-hardware discovery/trace validation and same-board Linux
    7.3.6 (with BQL and fq_codel) test results. Mainline usbnet BQL
    still hits these drops because DQL's limit exceeds the 5-URB
    (80 KiB) TX ring cap.
v1: https://lore.kernel.org/r/20261118034122.315979-1-william@wkennington.com

 drivers/net/usb/cdc_ncm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index e92dc7f011ea..7fbce4846a04 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -43,6 +43,7 @@
 #include <linux/ctype.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
+#include <linux/if_vlan.h>
 #include <linux/kstrtox.h>
 #include <linux/workqueue.h>
 #include <linux/mii.h>
@@ -1369,6 +1370,22 @@ cdc_ncm_fill_tx_frame(struct usbnet *dev, struct sk_buff *skb, __le32 sign)
 			ctx->tx_reason_ndp_full++;	/* count reason for transmitting */
 			break;
 		}
+
+		/* Send now if another full size datagram would not fit.
+		 * Accepting one more would park it in tx_rem_skb after
+		 * this NTB has been handed to usbnet. If that NTB fills
+		 * the TX queue, usbnet stops the queue and drops the NTB
+		 * the timer builds for the parked datagram.
+		 */
+		if (!ctx->tx_rem_skb && n + 1 < ctx->tx_max_datagrams &&
+		    skb_out->len + ctx->tx_modulus + ctx->tx_remainder +
+		    READ_ONCE(dev->net->mtu) + cdc_ncm_eth_hlen(dev) +
+		    VLAN_HLEN + delayed_ndp_size > ctx->tx_curr_size) {
+			ready2send = 1;
+			ctx->tx_reason_ntb_full++;	/* count reason for transmitting */
+			n++;
+			break;
+		}
 	}
 
 	/* free up any dangling skb */
-- 
2.56.1.839.g22a8290db9-goog

