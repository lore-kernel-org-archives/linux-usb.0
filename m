Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973286;
	b=B1OdAXWxZc9jsIVK4tDqIxpPAP6A8YMXtp3zn4WhNNhJiECNs7in662J5A2FoNFZS4MP
	 2mkiYknREn2JV7DZ9ItLpT6AmU/ub8fZpOi2mXYtbKVMkFiG75CfIHhKV0NFPZD01liVI
	 TgDloRTNlMZAF5Y52ojV15I6GVSHhzAsc9iPcUJoIXkDvgNG19vcD7Ji2G6SjCzbrabYy
	 yQ0484ucBa1I9F51PiTm7lpeeTNQ7spezLjGuyVLtpv0MvZktW5rX2L2GmIR/3plNz7hX
	 em83t9wG5iOEy/n9IRNBJZHvh19LtnOis6+T8WE16NKEDdOkSLnBV3FSaiJ9dQF6dFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
	b=YGlaq9bekwDYDPfeg/Q5rtrGQjyFfHOToAxhZYE7F2SdYG79XZyVoeroGWj5F3E/YiUz
	 vaDxDXMahHOgPDZJejItsDkuOFfuuDOq1RoCq7U+3n6RO8lyRPI7oG5jqHoczJJyAxG3p
	 LtIs7ZbSxXyG61awt6IHw4XXY1pEohUQEtTWbVWTiIExMmMgL6GiJIQZWKdo68pnZXpVs
	 KlpHCIDRcVdxRUfRojRR22J38pvxKUHaR3GX2fNrjQ8f7/B/MjMIMYUJYGhB+qXvNElnF
	 m5xg3MsnG9UR83uHIwj1fuEwsNkchaiXOaLqTGa06qVqKKALg5WQReKphvMJIWF1lbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aPhecY8G;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A212606A335
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A212606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aPhecY8G
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so234461a91.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 19:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794973284; x=1795578084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
        b=aPhecY8GMBIa+nYNDpQ6Nw2J0g1Ci7+fFM7OT5D7R+XeseB5C1wIN39R7uMhX1qwpT
         peQckTbsk/IZmg0uS8s8NcPgsNBNtzE59Cn4tTwVR6T4LHF7jtF2PE+EZ06mqQfw743l
         96vKj4zzO5vBilTrSwtCJDcIePWbU8uxVXNsX+BUUcnUr/OJ7ZH0P09IbLrzRqZJpZuC
         YzleiisHJ1m+ROsfbbjNkU2YzVBEMtk7g/3R0rKu+v9Gwib34WwyU2TL72xgcxuJSx4p
         rfw28K+OhD3SnY2T48m/MLP+tTTlcQm9KgpjAKZcWr4F8Y/WjCMyY4/Owk6PYEzAZlZt
         +6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973284; x=1795578084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
        b=ALwkzNw4wSwzboT+As5kOBLlNBTlYyIValtiwLJCHvxqfA3zWipRYuloKCdZ3tXQED
         9RC7CtHb58EVoKn3yQgjyXFhw3mCch02Gn2wg6Zbz6G5QPuGOljKovQhS6JG2YcWihpg
         b8chBdOjW2EfxXXwOzXHeKEPwZ8xBBEbLoUI+PlKuSN2Zhk+E/qxgy9y/w5yqHyFzHaZ
         m8vu3xw7LBhHOoYwOBOrgkaTyK3jT+Uj96N9RbevBH1Kh43VjpFxsFiV3YJRigQUxCMd
         aPwGoAlSAJijERPDT9cHrBG2dm7T6ze4XpoEWKT6jtVWyM5NtYSq0v1+Nl8MJdLgs3PU
         XWsA==
X-Forwarded-Encrypted: i=1; AL+hErFsBa0c4ofwKWrF04qEaJYPPtqaiRi0Oz1oOgmNh3bbz1K/Phsy0TId4c32ZsCjfAlGV9wVIKCNTnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r8bLTFxYNnuqueq4kIYCT2RV+vv8RI/+9JEYc7yJkFw1+NWtU
	N7yTxAtbd/AvOWf81wo2dzjLcOUjTfeGRlpRG/E/OEgy3nHJ0x6x220rjaSHG7h5DgQ=
