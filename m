Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360942;
	b=1qFy9ETMFeo7DVIpcqDRXgXdipxEmauFNDu5xAUOQ5sOQJuiPw6Yj8X/vpL9DyHSqKUB
	 HKTwnfho8dcSD/891fXazxq8bfC4gPrEQIcMAXxIov7d3pM0wScbcB2j+2IkDUVJ9IStE
	 vUivDQta7zfQdc5+tDji8yBI8uEsazV/8LqFQGV/mszPGmd3OSxz70uiLuJlNo6mPGnE0
	 S7hhq67eIjdME5X+FTUbjMHLqz7z4ZxYyv/7iK8R0o/ehV6CSoCELwtnNN/0ZKn5x1B4K
	 qkU5dcueEjWxzrYGNXT5UHnjjCCDA4PNKBRRkxT40k/vUhz7JGlXzp2UJ7CQrLyiZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
	b=C+8E+xm9y5aDqZ0xTqWNXD7OgWLV4wOPx62prPg/XoRHEdDArzqee/Gn2gXCiL5YaTPY
	 j7bEB0q4Y8OGL+N8yXnufc31ybysfPjA6EI3rX3cr5HW6aBFpCnwrIWQ1G1D4B+Ua0euz
	 7QOITup/nzUGVmvO4mlXBMEApX17jKFOMBGangHKj9os11xRqgnMVlIJACJYh47h9SbG8
	 lXHde3A2f78F5MEzxG5aPP0uDHDmrMgjS2wWy9TeqxHR3pZMS0ZZig6WmttJ9BgT4ayE/
	 rNIGJaQDLRQGUkC4HppHEqQo1UspXVAP+I+wOOvBgGrV1kWuJITMmRwxbQx8s2EghRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Bx+xqW+D;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9455606A330
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 01:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9455606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Bx+xqW+D
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so4598121c88.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1794360941; x=1794965741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
        b=Bx+xqW+DV9goEpGGY/QAN0sUO8vxR2YZAfom2OG6TW9RgB6WMH5OunJGSLrsDWpWSa
         m20S6DoegeayR1BMrWO9L6DcrlUtGBpoATX4Q6C4xa2YFTzkVWcdWjI5dViI2bcu1aQi
         9mqL1FNImrGZ2sXzF/uXwUBiBHa9gMHCAEFd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360941; x=1794965741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
        b=QGMu1N+l1OG3Obi3q1bnkEtyxK4caLGXBJOY4QSz6r0vo1sPFE+Ayvs/9YiduHJGnw
         F8jTbxEhAzbuG/y7jgjNU8Tx50Mo9ktaDZiJltFsCnGuGNwlzFUE21V+a/zBf7OO5RHH
         io2t0q8wAIOoZ+ciLiE+LHDxCwdHnk00w2DX9eWWCgzo5dOG/eb5H3/aKPPTX2HXCgFZ
         UM0NgAG3BOf6b/2s9LY/zMZd0urXrGsalo+3T35A0P8lXbbrcpWMVDgLVZolhhEtNDfs
         KXXLcGAlrg1xaPCHQwmeCU3PA2EaxoOYAHEN0pki0V/J4dPGEjapbXg5BVgjcPd96A//
         h+jQ==
X-Forwarded-Encrypted: i=1; AL+hErEHi+RqFpLS4Eu5n219ZoaBMA61dqM9Bijo2r11Ds+eAIITGfR5KNWjBu9HFooL90zddJYgHN+cWgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DBV/Pejeyjt8jzHq1SmqYHzXSqEugY87GpXze45RpWYuQ8IWj
	MeQhqDmMdnLN233uXVs9u6Et0rDSh3mp35Xcuy1qeyGeSEWtMeuLci03tdQ8fiRiYF8=
X-Gm-Gg: AYBFou2Le5pN15RwMLsxNoeWPhe0Yzk1l/cycH9v0VhEzdQ64DBSI3x/wiA02VJsdWp
	DqYsnzh/McNO3MTjbTRKBLAjqqtt695gg/WBQsRb4eIvqqYtjnxRxVpJjfmCSjbg/0yCtRHNxno
	0lH3P5oMUI55b0619868qILBhnwnpghSI52PBopvU/pDnfzKPjQIUao312jCt6gfYhi+tcU9zxS
	xhJYuG5GaAn1yqdbXnkASHE2GYxoG03HQwWtA+jTWFVjrmaX/mGiqDRDXVCofWTY04Xk60ggtnu
	zdgSDNxJkuMoDC+lLscZ+Bp9erRxRMzNYAaIPSD/RZHyrYTF1IA4ELLeg+5mALK9uN4dLhQSpnx
	8aUkHJo82H9bRJ03nh7UGfdOOskQeTwkBk/Bh3yrbtRpwjmWQU5ch4VB+sbp67tcRofp89iAEwe
	XzRYUXjjudWoEL1Kbza9zasnlc0zAEwm59cRdN03Wt+QJHszp0Yi/QAs3f9pXtGZhYpUGr9VFJZ
	Lz6RtEpQZSqQetzErWjWR5pFL3Nq92lc32thMBNsn1VAkYj7Ilt/GN5MnMQMg+mawzmRTh2obIL
	ISmfcRff/0BWqFhb5VsmgY+Aoc6TD1ARnz7I74beU/Gt/ZuDNQSuf2zOkw==
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr1071478c88.27.1794360940616;
        Tue, 10 Nov 2026 17:35:40 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9696223c88.8.2026.11.10.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:35:40 -0800 (PST)
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
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v5 2/2] net: usb: lan78xx: reject short register and statistics transfers
Date: Wed, 11 Nov 2026 09:34:54 +0800
Message-ID: <20261111013454.34542-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
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

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

Treat a short transfer as -EIO in both helpers. lan78xx_write_reg()
does not use uninitialized data, since it fills its buffer before the
transfer, but make it fail on a short transfer as well, so that all the
register helpers report a partial transfer as an error.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---

Notes:
    This patch depends on the previous one. Without it, a failed statistics
    read would make lan78xx_update_stats() compute the counters from its
    uninitialized on-stack buffer, so the leak would move from the heap to the
    stack.

 drivers/net/usb/lan78xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 76c2d98b49df..4a58febcddcf 100644
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
@@ -645,6 +648,9 @@ static int lan78xx_write_reg(struct lan78xx_net *dev, u32 index, u32 data)
 			      USB_VENDOR_REQUEST_WRITE_REGISTER,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (unlikely(ret < 0) &&
 	    net_ratelimit()) {
 		netdev_warn(dev->net,
@@ -695,6 +701,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
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

