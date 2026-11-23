Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436988;
	b=L6zKRzv77sPvKqmkA/z2p8sKIJtD30BnlONddqcrs6LCHKch4p3+9kEDWIX1dtH1TvEd
	 8TOBEv/S4UwLoJxS/GsnoYwnliVm2q/eKfXHyn0ss9GX7jI6SE/+Ss5OHbzTMBNLCH6eT
	 dODggUabucHO/fA9HnCEoILYhjMcbNgd9Ry5FB1AgnnjAbstEb3rtz851eucIiqno3wOf
	 /Ti457EGj1CmN9dUbLVExiLCbG+BEFLg2JYgtJQHl9TuW9D5C1dkbWyn9BTytklovAeEo
	 LmwvVe8o/n10c4JViFYRw0pNHHh9kyMPuEONqTeQOgoCLmlr7y9tGuiaj62edHzy9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
	b=YGNuFgnbDnJA99G/Y+GDwNEmnapCfGOMJ+UguzEsLBrMl/R94/sxZInJAB0ot+PekZ9w
	 l8KSPRYOwYEjXP9+uZCETRbuHGm4/2Pwv++3EdRybhWGG4ZgNnfRcdaS+4kGAb2TzAgtu
	 RXAubR2InDA7Ap21AwreChg2BwRMMXSdJ+y7kejDGdGJVDiXSw52kQQAG+IY0w/vBenPU
	 g5AIlNB5CN01j8IF2Gg2xQnFz5DFUiFgsQ4oSDkh39sb0nJ1aCkUh1CSrllC2Bc9u2SKK
	 N/mWiyC1c7lAgbec+hiKzNJm+EqDZhh8wXkRh9tB4KKlW+QTp1m0v9tkpEkaMNbJF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S9mxk1Cf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF4606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CF4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S9mxk1Cf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so6707832eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795436987; x=1796041787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
        b=S9mxk1CffP850RXsElPIQgIWz13kTlptKeK08NsKnfDE2zzBu6X+eU9z7o2jeoF1sE
         jUr+08cJ7om3C4/Lz67uJcbckAHUW5UfpVVEcDv18q/mIHX5dy8Td/4+7XbkW5z8LcYh
         nEsY7cDdtFHl9dIS+uHpI1YOAa/23bPhXqgsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436987; x=1796041787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
        b=VkDtg5w8OwT2VBUWfQz5qOlM1RmzbZxyL9UUktqKiDCSBjJeXIeVhhTI+M1fp4Am46
         ZlPpLomPbqncAqDzfIdzryktc5fRMdH6NtF40syNqhvBJdYytWLZjVrEm8jIi9E1s1qn
         6Gyl4FOus7vW01yOaIa0/7GRSTNKwqr4soDM+bGf5yXP4jpeoscTAKasu+QmiZLwN0vP
         wO83DnJKmim8d3jGPnaxlmCzkkChjNNxkeuSE0xx/dFU3M6QozqfJx6dcNEzYAlwbbrW
         5mel82KgLy7NdKbLMLlZRUjwqy4IKYBPVIawABozTfcNu5c4bL2WrOAl1ck77wAbEJ9n
         9oMQ==
X-Gm-Message-State: APuU4Z9Dnj2O1VKvjW8d7Tc47h15D4f9fWD3n//jUE4ENJdqzd2xA9y7
	5yqEncEfL9SbgOhdqTQUlZurhHMt6CUneztQtLZFQ9/+aOJ8zO+9j4OtZGTHM7voBg==
