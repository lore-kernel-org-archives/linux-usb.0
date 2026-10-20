Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455665;
	b=mKOxNQ5SxNAHBuxrrRpvKIBr0VUg2bjnSIMV2WqCS36m7Z4o5nPulGLs/SzZNrtpRVTq
	 owkxJUqSBU7rsy1BiBIIAmiw6g8wCZEVsJuFQjN3MJ5pI2bT90smGY5DY9T6GX50ExvS2
	 VYaZoCqC16pcS6G8vAqNqDCXCEkuTAp0Q4844FOwaBoJpvdyfX5B7fRE3h87zZJ18BhHD
	 vn1G9BMp9sBVXR4qbaCbjaQndOvkEWsE32nk8DLIRSLbaODLzUUxXOcXfUSKhTD7YzkI/
	 pGIosUGQzfIw9BVhJ0ce6kuvo3q3erRiVErzCiZ5IWOvhw488a+mye6JtBl3geaSBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
	b=4fVvXq8Si4NTwwYQi2IHbQDw0aZkvX69DdFMDsRL5rPjLmTKxqS2oHLHw9E/P1lj27nM
	 0P8KWxQGLdbR+HehigqvD+YTBiHPGgce1Eg4iF2X3krVmILFRH4Z9WtnH2aVciyM88yB0
	 UMKwxIR+3LoCCzSLRxiz1rnxX5G6zWmRUez+sHXPEiwVUXPZn5BEFV2nGnze8L0ywCivO
	 vbohM6rcIEoYlg7bhwlgrAgrWW/JlSbGZCEXgZ7GQzScAO+5TBuz0zP935k9eeGYeQglQ
	 DlQgql2bpSZ/kddS4vTqvqBD0BH5Cfyp4sltpxb4pg1ZD4yZJbee8CU0l4DRO/SOLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=NzPGYzfW;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABFB606A321
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=NzPGYzfW
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so108135a91.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455664; x=1793060464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
        b=NzPGYzfW1WBjfwBOavoylb6rkxG7Bh3thkTixKBzQjgIlVPNNWwY+1+lTxDzqnof39
         wjZOxkOkeS76PtLwWa905tk0DoTPgNgw96iFiAmnfmMw3w6WPWkdWe7roBxc0Gl+vbEm
         w0MmkvTkYGhzElelY8ddSq2xdYktSmICX3ovs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455664; x=1793060464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
        b=r6mfme/BtCtOJOwQEiqeCFjBDYjiJC232kN26rVlAB7z4fTVo9SoHY368e0p28LXrC
         AGsNNa3ceyAhLU/Of90xeuQE+elA92y04K8LD9/+rkEUt2GNi/eTtabjq/hIMs+I4SdY
         7uZD330e3nst6YyIurmjHfAATpm+7aiJClycswlj3o/DwWk2Pan6Yx1W6H7Whd0c+vP6
         rF9CobXhOuM92/FM5fMVHIlJtYrpRHB+y5A09i9TTFHS9yYo6zTgzfVdF1oQ+QEgYrNy
         OOr35mTq+1TOBVMEAOUMYxSxNlP4ULlC7kw4LlodGpjLcFJa9U2mskkyRKHV6EpQ2TRs
         zM/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdq0g1Kh8Np3Y/hB4Po3R23NiGyMuwocF1VT9trrW11k7booeYDfRsflGcMXc8352V461QGNFOQSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNMxpXRWIsSvKrzCXplrZvBtL+1IpwPcyqXo1/WFNvLLVk2Ghp
	+MN/vnoNhISLprB9ZWoELktZi2j8eObaZVKJMMWDLNejZsuf4HtKxUZGHRHnPYVhA2Y=
X-Gm-Gg: AYBFou3vPIF/qyyVAXp1Zu6k7m0NW2XMYgRdueKe5zUggDyjjDjyELB2u369NUaRN45
	kDWPXcfV+TjQMjJMvRwehYrG+soqXD4OX1VXt3ztstkctoF10J47o2JZXh+VcarxajaICpMD0kC
	+tpC/4h6Xg4tsQfagURIqpvxDdaSJK/wiTsbHf4cgIMcoSLalR5U0nJQ8BydAPOiRoPO6vT1mT2
	zwIvtwHwFD8DATkeju6KTXkNk2MNI+9qrumiYFEo87YhaR6gwnq+Po7nR+BJ1koU/rZRG6r3t/F
	7SLBJH2xz9oRVgDjFBdZ251E66kCS/5C8HyqDwvKzB+bU5T0CnraPxMuW0sjqxTfJKiwJmh8EAP
	fEHNobza6NTgVF/6RnXCDs5z8n2otvOzadNHQyG1qhikCZwia5+dSRp7RT8eiwTR5qHbgY5F+O4
	c9lL/7zMzOsEvHTCHl2LaUkxAuk73Xbv7y4jgNwa7ROddHaDpPtDRNoSN4uVxjYqoP6gs0/5hCf
	1d716npXP3WqIe+hAyK4HbNgefBqIclkmHBtUmRfjZKlFMVR1EYrws=
X-Received: by 2002:a17:90b:3ec8:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ad64ba5d2emr378689a91.13.1792455663750;
        Mon, 19 Oct 2026 17:21:03 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:21:02 -0700 (PDT)
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
	stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net v4 2/2] net: usb: lan78xx: reject short register and statistics transfers
Date: Tue, 20 Oct 2026 08:16:21 +0800
Message-ID: <20261020001621.2920-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
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

The write path validation was suggested by Andrew.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Cc: stable@vger.kernel.org
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---

Notes:
    This patch depends on the previous one. Without it, a failed statistics
    read would make lan78xx_update_stats() compute the counters from its
    uninitialized on-stack buffer, so the leak would move from the heap to the
    stack. Both patches are Cc: stable and should be backported together.

 drivers/net/usb/lan78xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb8204371f5c..c19df8e80b52 100644
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

