Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747115;
	b=EIwr5tAvjNO5+b0fx0kIrmeBPlfdBqcmyTOV1r3oTIhnNRdFUewUpoJhhXyHgUuT0+5I
	 Qql5nfjmo/ml8WKpRLZLswIYX0QowM/ilyx9KHFWDXIy/dP068DWKv74TiSE+gWLIRY2b
	 ZdBZ/5CO+qMbXAPTeVWgd1Xp3Im92MlNN9Z6nsu2AXsmH7AmP1G3MrKR4+1JxfINdyGxj
	 mmc5Nnk2XlnUziYgXKK32wuy6RGWfq7yHvjOQiZgII1PU37Dl62YH25K1TV3w2FRum4C+
	 mgXhISKBmmBSCFYWtzyAi8CLQl/W8hOd55CNUGI0n/oJt22n2UISwWnqS/VJrkeaMAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/I368uJmiMQcUd4fSptTq+4qLqwAwQeKcuRDLtV6zDM=;
	b=FYDn5xg/KNCP2oq4WziEmbXRpE4/c07U4sHX2wvq1GmXBY2gg2/90oojN2tGjMd3YiE2
	 vQ1Nk0L3NzN92+N9v6X58cd+yokNTp8dZgLAgaG371h6GB/sclXINXdDbOA614MX9JgXY
	 HclbN25Y7fbzA2/kfFxniQozSfPd1KumIMwir0k9MaVUKqflNkPQa7/MSq/y7g/Fwau+q
	 qTit+qvv7L75ggh9n9DadIvCLsLx5ZF4PSlA2Vg350esP2q3aIvxRhmAAb6pU2yNErmt5
	 z7y9tX63q7QYHmOQ4qh61y5nB2vzIuSvHCp0h3X/MgrWl0D2eO5uNVBLJGDcRx/mvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=HOilFSuz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52A606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 09:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A52A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=HOilFSuz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3393015e9.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792747113; x=1793351913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/I368uJmiMQcUd4fSptTq+4qLqwAwQeKcuRDLtV6zDM=;
        b=HOilFSuz1BNQXwoPzPN51i1rKolmcD17IuoOnOJB2ofZMJa34v5aA7eaotmUALAxyq
         dO91dNiBgcSkfr1TVxs4nDX7NjfZNx3oX1vGJ8yu1PyYtejuy1hyYrQGeC0f3/BEsbfm
         d9XX6e0I0SkbTjZgo0AfgQuF87CaBY59YiokT2463ktEqyeYMqH+oXBe9vDYPP26tsqe
         L5oVELiVL3yu4/CjH0+/O7ijAaiw/7Wjpn48PlI2mFcFtKfhiUGm1rXNexQziT7VU2FS
         M8kW4empneJpqrbBt4Y8RJ6Hc1jGJmOji7qO4r0fGknAgnSdVhQz/cpiSAongHvTXLLP
         EzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747113; x=1793351913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/I368uJmiMQcUd4fSptTq+4qLqwAwQeKcuRDLtV6zDM=;
        b=znbQ7aZVI1k/lXYSzu0XPL9HsIjFMyBmQHTBtV5irbkIJ22pjFNhmo+g+Ae10QtsFJ
         fXA2oE4/pt53QnX6YDfwmofdSjVcRKaDtu77j2HudP2PRw+eSUm+cOZERE9fbJMhD3QL
         xrdJBESWijYMLr2hVyhQX+r6ULTV7BXeaIXdgl/w2TWbocGD5HnpM/EhFIpPEw4Q73U6
         OldQ8jgZPxg7gWKJBWqM/3oQK9DtUmPeyqsjwTDuvM7uDH+UwmSv8pa47zIkRxJ2iEH8
         VGGQjo/nbhqVQFgMuuDJG685xqR0VozPNMrGMuukdjHK6RVfwzuW1nEcPEjIDLl67SFC
         vTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQLMLat/W4rVlQRX0n3zDXmJggesPo/W/vMx42GUxS92pzuqOzjEFGpY9BVBMpaJZLtuPzLZRdGqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU3U83codQ+PenP7M3jOFy03ag1117M7OhmkJDZUPwahBmi8l8
	wT0V0z+IJQD1caYJ4e8UCfq0+9ezlri4X8QgyOlVwCiyfSAQb2/aZsmQfwjGSuqi4GQ=
X-Gm-Gg: AYBFou2UhcDb2bGJHL5CpIllwLQcE5dfgfnAZYqqM7QCMLp4LdCaeDv5xxpk4ExgKWx
	g0kTEGlIMfQeCdQQhgSd+bohWhIN/M+2/UCPOhp1KZQse+tFlso2IsBlkn2pkcNMKSfADakxxJ5
	P8/Z6t5B7YZ6TYhEsx+K7tlxNyf256uDfwoRPVyP6IUgswVbt1KouHf+ONFW1IqZWM7MGiKTX6m
	npTwFHkcpFkLbV9RgyB6em/Gz+YLmMlaCk/EykRGDk04U/p607riUwlHUhUFV0kwegOpKTcriBy
	nqikAQabtnvuEOBGg/AtjRCqo/U8c7RD12H6S9VyLzKRdGMhLQBOovymuBaHxPV2ZI5do3caAi5
	/zdAOQ4YAUsf3cQnc14uL1lIgu67VDcrdEFkDWRYIPN7/9PCWgxq9hrBU8VfhyckDfhGQOWvnIh
	vtNlvS3t2LHhrCaB+DRUwicXLmQLDMN4kCRt7ldPKfRoMtq2ZS0jh5AiGGg8S3Yz/OmXPD/wyv/
	IiTrFZ46QhSDX49DgNqLLJ8txkH0b2gT0TG2SS8dSzvFQSPS7JRY5o4EoPXH53HUepO44YdE4rH
	XwM3h44hcrpBxw==
