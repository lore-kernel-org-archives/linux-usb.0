Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595293;
	b=kdcebdwQS8Qf5HF5jRwIRvehvLoY+0gmDuaDw85CD+FzUfIE9Ui9R1CLRD1KPSi5jcTB
	 ZuMa/hQwtLCLLaksKMzTHMTLFL7R9GxUtWhNXtV7Qi0x1/AcUb5SN9+QFol+0gg3FXUE6
	 /12Qfp4vM9l3m3W7bnm9HJFr4iKF+ni++7LLlz06WQodqUgFQaMhcxfrbRe5tOV9cTqNE
	 9lbes4wDZfYHtSSwfJARTQs7MCsxw1tZFcQmKJ98ArfLzHFTtcsUQmHvROrfFzHJhUoZF
	 Nzgd6zn9IhvtbjNV0Ouyd2NqZn3ION25p9pPX+BuZed8oUzC1up9Uzgshglr1YTlXHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
	b=Kt+vXi812ravjFVqJV07LYZXOWAlcAgUjop2UdseU6VCB7rLD0YVpdNJ7SvpVyFxVvav
	 xPP3ZAfDFzJtsYEqziQo6pow9lwyVS6RpjA3s+m3XHOpiOQZyyaFMUnnRHycuOU/tNuWM
	 YBsp7kMTTJZE81Vq+InLP/YM09hhy7Tl/VtJSv9pw9CIJnXt1RTCvxEs73E2MOFjv103F
	 JxVK2o6tTyGED6eShVGhnoCmkvsW9yKTH5H8SrFhEsstZf3a9QFxPYj+IUjEHX7HewbqO
	 6O79YOBN4ejFb1EiGUKTpGDIX1i2F2YhXFVonQ8xqvQPGWXKC6eelVkDbixWBu/wjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XrGj+8cs;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7760A260D
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C7760A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XrGj+8cs
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7fccba9c675so2571621a34.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595291; x=1793200091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
        b=XrGj+8csPaNTSeBqXQ046oZQPOTW7l+lwAvdn0gYkTa9Zh/pDDlA0C33O7StpRRY6t
         u3dhbKWDIY8M1i99LCEGQ60aa1M0pOJRMUxOwqlFDiaALeYKqTzFSTq2JFvRmVJ3Mi7Q
         aUIb3cz5zfMJzWMPHH6t2tyXgFQYjCP6G/aU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595291; x=1793200091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
        b=ngW/hffir6rm58/Of084mbfQfc5OPCMe/NunaJB3niYqQl7zsbdwAHNs60jC2bsr7G
         tf983wSH9278fa65/ZUX9t0pAFMkcILN4BdDh4oHywKoEA8zfcva5OgJTHofz+9MwDrr
         Qkids3acIOoIR3zXiS0lNJrKglOg8rSatwmM1dbC4ESDbgW3XGrueM+fAovkxQ6RJ3D5
         S3X8TItJSkgXCGgHLKNEuezIW6AoT7yGAjN5ynz2P4PnBCSp4Po+9qjSjs2+6sLQ8T8p
         n70dtTFfdtFmjC3ZVVgHUithj4pZO/vBTAQ/m4nMts1Tr051RB9+Bg/4GI5KjjWkbpBo
         nBrw==
X-Forwarded-Encrypted: i=1; AKwUvBwKB0qM502Lz5QQmUT6/pBiyzWfsfFgTsV5R5+Amm6mUy7YcTJb433qeOjL8Lu5ft70dV9MqPKdcns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZiJiJNqSx9v3EGFj0BIUiE3sl93qas6pIHmmUUEVEDcGJv52y
	EOxbxPplzOvnzLE0UqxNTej/fbmLsECfR+/zLsGoo7DU9Cx87nPuhIfhXjuECCa3vg==
X-Gm-Gg: AYBFou0e9nPuX5Jiba2jnh9MguWTJBOFpQkwC0j9BUKxoS9n1A5Oa1TLBmLCsVYcBPs
	P7qRnbb28vJ4rFCJTT9yjBmeuMKTQ8rItZLsLhPYNZo5be0QulZamAHriaCWH3lyU/8UK4JAn96
	KxAz6n3aJFlVt133cjTcXIshThs2LIuy9y02jfP97U+3lR3KQ+Jt4gGN1mFObauSQtJsYc3oZ1Y
	A0ied34FgEZ9r7TfyVUKof3ty94LNk4uypzA6UBL3HWWF8wjL5ux1Wd9z5wY5BZcdQpLp5aKdj5
	bFUfkPCLgXXOrN2HS0sH0vDezT8j8F0O0vlgCPHCeaMmAbZoAgZoMRisFDTPa1ld+2UCjZYLPdV
	HjozdKgvUKDJ50XjN5Xmc2mr0h5rp3xC6DnSAxbUE665PcRLQ84q3cxhWELlnFxhFjTsnzXt271
	KLlWiICUnf/AYQljc3TueYbH5xtdJeQ4gaYkyofb4ARKNbitpWEFzfJq7zHvYAkuTALm3l0YU3c
	Fipj89428y5XEmGIV9G3SjQ3b1Y0KIWEE5wBDAZFFdNCqqNOWtLD5joL5RjuCQnKiVlqG7XrdOA
	mwGDFuaUn+yh5Osh/6VAgaCk9hEJS4BOFrXOyUVGQBXE
