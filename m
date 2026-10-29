Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256905;
	b=eyFMJdAASKjHD4vUE6bVYqjwJPT5FTNDnPo9kmjhtID0QDZsEuEw+9J+tm9NVMzr8o0c
	 m51OijJK1nWu8BC3m8PMNDYLC2SccT40ktUb/o2vN0RJT8Ylw98rjpEh33EIPdXgXLGft
	 rt9DDlsuT5/a7BelJ8/fs7P/T3U71jfBG/ifznTq9ai7MysIeZADEALRwsMWk/+wajufz
	 1a1eKhJublHHVE5cjq6qdQUl6f1uwkXLJatZDYt9fIR4rLSH2FWuxxbmv7uSdG2FyeD7a
	 THun18QuP9Lr5Pm7wOyH9pw/ldahw/2iTicnSl4146qeNL02L2ut3JqQ8XWagsVu3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
	b=35KBTw8BtoBpGuXcV5XGrmVkIW+axwyJlJtF+3O+6gJLRPCdllLRySpptiGkokj9qrPo
	 ehBs1/O7vBa5+9U27dvmcr9HfLuTNAGDxOcpLCqZNjQrodnapY3QiVupy5PlSXyhyfVQD
	 s3TzHAE6/xhvoHq/V+u6yB8hXP7nk2b6W81aW2iIYjH3DmVkf22twN1SABEbl6c/wJL2E
	 m8yxg5oEjvBttev6nd/dY0IUXqIpUunateB3Zs4ACeuLj9iFRiSr67n/1AoiSvYSQhavO
	 Y/bY2Ql7/jrdfd0+1Jh+m2WLOspy7deCcWnA5Oe1vluh8r3vcyqMFXQwmBRgi/UIxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLAyjMiu;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB05606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLAyjMiu
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14548305e9.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256903; x=1793861703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
        b=NLAyjMiuk8kQd90uUN99GdtWeRcIUvHAdsc2Ilgf5zVhT7YanPRXecw+mI1ZIwbdIW
         BurIyL/Xk9aJmSCMudnVywXJtwgnBgk7scm9JO6tEb1GZsYR2GdkNi1pM07ZF9Y0RSwR
         F91S4H+RBgO1tnGjB5F/6DK9vsx1EuQB8arbeWAit5Tj1HAH7C8ZFau6yOkTzch+rCIf
         pG8zyDBw5lIBSN52u3HW+3B+axh10YGYaHN7sWmefiHVJIZSEmdCN3Schk85nMYIaKHo
         QDkey9opu8ubh4gDtKye3aa6yYd88IPs64EyeHZjUqVrwE8SIJ1HC1pSvUuwc++hfKVp
         ef/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256903; x=1793861703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKX2vzqju2uVtUddrt0KIlVJBq6++dTUDDN2gHbUA2M=;
        b=xakQ6b1GkLzK88FA6nqksO1kpQRjpLlIfjI65HUmUAWYdLykI7Af0Ca4zcEFthA1JW
         aNGO5xhy0lOKkk4uVlp8OK/IYTKpCaT3Y0q8GiaxWAvN2X8IL0CR0rXIVT4hw2hB4jAP
         UF86rmEQYUfkhEgoAq+04BtMdsoSggdIqpjqp7RbWVEfR5DN2AVMqeS4ML+bE+zcKBYV
         8JCQLh8IGkE7C5d9zTuLBg3T+J715SbXN+OMw5JByS04kzRmw7UpcpiOhxP0npOaPTQs
         R9dZMuOG0puJGYbsWjFUmn/oywqvQi54BJClYrnY7unZncgq1Ebx+V/cDx5jR18AOQUD
         Xbjg==
X-Forwarded-Encrypted: i=1; AKwUvBxUCAtex8GLLjRcQMmSoRCvRRiTGTMuY0ATHuTG5MemMZJBq7sM0GVCF3zNmKcFYBvuPDH3B2ya18w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVeMp+tGqPPmEQfbDikcW5cn3zBw/UrO9nvZBqF+nGmMw3q1Gf
	ZquCoGxqTvkdJhcyWVLmwMs5tWfWgCGsYzml1C755umgb41H65k6Jtkv
X-Gm-Gg: AYBFou3i4EUFNOlnMk75g2L/lbP9gd5PeOGNNdtPX4QaLgZkM+RfW+0k3Tu4uggyS80
	HzQ9Oz1kzlTaUM1WyVdiXH6u59pYAXam06j6pd0z1HyItnJL+PDd8M5BdDMf/ZTB8aps7np9lx+
	q1JdZktFOZeoQ/YWsiQJuXtxNHxr56q5z/rAGI4wWfpXusPQqKm5kByWjN/q8A9N4hty1h5/qXZ
	2HCHrndd0Kfs/ddkBAesTWQ5xi+tccFWmQOImSdbFT/3BcvcJ5DoyjJo844i8epy31eAXNzT66q
	p9VFqd3NBRXOuxc3v6OnfexUx/mvd5v0bBr1X3Ei7twKh+jctwfPVenH+o+fs+rTO9gz5DeZkRT
	QegFs1oIwbPRSvnWGxE76M2zkT9WKvYkZob3RlJG8+PeCDJ44qWz2W933gA+l9SeaWPH7TN0uSC
	94f6roaD7wqrl7dMPeQ88wmQH/Zd7J+pFxW/4VTPwKVYdb5DSNyMSdQxBGPkeciVZDrJGu6nCle
	NnHJ0Aid8FbuFjGhcL7o6Z+zK+Nn/gZECerZEN0Kp2wLfQO5EJm3YnavWNloUVLDAKtnpdCuuLz
	WCfGa+9hc8Sm0nDm3lRZBnT46a6Put86CZcjTQ==
X-Received: by 2002:a05:600c:c08d:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a9678c2c8cmr76477825e9.23.1793256903272;
        Wed, 28 Oct 2026 23:55:03 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33002941f8f.38.2026.10.28.23.55.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:55:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:54:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 1/4] usb: xhci: Fix TD invalidation on disconnected
 endpoints
Message-ID: <20261029075459.64108477.michal.pecio@gmail.com>
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

This code prevents queuing Set TR Dequeue commands to endpoints of
disconnected devices. Turns out, USB core may "resuscitate" these
devices if a reset is requested before disconnection and completed
after reconnection, leading to reuse of the default endpoint.

Make sure that the default endpoint is cleaned up properly - TRBs
are erased (just in case, as usual) and Dequeue is set to Enqueue.
And don't overwrite TD_HALTED status, we may need it when resetting
of halted disconnected control endpoints is implemented later to
further prepare them for resuscitation.

Reported-by: Dennis Wissel <dennis@dsine.de>
Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fa6684746305..7049787725fb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1061,12 +1061,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 			continue;
 		}
 
-		/* device disconnected or link error, ep will be dropped */
-		if (ep->ep_state & EP_DROP_PENDING) {
-			td->cancel_status = TD_CLEARED;
-			continue;
-		}
-
 		/*
 		 * If a ring stopped on the TD we need to cancel then we have to
 		 * move the xHC endpoint ring dequeue pointer past this TD.
@@ -1118,6 +1112,12 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (!cached_td)
 		return 0;
 
+	/* Don't bother fixing disconnected endpoints except EP0 */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
+		cached_td->cancel_status = TD_CLEARED;
+		return 0;
+	}
+
 	err = xhci_move_deq_to_next_td(xhci, ep, cached_td->urb->stream_id);
 
 	if (err) {
-- 
2.48.1
