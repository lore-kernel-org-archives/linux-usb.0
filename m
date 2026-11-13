Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562114;
	b=y31+50/THRzUrt8Lpv+Rf5UTJL922afdomIEzJ9bYbz7u+Ua2pVXN8UBO+DMHsXbXXsA
	 f8AfCrgpb0XQ0kcZh/YRYwt5y7wZQo1Ok2euWUlhdbnkxT4u8QMK82P++LsRhUPyXWVn9
	 D4WUcejWDjdlrcfWcYCcc1Viv3PugCkgPHOMhDUzTUL7BiKbiHzxqFK51S2FyEjbhTgFu
	 xEbdCbipm0UUDpCQAp0VWntNpoAgqpFv79AQVyDKpnIW1oJX/jFTKyhku3jiavkdhAZUu
	 O2PAOnC6GBbtqGEDcvb5j2ITEzKb5DZKbDQ1lr8+9mMMy01tKNTKdM/oFdNb+YCDEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
	b=5j/7R03I4yN3jwiK16hQi4oqQ3ObytU/hd9aqy4Q0qagcGInYXgC2H/3Z/Y6qENpG+a5
	 jUjnw1IjjyJ+b4tp3Ms10KhtqejyEDOeFLIU9wfqkH1Z7xcVYwtFYdMXKgypI7T0stf8+
	 z7JxtVztRb3vJwsjfl22onS9wdNB8Vk/23RIRz3XZsrV3AUc3zbOZp9NYKtHQCGCvoWRi
	 z8E/JHPFuHvw+gYEzEpMcYPepL9tF5/caZTlqmYr7Q5ow6bgq1iwYueWxoCj1t+mtQWsL
	 beCUazux0G4vMPZmB3VJA6CYoiZXLDqScTtLSlgxIQ4vlzYM7XXOckWbubtuUMtJ4gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q5Vt0trZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B58606A8A5
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B58606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=q5Vt0trZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so10178515e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562112; x=1795166912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
        b=q5Vt0trZfvLnmCAMy685XlMF8Sgzc8zIOdLenZ1/hP/etBFFcqhOdah0kewkqNk0NA
         7+UnoOybnDbu+L+Ie/ry5lLK7SOxg0NIMSmUB7C8oPoyZmoEEgEhGxq15hXPGqjR1m+g
         icP7UQ05syVb+njAUPB0q+6FQkYijC7JENjGPIeGyjRdtioZrHDKHuMItFMYiGLPFC49
         wo0JzVizW9+bWdCAJyTNx5MJ+Lcg41RtXJrmNHyLvayyig6lArwdcNd24MBreABX/OOv
         mQZVJYDf1mUTmk1+ECFahtklS23nsZqZhLNGU5SYLmSvxZKskUgNrOchmfkWdkSAKsav
         YSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562112; x=1795166912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43yWWZyKZxLL943fJmckISRhVcHPAZlt5NChKw4DoZg=;
        b=oaKAybyNP3OFoFZRnuf23xhtEpO29ehXGVt7Hw4DTNTS6mF7VKFrq1uY4qT5iacWTI
         kGSqT9arpDQ0DyUl+PW6wWJNH0jO4dM6J3Vux65Sg/TcnZkMa9JMDv7XtG8NeICG8dJG
         v1wZcU3c3xrpJFlWCTQ4x+mkIZmSyK42EYjNZ2kSM7WKm5ImgANPLZR5CEHave5Ehk3G
         timXidZ4vMjS6maDT3rlWxvdLPH1yzMsuAFBV/9Br0v0av2RHSFlPTbPr8zmNSsMn5Zr
         SXXCAiM0e6aJOjoyevcxqGrK2vCAFHV4S22N1d3wpl+KEsT9moIeQEsvaHbvryjGZaqW
         KPwQ==
X-Gm-Message-State: APuU4Z8/ripC4xVUcq9Dl898Wo47P7/22TH3s6+2RIzIDSCkTcRLsF7T
	upxvlf6Frgod4wAeKvuI0cwQRQdhLyXcpQ/E1BOn+fCkt6Pla+61UJmM3iefiXVT+xY=