X-Received: by 2002:a05:6808:6614:b0:544:9281:a3a9 with SMTP id 5614622812f47-5535626991amr1261042b6e.19.1792595291615;
        Wed, 21 Oct 2026 08:08:11 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:10 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	Anirudh Rayabharam <mail@anirudhrb.com>,
	"Brian G. Merrell" <bgmerrell@novell.com>
Subject: [PATCH 2/6] usbip: vhci_hcd: complete unsent URBs locally in vhci_urb_dequeue()
Date: Wed, 21 Oct 2026 09:06:57 -0600
Message-ID: <20261021150704.3129446-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
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

When an URB is enqueued via vhci_urb_enqueue(), its vhci_priv entry is
placed on vdev->priv_tx until vhci_tx_loop() moves it to vdev->priv_rx
in dequeue_from_priv_tx() and sends USBIP_CMD_SUBMIT.

If vhci_urb_dequeue() is called while the URB is still on vdev->priv_tx
and vdev->ud.tcp_socket is non-NULL, vhci_urb_dequeue() currently sets
urb->unlinked and queues a vhci_unlink entry on vdev->unlink_tx without
removing the URB from vdev->priv_tx. This causes two bugs:

1. If vhci_tx_loop() has already exited after an earlier send error or
   been stopped during connection shutdown before tcp_socket is cleared,
   the URB remains on vdev->priv_tx. When vhci_device_unlink_cleanup()
   later runs pickup_urb_and_free_priv(), which only searches
   vdev->priv_rx, the vhci_unlink entry is freed while the URB remains
   linked on ep->urb_list with urb->unlinked set. Subsequent calls to
   vhci_urb_dequeue() from usb_hcd_flush_endpoint() fail with -EBUSY at
   usb_hcd_check_unlink_urb(), leaking the URB giveback and hanging
   usb_kill_urb() in D state forever. (Stopping new enqueues on shutdown
   and draining non-unlinked URBs are addressed in the next patch.)

2. On an active connection, if an URB is enqueued and immediately
   dequeued while vhci_tx_loop() is in vhci_send_cmd_unlink(),
   USBIP_CMD_UNLINK can be transmitted before USBIP_CMD_SUBMIT for the
   same seqnum. The server replies USBIP_RET_UNLINK for the unknown
   seqnum while vhci_tx_loop() is concurrently building or sending
   USBIP_CMD_SUBMIT, racing on urb->hcpriv or leaving an orphaned
   USBIP_RET_SUBMIT that tears down the connection with
   VDEV_EVENT_ERROR_TCP.

Record whether an URB has been dequeued from vdev->priv_tx into
vdev->priv_rx via priv->submitted under vdev->priv_lock, and complete
unsent (!priv->submitted) URBs locally in vhci_urb_dequeue() without
queuing a CMD_UNLINK request. Because vhci_tx_loop() drains
vdev->priv_tx in vhci_send_cmd_submit() before entering
vhci_send_cmd_unlink(), any URB with priv->submitted set is guaranteed
to have its CMD_SUBMIT sent before its CMD_UNLINK.

Fixes: 258c81b341c8 ("usbip: give back URBs for unsent unlink requests during cleanup")
Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci.h     |  1 +
 drivers/usb/usbip/vhci_hcd.c | 14 ++++++--------
 drivers/usb/usbip/vhci_tx.c  |  1 +
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..4a62f89b89c7 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -55,6 +55,7 @@ struct vhci_priv {
 
 	struct vhci_device *vdev;
 	struct urb *urb;
+	bool submitted;
 };
 
 struct vhci_unlink {
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 3196ea80e7c2..7fadb41c01fc 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -925,20 +925,18 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		return ret;
 	}
 
-	 /* send unlink request here? */
-	if (!vdev->ud.tcp_socket) {
-		/* tcp connection is closed */
+	/*
+	 * Give back the URB locally if the TCP connection is closed or the URB
+	 * is still on priv_tx (not yet picked up by vhci_tx_loop), so no
+	 * CMD_UNLINK is needed.
+	 */
+	if (!vdev->ud.tcp_socket || !priv->submitted) {
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
 
 		spin_unlock(&vdev->priv_lock);
 
-		/*
-		 * If tcp connection is alive, we have sent CMD_UNLINK.
-		 * vhci_rx will receive RET_UNLINK and give back the URB.
-		 * Otherwise, we give back it here.
-		 */
 		usb_hcd_unlink_urb_from_ep(hcd, urb);
 
 		spin_unlock_irqrestore(&vhci->lock, flags);
diff --git a/drivers/usb/usbip/vhci_tx.c b/drivers/usb/usbip/vhci_tx.c
index 32e6fabccf72..997db6cfa382 100644
--- a/drivers/usb/usbip/vhci_tx.c
+++ b/drivers/usb/usbip/vhci_tx.c
@@ -40,6 +40,7 @@ static struct vhci_priv *dequeue_from_priv_tx(struct vhci_device *vdev)
 
 	list_for_each_entry_safe(priv, tmp, &vdev->priv_tx, list) {
 		list_move_tail(&priv->list, &vdev->priv_rx);
+		priv->submitted = true;
 		spin_unlock_irqrestore(&vdev->priv_lock, flags);
 		return priv;
 	}
-- 
2.56.0.212.g129ede20d9-goog

