Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C52E975E
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791153550; cv=none; b=cNFw19iKPC0tMuKIOmTTkM7jTMOJKhvgalCpX1iJCr33vJL9ss5eghWYC54zb/hcZEaOHrxckgSXOINVUfn9iSjr+AHDZfRS15xU4wBsgLO6SVfXNlOoKYiiO/7o6MYAc8AB5gYwlJ56+90TrVR/X8SoIV8Iv5ee9IHxMPfbMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791153550; c=relaxed/simple;
	bh=kpfoFP85QxskQMWdeJTmn1cMu6N17HV/5+t0UmRxMyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XEGJZXyZmqm/hzPJCft3XBE9KtRTFwQa2+DIJP7snWEY1uiVwZHYd0bZhp7lzfOP9XQNBw+gfrp4T5BiEbWN1ODxZBcSxdjosgzG6Wa6z9e97I8yVKbB9GTw04YAbMHxjoLW67WPcvGT6h5XIZbulgp9XrHHRUs/V9OciUbjFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bThpFflN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bThpFflN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso944211f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791153547; x=1791758347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCS9VK4fVIFomf4fJxIO0n4SeDZ0WR6fIeRqcF0W94c=;
        b=bThpFflN/QNVriZxgcZsBD/dXosCo9iDrB44FDnmAfJZAOxZ/ueNph+KJ3SQAVKyef
         k1d+qBLIV1iX8PCykD+LFjoIxSklEuI8CuFC7XusQt81y7ST/YhopJtl0U4p7DsM4wLl
         SOCNNCnEh1xWn89LFwmk5YDgFVrIRId17PUZ1WOT95/3jM2jJ+RinwTadEiODDbuFUSt
         9fkk3vsjI4o2dNlQCBtbimQOWK3QeVSkP/B7FMyVUrJQTtaYvamIuynwSTcckcirtGVv
         w+mArk7GalQ/ssiy/IMVA5vRoqOr7IIzh306lnHs9vT/CfIGqZzO7aeOMBEMZIm40qFc
         qIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791153547; x=1791758347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCS9VK4fVIFomf4fJxIO0n4SeDZ0WR6fIeRqcF0W94c=;
        b=s/p1OM1tOh9VHWaQTpfY4HDR/QJtkcyEaGq0KD76IcM5FPz1HJdcSbQpGreAS4+rbb
         VqyHT8mHYluMgC4amq/LAJ7VvTeIUKM2npk4mCxhpevOJ0UxO6OBkkqSwO5GKzL25nut
         CXhu89ySSCUocnqgG6NkiJGvT7OysZwhIOj0625SRD+8NM0GJOXNPyrGs9am6m12V7DZ
         77zODXkiQz/Ng0Vexn6P2VTwuc0Ausbji4BqDEsdQ+SWwaec2wn71XYJyjtsKmoiItxp
         vU6NUpSJuuZ538A2rAIlchJ/vKTGLahtCh7fDRPyfBawWEp6GymUbclXwbsFQEf1sjZj
         8iTg==
X-Forwarded-Encrypted: i=1; AKwUvByexmEpfnPC9tpPKrpTI6CNOswc2dUyocv+fsMqgHzo4ebWpcUzlk+xJCtAwtnysDfucwLndi7NDJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++laj+1LRk5ZDcBjvpKKHV9dtJIQ84HYKez2GoYuqR7HOBKcGKiI
	LgdGfjg2+IYG1v8NoS9Y0JWIOoEz54Nbx0ysocCouiqxk4tIkBZ2nTjb
X-Gm-Gg: AYBFou27Rsz96Yr7uubKY5G0zDCWnNaCeUSDELnrP0zg2pN4qZEePZz7p3hCQaELKuy
	BU3HwjJvkJgjH/Vi2uAfo8t2Jb+gq52E/FqXdZ/KLA40TxqxfLw9Egp88amwdKKr9cXAQKo3oce
	jw+OvF86P7xGypeSOX3b97ywyalkd+JPKjWsDFpQEedk9BEbb9uoIxMfFeZi34v+FFZLG4bCjie
	LqizNaj4uJmY8hQMH6+kdQtfIfYNHLSDE2fV3AdViSvU1O2gibvpGMipcxW+WNRkPlBG1tavLzM
	SztlwX9AowMrNbYxUugmLKIYd2Rcb46rZpC0RW0qfa8pXxGvz1rkaGCVExpr6SOWz8lTTgRsv99
	4Ge7FKcq4smml5jWwPV5PXXYulLVfFwYxcGUxgSpEtaG3shgzMgHOgW9ICJ4M34sHrqWt5WeULS
	LHJFnTo/0wtzeVBBwMpo0TKKiqFdBIBMlsdg9At/bHvEs/MHigFn4yQisexb23vMVup9rUlk/fc
	sL3E/g=
X-Received: by 2002:a05:600c:154f:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a1714d1071mr31807835e9.14.1791153547399;
        Sun, 04 Oct 2026 15:39:07 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1698f7910sm97775755e9.3.2026.10.04.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:39:06 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: oneukum@suse.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Mon,  5 Oct 2026 01:37:24 +0300
Message-ID: <20261004223852.312487-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_resume_rx() uses local_bh_disable() to synchronize with
usbnet_skb_return(), but local_bh_disable() only affects the local CPU.
On SMP, usbnet_skb_return() on CPU0 can pass the test_bit() check while
CPU1 runs usbnet_resume_rx(), clears the flag and drains the queue,
leaving the skb stranded in rxq_pause until the next MTU change or
device stop.

Fix with a double-check pattern under rxq_pause.lock: normal RX avoids
the lock via an unlocked test_bit() fast path; on the slow path the lock
is taken and the flag rechecked before enqueuing. Move clear_bit() in
usbnet_resume_rx() under the same lock to make the flag and queue
transitions atomic.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 drivers/net/usb/usbnet.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 0288d89e1d13..5eba2cef8bac 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,13 +329,15 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	spin_lock_bh(&dev->rxq_pause.lock);
-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		__skb_queue_tail(&dev->rxq_pause, skb);
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_bh(&dev->rxq_pause.lock);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_bh(&dev->rxq_pause.lock);
+			return;
+		}
 		spin_unlock_bh(&dev->rxq_pause.lock);
-		return;
 	}
-	spin_unlock_bh(&dev->rxq_pause.lock);

 	/* only update if unset to allow minidriver rx_fixup override */
 	if (skb->protocol == 0)
--
2.55.0

