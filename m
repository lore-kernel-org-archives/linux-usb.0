Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548228;
	b=nJIt5zTDCx0AQ7nkEQW6P04rhL8sc3kkEMj3Dp1586hH8qZ/qaoCWg94BmyUkRreoZ9P
	 ogrAbB2U7byzWhplLMjckyefE5aVMS3oRnO7HZ6sVT20gLZW3ZPulV6ls8GUlwoOrup14
	 ubY9rZAtzSf4/PMJeQjIFjnSrJPHwqVPz3MLXXhlUN/G8T3xW3Q/6lLzW+rjH1pEUG+9Z
	 RiYIvbJlj7CEHJ66TyuJYlVRvAX/+8wJHbgGnxp+A19k2S/Y8kIVWAeW1mL7L8Hi/UE6I
	 MN7d/8Jirbm7sett2XPI2/Tu+z6gOqLox3CJnv4B036E0I5K/uNH/MJFi19wNvVt6yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
	b=zg8dX0nBSc93f93jgbk9Q8Yw6Q8xY8yNDIFcgQq71ZikouodgSVcrcNOA1h6sqIcKiUp
	 sGpGTRi+9Q7Mvy6s9TvowXKpIiRqDujYbZMrAxfzNa0CUuNh3fxJtJ4GwQSbCukED2Qcm
	 YdCmQAP76cbIJMRXC+Q7BuLx3nYcyc9RrFBUhta0ImZVE6aN8suHx/fYsopnhKH5/PTCu
	 FC/z4SwtHs3BZxY420B1X35OK3Kh+4AAJHZo5vUd2abKBqc+35FUO/sOcWhyk7XMTU+Ly
	 BoxN12mjzx9XGaIw/mS205EYgCmkcyJv4qjAxXRMUE+Q2vRGuRxepz7RDt4RHZMaXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b="h/m2fH6O";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D5606A329
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=h/m2fH6O
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso81662a12.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 19:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548228; x=1793153028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
        b=h/m2fH6OaMEnC6tFW0u2SOm4dnJ4dQnTTGMGtxG3gBMRjJpIgeYI5Ph9/yGfHLuJHJ
         l7DEoeCiqzQT8VtZedA4lPcgWm8kT617+FpU3o/RkURArUAMsXsyTQBykQWO8kfYGSZo
         Soi15z+FgGAS5L/q8tkyr6VDOm1aeDpEZElc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548228; x=1793153028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
        b=CWUwobfQiQeVqlk+z4DAdDvAWlsX3T/psN/C8zW6KhwrUWvwNkhn8I4BCu9YPFMkDA
         MD1Wk7eG3txhysKUvi/ccX4CzHoFGasIalBhGLSYG5qW4ciNRGWLYx6JvV6VEgVCg2j8
         B6xrd/VkHJna6DqhDoN5k72PxG1FNXZkkFJf4iLj8sZgTGqCn7dXcs18GgJUpOWGy+3k
         ajspLOqhK/XSQrJEZz+9TbZcmHnNKXX32LKFNGFJfZn3qVeIcDrwKbS9b1tPq4jSn1Dv
         FdrFP8pjy7HF+fAcKBhrW5rzzkgdlMp1CQPK+VItmNj+bqF2fTddY/ZOtUR9PMjB+2NQ
         ursw==
X-Forwarded-Encrypted: i=1; AKwUvByHrYmqwUL+pfTu/8UI5iP0QNYRrNo+ds7XjjZ6X1A7/VlZSveTfdVViv6ZJUK0G/dUu2pUDrsXJJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRkWEgqF6UEChGvqNbbT5h+lbT1qHTiF0mAh9cA8XoSowk1864
	l1HK1UiX3u82ZXBQ2uaUd789dEq2k0T4MHe1+8A6rh2hk6sfc2ayd4DhbzE+TmSeXz8=