X-Gm-Gg: AZFdTZcyTeuUGmme0keFSIuaMucKWiQxyFE7OeQVOaUmHxI+avWQI9NE+AORLAaLmqA
	re+3KrgTs2gC09nK3OK1ljWVmWb+QlnNxOzO8jcsxkj7ojy+B5DSIwQq8FSpcUdfDgaJA0Q5nO+
	6Mo5rgPhmn3ushwKLNMObVZHMhVIDNpqAkWtaW6YIBC0/fSgBkBNEXo9QzEBiJN3kf6+NpSbxFh
	T1Q49ywpnkSjIzuJ39KL4VZN9FKMPZe9IeUGIaKB1hIWawoLAoG9CbjNd8c4B7Ft3EewFPZNr7z
	YssfouUZy6mZQlNvzeJjoYEWd4p/2LcxZY9jh10kCVbokk+5dMU62V+eYnqwVTibTWfO7/UXdJH
	p8o4pmxYdva3JargWkD1gmkpjH5ERMwRoLbQnGympcAmWdaxIDjzMyZfipUTIERYgokmNseg784
	gH77gN1dpxTUknzMIs5FmvhIu5A9oOq1KGbRCl054h/OYGCFLWnXMlQ4hscGfeaT+rLe59l7o2F
	1FU7O1SEBY6L0fM0tgPN9OPGng/tspkIpvn+KE/UiZSbGZGyeoaNlhZTItSjKbxY4fSy4KQ1O8X
	ucBSi8eL9ypmuUEdR9iJl51ftK9ND2DTpLFcMnciPfsvaoPYUaa+p5iY3dnVX4/9tn0IM20jiVt
	ZqjCCMk/AxsjiSC/C3pM8Cxg4L842XuJwpA==
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr14979380eec.17.1795436987509;
        Mon, 23 Nov 2026 04:29:47 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (55.239.81.34.bc.googleusercontent.com. [34.81.239.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32810950eec.13.2026.11.23.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:29:47 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Google-Original-From: Hsin-Te Yuan <yuanhsinte@google.com>
Date: Mon, 23 Nov 2026 12:29:39 +0000
Subject: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
X-B4-Tracking: v=1; b=H4sIALIxBGsC/x3MQQqEMAxA0atI1gZsxXb0KuJCNNWAEyUtIoh3t
 7h8i/9viKRMEbriBqWTI++SYcoCpnWUhZDnbLCVdcbYGvVnGovHH2VPHJgUNcmG3rW+Gcm74Gf
 I8aEU+PrGPQglGJ7nBbvO0q1tAAAA
X-Change-ID: 20261123-r8152-pm-notifier-rtnl-76975ae76f7d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 hayeswang <hayeswang@realtek.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@google.com>
X-Mailer: b4 0.14.3

If an r8152 Ethernet adapter is plugged or unplugged as a device goes to
sleep, the suspend attempt and every task waiting on RTNL can deadlock,
leaving the device unable to wake up.

In commit 5ee3c60c8d3b ("r8152: fix the wake event"),
register_pm_notifier() and unregister_pm_notifier() were added to
rtl8152_open() and rtl8152_close(), the .ndo_open and .ndo_stop handlers,
which run under RTNL and take the PM notifier chain rwsem
(pm_chain_head.rwsem) for writing. During suspend or hibernation, the PM
core holds that rwsem for reading while calling wg_pm_notification()
(registered in wg_device_init()), which takes rtnl_lock() unless
CONFIG_PM_AUTOSLEEP or CONFIG_PM_USERSPACE_AUTOSLEEP is enabled:

  Task A (open or close)            Task B (suspend or hibernate)
  rtnl_lock()                       down_read(&pm_chain_head.rwsem)
  rtl8152_open() / rtl8152_close()  wg_pm_notification()
    (un)register_pm_notifier()        rtnl_lock()
      down_write(&pm_chain_head.rwsem)

Register the notifier in rtl8152_probe_once(), and unregister it in
rtl8152_disconnect() and in the probe error path, outside RTNL.

Set PM_NOTIFIER_AUTOPM_HELD when rtl_notifier() acquires a runtime PM
reference, and drop the reference at the post event or right after
unregister_pm_notifier() only if that flag was set. Otherwise an adapter
probed or removed between the prepare and post events would drop a
reference it never took or never drop one it took. System suspend now
also resumes an autosuspended adapter whose interface is down, which
rtl8152_runtime_resume() handles.

Fixes: 5ee3c60c8d3b ("r8152: fix the wake event")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>
---
 drivers/net/usb/r8152.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d3bb7ee9c9bf..fea47a892414 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -792,6 +792,7 @@ enum rtl8152_flags {
 	IN_PRE_RESET,
 	PROBED_WITH_NO_ERRORS,
 	PROBE_SHOULD_RETRY,
+	PM_NOTIFIER_AUTOPM_HELD,
 };
 
 #define DEVICE_ID_LENOVO_USB_C_TRAVEL_HUB		0x721e
@@ -7077,12 +7078,18 @@ static int rtl_notifier(struct notifier_block *nb, unsigned long action,
 	switch (action) {
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
-		usb_autopm_get_interface(tp->intf);
+		/*
+		 * Remember that the reference was taken. The device may be
+		 * probed or removed before the matching PM_POST_* event.
+		 */
+		if (!usb_autopm_get_interface(tp->intf))
+			set_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags);
 		break;
 
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
-		usb_autopm_put_interface(tp->intf);
+		if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+			usb_autopm_put_interface(tp->intf);
 		break;
 
 	case PM_POST_RESTORE:
@@ -7135,10 +7142,6 @@ static int rtl8152_open(struct net_device *netdev)
 	mutex_unlock(&tp->control);
 
 	usb_autopm_put_interface(tp->intf);
-#ifdef CONFIG_PM_SLEEP
-	tp->pm_notifier.notifier_call = rtl_notifier;
-	register_pm_notifier(&tp->pm_notifier);
-#endif
 	return 0;
 
 out_unlock:
@@ -7155,9 +7158,6 @@ static int rtl8152_close(struct net_device *netdev)
 	struct r8152 *tp = netdev_priv(netdev);
 	int res = 0;
 
-#ifdef CONFIG_PM_SLEEP
-	unregister_pm_notifier(&tp->pm_notifier);
-#endif
 	tasklet_disable(&tp->tx_tl);
 	clear_bit(WORK_ENABLE, &tp->flags);
 	usb_kill_urb(tp->intr_urb);
@@ -10283,6 +10283,15 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 
 	netif_napi_add(netdev, &tp->napi, r8152_poll);
 
+#ifdef CONFIG_PM_SLEEP
+	/*
+	 * Not in ndo_open(): this takes the PM notifier chain lock, which
+	 * must not be taken under RTNL.
+	 */
+	tp->pm_notifier.notifier_call = rtl_notifier;
+	register_pm_notifier(&tp->pm_notifier);
+#endif
+
 	ret = register_netdev(netdev);
 	if (ret != 0) {
 		dev_err(&intf->dev, "couldn't register the device\n");
@@ -10308,6 +10317,12 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	unregister_netdev(netdev);
 
 out1:
+#ifdef CONFIG_PM_SLEEP
+	unregister_pm_notifier(&tp->pm_notifier);
+	/* No PM_POST_* event is going to be delivered anymore. */
+	if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+		usb_autopm_put_interface(tp->intf);
+#endif
 	tasklet_kill(&tp->tx_tl);
 	cancel_delayed_work_sync(&tp->hw_phy_work);
 	if (tp->rtl_ops.unload)
@@ -10364,6 +10379,12 @@ static void rtl8152_disconnect(struct usb_interface *intf)
 		rtl_set_unplug(tp);
 
 		unregister_netdev(tp->netdev);
+#ifdef CONFIG_PM_SLEEP
+		unregister_pm_notifier(&tp->pm_notifier);
+		/* No PM_POST_* event is going to be delivered anymore. */
+		if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+			usb_autopm_put_interface(tp->intf);
+#endif
 		tasklet_kill(&tp->tx_tl);
 		cancel_delayed_work_sync(&tp->hw_phy_work);
 		if (tp->rtl_ops.unload)

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-r8152-pm-notifier-rtnl-76975ae76f7d

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@google.com>