X-Gm-Gg: AYBFou39LPlYHoXzIrQZRCbtcf/qyEufptmpABt7rloeJGZj+MWvXk/jMFEwXfujZi8
	uDfXY1bU6U/sOgi/4Tc7k3cEVzEplTdMReNly6+T0TDvIE8kek6MezqbHY8paXkvImN8PB33t3g
	B+eK+JqG0ewc3HTpx+Cuq9cSl6KnuLWNd8BfNE1UuYtoai5t/9EwyPs2XwJIFh6eOV3CKzaDY3F
	s10bCKEuobGYNYBavIIWDlUUDWtYcrHBklWBNfnRLL/unMVSHljPhjqJecLGeWWOkFB+31qdL19
	6Rg+j8vafXkuV62kvUzOrwIqKJksRHqok53W3qJvgSbNqMJd4AbYRJDE8jCIGFSfpu49cNzf06M
	RGaSP4P4wdoD7XvB3dm7MM3Bb5xpb4hA9Za0QEa7PO+XiUvIe39frfkLLOo+0N478UlpMKzP8kZ
	pB3nFTeHuBht355eKIl7op9NobmGetYMVN1Qd8qMJ0x35SBNSJ7NOlnWrUMXkWGM2r9lkKGkuFn
	s+4RUIMoLHVONXxSXRMY39Yt/ZKRD987syVku3Ov4aego3a+2OeZq2m0G5t5FRuy/yL+ssZRaFu
	gSX1jibBYy+i1UrHknsSMAcR9HK+JJCwJSjuNnHHEMoRaiL0+xLfoTQuhBoUq/tV2O1PUotOaIU
	Xj/nPdB3+cg==
X-Received: by 2002:a05:600c:4746:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb55a6a642mr39933945e9.11.1794562112021;
        Fri, 13 Nov 2026 01:28:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:31 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:17 +0400
Subject: [PATCH v2 2/4] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
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
Message-Id: <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=alchark@flipper.net;
 h=from:subject:message-id; bh=jUSuOPZ5eP9kIS93BTpZx28qBcdcL0VZ+bTNcBWSaf8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2FxltH31pUmZzfFfrVPGX29IY9btkScfZk5ZceND
 4cCdVkOdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV0Z6MDP37DiR6x9dbRB1c48jxO6fQ4XPE22MvX+xoqa5Rubj0YAojw2mL6Dz
 t15VsZkoaDXd6DG1fOjVmT/r8ScQonv/Uo43LuAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A gadget driver deactivates the gadget through usb_gadget_deactivate()
until its functions are ready, so the deactivation means nothing to the
next driver. Yet the UDC core keeps gadget->deactivated set across
unbind. Only configfs resets it, from its own unbind callback and
without connect_lock, so a legacy gadget driver that unbinds while
deactivated leaves the next driver unable to connect.

Clear the flag under connect_lock once the driver has unbound, including
when the bind fails after the driver has deactivated the gadget.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 577bc15f61a1..84dc0820c2cb 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1647,6 +1647,13 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
 	return 1;
 }
 
+/* Forget the state that a gadget driver left behind, so the next starts afresh */
+static void usb_udc_forget_driver_locked(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	udc->gadget->deactivated = false;
+}
+
 static int gadget_bind_driver(struct device *dev)
 {
 	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
@@ -1705,6 +1712,11 @@ static int gadget_bind_driver(struct device *dev)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
+	/* The driver may have deactivated the gadget before failing */
+	mutex_lock(&udc->connect_lock);
+	usb_udc_forget_driver_locked(udc);
+	mutex_unlock(&udc->connect_lock);
+
 	mutex_lock(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
@@ -1734,6 +1746,7 @@ static void gadget_unbind_driver(struct device *dev)
 
 	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
+	usb_udc_forget_driver_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 
 	mutex_lock(&udc_lock);

-- 
2.56.0

