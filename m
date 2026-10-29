Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256988;
	b=p1HwhFE6CdU/G5E4pmUdqmBjobXYE6Kx5gnsMI59EFmrV13mIm0gcd/xz2MwPAv4u1ci
	 sAM7aX83CyvOKVkxyHaRTcjy1dkX+ZmV+Cs0R2xu4Y8Ut8HqZbo1rgx6KyUR62N/BnFHb
	 zu8rnWwVzz7Th6Onv1otGyzK8zTjiTquhQZKOcsdTO4D4C+ZlMIAWBpBU96l9T+r0beOZ
	 svdl+zzarU6KmQpaPG8wvgYz3JpPcPO0Xtba+DXe901VSPYznBDfESEuyqswDWzsL/67p
	 KxalmWRdk05rjQ2AgAaDpz0s+xEs/ug4CdHByUlF5mal77nlVjQrc5Ybbj7SJ2bMpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
	b=GX78I2SEtSE9brmIvHT2KrYjzFnytYZdTHL3nWlForWs5dQfyp9GCGbzZIFugWLxGcf6
	 gXE/pzAPuYsTIUOAcdtkneYNCuBQztNof2fvBpCO0ajQQKav5DangmEddqXIz/QGyrjp+
	 Dp7bsiGp8iqQoWgjqhr39aXJzbga1nMwUr5c6X1rIkBXvMskMusxhT+DqihWjMckeaMea
	 01qxhyJ2e1CQaqnrWHZWOlAltjLOKGmXINRGRPthC0Nb8IrwbPB93UiaPsv0v29zSnmuu
	 gZlvh1LBtPPRgFjL1vOd2qFXU57kQcyIVU8CCE1h6kPDuMVfEBCw5OUZWbtjSOLSVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzdqaZx+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8C606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzdqaZx+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12538585e9.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 23:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256986; x=1793861786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
        b=xzdqaZx+tbA4+2b/JmxmLSzNfQXORDCU/RfHstk+gjcQXNRLq/XIhvCdbM1Jkf20Y0
         aGRruwkrsZM7D14C98Zy9TNoExbKfdiDQAjrbR79/xshmhYwUeUoknvlY+wjShmZT9L6
         vvlFsYjrlebmansZW0XagyExWBRMZQIDd6lFdID3SyyWqE3eOIQ3my25pWRzUkuORzsS
         epPJ/weI24hn7I4VGBqh2zHFuX8XxcdKxtDUFLER6XiSm4Wn5NEcuZ0Q782BdasHH30P
         hiuagNVXiUjBSt6qzJe14Rc/v6zJp9u8cCxgSHFEZmDrgz3+8Nxd1eBdJSVjFnRdVGZu
         9a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256986; x=1793861786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wRVkfz7eaD4cTxlgQJa1LwBrh6cj53D2L99M0hD7VA=;
        b=cD0SekkhdiRe6LHIAl3rWNSOtCoFDVX1DTev9V4bH+WzAWOK6TBWbmSeNuoHQGMVE/
         oMUII4kJRFcqFL1v2OU3UZNUJWf7C7YONwe65rIqpK+SJp+73Fx43BbjOtu0jd0YZzxK
         O54QWVSrocNTL9/F0prKztnhln8mQqd9TTez0UrCQgDdRaiuXkDZxmHPkivildGcRXYf
         RY/W0rR2Oq/Qq/GVSWWgRwoasx14jnpTHXw14w4p/BW3lML/VTuxTGxXPBQCSh1LEol0
         CfdVW76UXvbLd7Ow+VVbee6NZGKnlVZWes+/73BdOM+8cQJbGajBAxbUSWhMwT0jPVvu
         MLVA==
X-Forwarded-Encrypted: i=1; AKwUvBx0Alz0UNifY1qI5Odz1GYoOyl0ZRj5btVwNZJPmJQkR/UBESDllLiud6QO/irWXe9pCuoN0+HTnig=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMT59LtLAZhXeseyNdbnNg/rh2t3GrXrMN8knBrSoTa7QPYsVe
	LIv8CFhwhPxW2y56kGDqZ5xr4W/4ry0A0crP/uDCZHI1QLCnS47wV8Wp