X-Gm-Gg: AYBFou0jU7TSkpoMacNbAC9nAYxSSdakPa1XfgTKIgcTlm1K60gDRKR5BMpGNYuL2c4
	xD7U9xriuZJp8YwsZzy9ieTvnZWGfDfrmzf8/FEKNNRIXIeOtMVS27FYdeZbQQPsdGwQ6VPF793
	iq1grLGwnlcLucsAzmzWxBLOLDnMhm2CgJIaGZj9XxLwGP0PHBaq3tlAA6+A18axXUkduKcYWkq
	FXuMve3DpSLwGEUT039b/JPl2+tTPYphnQd9z5SpU1VYUA77WOArSkcQFagoC1P3OFzxKnmSEMz
	ja6QYzrgSy6IXR1eU9Om7vAJMAQIzzJ3BA595xyj88TJhtOLxA2OzAsRp8eHifk7sfGlOcd+mlR
	6+xyJV9RY4d2wsnJQDQWfYp5yIuWCs/eGGtNcRbayQoa/KUFliyApVtm9on3FWnDEfsMeaCIx3x
	8rC4jj6GatHpBXEzBLK0ZzEs1wareJ7Bu5tdUrWUfXtFWI6pcQfiM6YnkRvsXohDcsjILWM80HM
	iMjx109885yYacLxiGdJm0IkWRc7Yy4ZS2ey55MSkChsimveZDvJf57m8MXdz3rBOgRLT0uXwS8
	kzr4+psaUQ==
X-Received: by 2002:a17:90b:380e:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ad86f73897mr573324a91.42.1792548227728;
        Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
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
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: usb: pegasus: check rx pkt_len against the received length
Date: Wed, 21 Oct 2026 10:03:10 +0800
Message-ID: <20261021020310.34045-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
References: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
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

read_bulk_callback() takes the frame length from the device, from the
receive header on the 0x8513 and from the trailing status bytes on the
other chips, and only checks it against PEGASUS_MTU before passing that
many bytes up the stack. In two cases the stack then uses bytes that the
device did not send:

- A device that sends a short transfer but claims a long frame gets the
  stale or uninitialized remainder of the receive skb delivered as
  packet data.

- A device that claims a frame shorter than an Ethernet header gets
  past the check as well. eth_type_trans() takes pkt_type from h_dest
  and the protocol from h_proto without checking skb->len. If the
  transfer is also short, those come from bytes left in the skb by an
  earlier transfer, or from uninitialized memory.

Drop frames shorter than ETH_HLEN, and frames whose claimed length, plus
the 0x8513 header, does not fit in the bytes actually received, and
count them as length errors. urb->actual_length never exceeds the
PEGASUS_MTU sized transfer buffer, so this also covers the existing
PEGASUS_MTU check. Valid Ethernet frames are at least 60 bytes long
without the FCS, so they are not affected.

Found by code review with LLM assistance. With an emulated USB device,
a 101-byte transfer claiming a 1500-byte frame was passed up as a
1500-byte packet before this change and is dropped after it, and
frames claiming 0, 4 and 13 bytes were passed up and are now dropped
and counted in rx_length_errors. The extra bytes happened to be zero
in the first test, so disclosure of actual kernel data was not
demonstrated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 7c7d6b69998f..68e4b6658dd2 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -520,11 +520,17 @@ static void read_bulk_callback(struct urb *urb)
 	}
 
 	/*
-	 * If the packet is unreasonably long, quietly drop it rather than
-	 * kernel panicing by calling skb_put.
+	 * Drop frames shorter than an Ethernet header, because
+	 * eth_type_trans() reads the header whatever the length, and frames
+	 * longer than what was actually received. Passing either up would
+	 * expose stale buffer contents, and skb_put() could panic on the
+	 * latter. count is at most PEGASUS_MTU.
 	 */
-	if (pkt_len > PEGASUS_MTU - rx_offset)
+	if (pkt_len < ETH_HLEN || pkt_len + rx_offset > count) {
+		net->stats.rx_errors++;
+		net->stats.rx_length_errors++;
 		goto goon;
+	}
 
 	/*
 	 * at this point we are sure pegasus->rx_skb != NULL
-- 
2.43.0