X-Gm-Gg: AZFdTZeE+H6pVViATq2V5KzhaBYu3HviFm5mC77yMkSZBK/OMu6dGUgbJf6YUOpxJlP
	y0NPQzl2lAZUkSM/v0fIeZvDVjQD4Qq+bvVlHBlqKUncm9z7Vxongerdir77iQmmQQ4ItH+GWjL
	qUPEcQUQIgxtWgTdxa8TFt0UPqbLU+Fz4T+OZICj6f8XjPrKAcvvhO5kKZ44Lcx1472HwvbXl/t
	N+qFI+E1x/KuV7NNfgZjIKdIfUod+dg0nL3huXpD4Q/IhBL89nN5lfig4D2i4zZU1SlFY6PK7wa
	5UzCO/krG2vDHBhU6rOCj5NpkaAosLS0GUBO748rFqCfLVe4GESOF/72yZlMFQoe7z7zZMpjBAL
	+nbYCyNt6iIYTSaDGPqQ843IHH7CWHyMSewGX/0or1MtuB7ECQt71zlbkeocHdqoDG1bXOWnG9J
	bF6l1lfCD6gePHDt5S+AvEh7J9tcGbidontkKnQb7riEjajae93xXIej6dB6ISo/ROAgwrUQmgS
	Ax1LJy10xbhUdQ9jmTMpSom7pmbZvUqQkiFpAgTyix+GfB5nY1aGZrQLQlH6oJA+Vf9Vgoin3nF
	v98K8ZJQcr8x/XJI0JamDTd8y1CEMIHYO/j5vUiX9mVl+9alNYErBvPr+ybkTH7e7jdSK0jQ+Do
	SiY2ikMoXgdL1ntI=
X-Received: by 2002:a17:90b:3c04:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b3d079ffb7mr1117572a91.22.1794973284230;
        Tue, 17 Nov 2026 19:41:24 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm1793636a91.1.2026.11.17.19.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:41:23 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oliver@neukum.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Jan=20Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a stopped queue
Date: Wed, 18 Nov 2026 03:41:22 +0000
Message-ID: <20261118034122.315979-1-william@wkennington.com>
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

cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
whether usbnet has stopped the netdev TX queue. Since commit
ad70411a978d ("usbnet: fix kernel crash after disconnect"),
usbnet_start_xmit() frees any NTB submitted while the queue is stopped
and increments tx_dropped.

This triggers routinely under bulk load. With the default 16 KiB NTBs,
usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
bulk TCP stream stops the queue constantly. The TX timer is armed while
an NTB is partly filled and keeps running after a subsequent packet
sends that NTB out full; when the timer fires while all 5 URBs are still
in flight, any frame left in tx_rem_skb or tx_curr_skb is flushed into a
new NTB and dropped by usbnet, causing steady tx_dropped increments and
TCP retransmits.

While TX URBs are in flight (dev->txq) or completed and awaiting
usbnet_bh() (dev->done), usbnet will wake the queue again. When the
queue is stopped under those conditions and cdc_ncm has buffered TX
frames, restart the timer instead of flushing into usbnet_start_xmit().
Keep the existing flush path when nothing is queued to wake the device,
the interface is down, or the timer is disabled (tx_timer_usecs = 0), so
the timer cannot rearm indefinitely.

Check the state under ctx->mtx inside netif_tx_lock_bh(), matching the
lock order on the transmit path and keeping tx_reason_timeout
serialized.

Fixes: ad70411a978d ("usbnet: fix kernel crash after disconnect")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/net/usb/cdc_ncm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index e92dc7f011ea..e5d659dd7436 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1509,9 +1509,26 @@ static void cdc_ncm_txpath_bh(struct tasklet_struct *t)
 		cdc_ncm_tx_timeout_start(ctx);
 		spin_unlock(&ctx->mtx);
 	} else if (dev->net != NULL) {
-		ctx->tx_reason_timeout++;	/* count reason for transmitting */
 		spin_unlock(&ctx->mtx);
 		netif_tx_lock_bh(dev->net);
+		spin_lock(&ctx->mtx);
+		/* usbnet drops the whole NTB if its queue is stopped. While
+		 * TX URBs are in flight, or completed but not yet reaped by
+		 * usbnet_bh(), the queue will be woken again, so keep any
+		 * buffered frames and retry a timer interval later.
+		 */
+		if (ctx->timer_interval &&
+		    (ctx->tx_curr_skb || ctx->tx_rem_skb) &&
+		    netif_running(dev->net) && netif_queue_stopped(dev->net) &&
+		    (skb_queue_len_lockless(&dev->txq) ||
+		     skb_queue_len_lockless(&dev->done))) {
+			cdc_ncm_tx_timeout_start(ctx);
+			spin_unlock(&ctx->mtx);
+			netif_tx_unlock_bh(dev->net);
+			return;
+		}
+		ctx->tx_reason_timeout++;
+		spin_unlock(&ctx->mtx);
 		usbnet_start_xmit(NULL, dev->net);
 		netif_tx_unlock_bh(dev->net);
 	} else {

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1.703.gf848ed807c-goog