X-Gm-Gg: AYBFou068e+axhpfIVf/uJMmPPdtd9ZHprNHsvtcN05f9zoLkhgBaTigH8+4IPmn/9e
	DCXgrcbxh1rcPt19vrzyjTJiqHPiyC5Y4sBJnJP4XvpS23FNVnrNV6mpUCrT6l6ocjbMhU3R9UJ
	LbNe17Bw1bmqVAjlV0cHnGeVWV5CzkuW4vcMHyp4o1N8aGpqmGEQ1LQNhCx07n2hRmQhHk0Q3PT
	5qdsUPG3H973ag87BEzpGQDhKkJWQUPXcEcEE4UIrq3mNpPCYEkcmU6S6EHCiCJOH9OjXqkmIIn
	C9pVpiNM9JJPLc1DD/yCwkdhH3gii6OQHLYig8Ea87HuSg1GlFnpM6cVqQdqTpswK+8x0rYqU/6
	bmRQsfZeeEaDQhL3OjPbGXMW2b9AVBHfIqFE0CpO8pbD/eyEA8a/9bdNJg8Ih2mhr/JVDaw2Kyi
	wlnjtVV2zxf90BmsGoVwU3KL1ffaSYXCPNPAaWWkelJXBgGg2bRAYrNI4b1X5shhGFKcr9X2c8U
	tXQFAzSDhkI43pmhJBDj7rz1p1u9Yao5RtCVimxc7L/W85yOaLWJD48LpEIt4BLVwX3OtcoRagU
	KRqRDtRBuRLVnkEOHvjFR6no+xqnHVfpvkZmHA==
X-Received: by 2002:a05:600c:a11:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a966773233mr106983065e9.15.1793256986486;
        Wed, 28 Oct 2026 23:56:26 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm49489085e9.7.2026.10.28.23.56.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:56:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:56:22 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 3/4] usb: xhci: Give back URBs on halted disconnected
 endpoints
Message-ID: <20261029075622.2eacf9be.michal.pecio@gmail.com>
In-Reply-To: <20261029075409.4b203658.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
	<20261029075409.4b203658.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Bailing out of xhci_handle_halted_endpoint() on disconnected devices
had a side effect of leaving the failed URB and other URBs stranded
until the driver times out or its disconnect() routine runs and the
URBs are unlinked. And since disconnect() can't run during probe(),
only timeouts remained, slowing down error handling and making some
devices which disconnect during probe fail to probe altogether.

Ensure giveback of all URBs when we don't queue Reset Endpoint.
Set return status to 0, because the only caller that looks at it is
xhci_handle_cmd_stop_ep(), which would only repeat an equivalent of
xhci_process_cancelled_tds() if we return -ENODEV.

Reported-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Link: https://lore.kernel.org/linux-usb/20261010064407.11030-1-yiyu@yiyuzhou.io/
Reported-by: Dennis Wissel <dennis@dsine.de>
Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 14cfb025c365..1097600699d4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -993,13 +993,14 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
-	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
+	 * Flag endpoints behind disconnected RH ports and override soft retries.
+	 * Restarting them is futile and known to trigger HC bugs on USB3 buses.
 	 */
 	if (rhub_port->link_inactive || !rhub_port->connected) {
+		xhci_dbg(xhci, "Halted slot %d ep %d is lost\n",
+				slot_id, ep->ep_index);
 		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
+		reset_type = EP_HARD_RESET;
 	}
 
 	/* add td to cancelled list and let reset ep handler take care of it */
@@ -1017,6 +1018,12 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/* Don't reset lost endpoints, only EP0 can survive device reset */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
+		xhci_process_cancelled_tds(xhci, ep);
+		return 0;
+	}
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
-- 
2.48.1