X-Received: by 2002:a05:600d:84ca:20b0:4a2:1364:252c with SMTP id 5b1f17b1804b1-4a21364275amr13460615e9.27.1792747113600;
        Fri, 23 Oct 2026 02:18:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm60865985e9.9.2026.10.23.02.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 02:18:32 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] usb: dwc2: gadget: Restart the gadget when a new session follows a session end
Date: Fri, 23 Oct 2026 11:18:32 +0200
Message-ID: <20261023091832.6765-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

When the B-session becomes invalid (the cable is pulled),
dwc2_hsotg_disconnect() disconnects the gadget and leaves it in L3.
Nothing brings it back, unless something outside the controller reports
VBUS through usb_gadget_vbus_connect(): the next USB reset does not
reinitialise a gadget that is not connected, and dwc2_hsotg_ep_queue()
then refuses EP0's setup request because lx_state is not L0. Every
enumeration after a replug fails with

  dwc2_hsotg_enqueue_setup: failed queue (-11)

On the session request interrupt that a new session raises, start the
gadget again when it is in L3, as dwc2_hsotg_vbus_session() does when a
session becomes active.

Seen on an Ingenic X1600 (HiBy R1) in peripheral mode with g_serial and
no VBUS notifier. After a replug the host enumerates the gadget again
and the serial shell comes back, without a reboot. Tested on v7.3.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Tested on one board only, in peripheral mode. The alternative is for the
platform glue to report VBUS with usb_gadget_vbus_connect() (a
usb_role_switch or extcon notifier), which this board does not have: its
VBUS is seen by a PMIC with no such driver. If that is the preferred
place for this, I will look at doing it there instead. The patch is
build-tested on 734bef548a96 (v7.3-7363) with and without gadget support.

 drivers/usb/dwc2/core.h      |  2 ++
 drivers/usb/dwc2/core_intr.c |  3 +++
 drivers/usb/dwc2/gadget.c    | 29 +++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 767251aa1aa3..3d40eacc3d2e 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1421,6 +1421,7 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2,
 				       bool reset);
 void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg);
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg);
+void dwc2_hsotg_session_start(struct dwc2_hsotg *hsotg);
 void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2);
 int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg, int testmode);
 #define dwc2_is_device_connected(hsotg) (hsotg->connected)
@@ -1459,6 +1460,7 @@ static inline void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2,
 						     bool reset) {}
 static inline void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg) {}
 static inline void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg) {}
+static inline void dwc2_hsotg_session_start(struct dwc2_hsotg *hsotg) {}
 static inline void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2) {}
 static inline int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg,
 					   int testmode)
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 9565e6a52725..836f123d294e 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -322,6 +322,9 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
 		 * established
 		 */
 		dwc2_hsotg_disconnect(hsotg);
+
+		/* Start again if a session end left the gadget in L3. */
+		dwc2_hsotg_session_start(hsotg);
 	} else {
 		/* Turn on the port power bit. */
 		hprt0 = dwc2_read_hprt0(hsotg);
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 102169b40419..8abae65a9838 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4718,6 +4718,35 @@ static int dwc2_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	return ret;
 }
 
+/**
+ * dwc2_hsotg_session_start - start the gadget again for a new session
+ * @hsotg: The driver state
+ *
+ * A session end (the B-session going invalid, as when the cable is pulled)
+ * disconnects the gadget and leaves it in L3. Unless something outside the
+ * controller reports VBUS through usb_gadget_vbus_connect(), nothing brings
+ * it back: the next USB reset does not reinitialise a gadget that is not
+ * connected, and EP0 then refuses its setup request (-EAGAIN) at every
+ * enumeration. Start it again as dwc2_hsotg_vbus_session() would.
+ *
+ * Called with hsotg->lock held, when a new session is requested.
+ */
+void dwc2_hsotg_session_start(struct dwc2_hsotg *hsotg)
+{
+	if (hsotg->lx_state != DWC2_L3)
+		return;
+
+	dev_dbg(hsotg->dev, "%s: new session after session end\n", __func__);
+
+	hsotg->op_state = OTG_STATE_B_PERIPHERAL;
+	dwc2_hsotg_core_init_disconnected(hsotg, false);
+	if (hsotg->enabled) {
+		/* Enable ACG feature in device mode, if supported */
+		dwc2_enable_acg(hsotg);
+		dwc2_hsotg_core_connect(hsotg);
+	}
+}
+
 static int dwc2_hsotg_vbus_session(struct usb_gadget *gadget, int is_active)
 {
 	struct dwc2_hsotg *hsotg = to_hsotg(gadget);

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

