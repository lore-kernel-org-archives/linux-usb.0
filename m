Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919700;
	b=pE8DKz+PYQps0mzmjRzxP9rvcRr4UfI8v/2MtMXs+7a6hK7UZXJGBbJggX4W0QbcdEZE
	 F6hWhu4SfYMqzZxjh2UgmsGIiLtAvvA8Q9glOgHTDBwM1ZMN+1oa8PtDbf1wwAW36z/rQ
	 o04xH28PTv041wZYL0IE8LVVfQmdui9xgasPuZ8rG4jkwWX7wNtVjkTa3UNe9T6dJPxQl
	 IxY517EBW/CkedWXWL5y4KaLM2nmSZE5bvlXqyEZQ2bVlfohclgGP7Bh1qyeqfP6TOiwP
	 lgJcX9Fs7toGuOdTpBVhfwBa1Ph+oFKsDEtf4ys272VriCz0lso3S+kto2bFYixqxWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
	b=K/DznnYVB3pYJhfYLLgEEJxycyvUrRWT6yhnb8zku9yJXAY2yQdC4yZdAoE2L1xT+WQC
	 TaSDOzSimgOC8P47r4LbFFhhtrCpu7F3EPiJNmgfMHakY8nJmRE3j3RsZDxeb/AvUcyOb
	 Px+Vg4rmVSOFu+uJmSXoj8veSWk/jCg90Neyk+ZdKhhM8y9EJ3It6mBUFE40HLx5eFbO3
	 JZw3zzWHilR0OiTmu6fMROBuvPPqMx4pVR7ZA5bSkOqt9oOR3K930EptPlBHyQKQzMI3I
	 w+bgdG8flDlWD2T5WAT/TEE8F6Bb9C6yF3o9J+WpcMjuLkq3y5VZeOqeXITfKUYK2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=On+Gm22K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A0606A33D
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2A0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=On+Gm22K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47954735e9.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794919698; x=1795524498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
        b=On+Gm22KhOREUjhxyN5/8vvGLuJolTVEwVc/7H9pErgg+96xP1T3vuDCXQ+vOKGGtS
         HudyeaNwukfeAiwXrGJQdKHHQ+QA3NrLoGOVhWhOP2BfsyJxdOR2sbkLLhDDOCAvi91P
         CM7rqQX0by+yNIGTvV71CEKaG0F9X07eikcHKQeByI9MmCAjDU8vJH9QDtKlZHRiBCTA
         s5L4I5+vd/UFpQCK1TZRuaoTL842PZJ+UP6s+huNFuYVQ+n+5lsGsZ35EsKgB65YA2qA
         nQDll57JujeBLs3LL8b6Bo7taMgmk8lPY05GrmPMMGyYyBF2PTPjuAOVv/RpqJndtytc
         7RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919698; x=1795524498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
        b=eWs06Bj1JVwHULEF2S445XtVdlILYh6KfDeNJ0tGrGskkTQcTGNrF+IuA44IKqQ+Ru
         uD/fU5m6IEUdFoUSWny8D559Iii8cX7E4ZMA1CMAzCpyXEwSgNBpg4UD9Xo7uzgfSaeE
         1QHmRsXvBainbb/EEWbhmfntHLwZ/L9rRQdp6p7He785fUtoO3sy5vpfJbXL5axsQCeB
         gNB9Z0oTov9VrpwKWSiHf6v402+Y9WiaC2XRSy1XXYX6EYLOzr/HJz1TPSkLXzL0CMNZ
         3ExwjSr9i0jn/qG/lSfM5YA0kQ40Na0mrtub2/DMtffp7rPlHB8JHUSyrfWPe5B+E38k
         L+XA==
X-Gm-Message-State: APuU4Z+e4qxLNb/pVh4JCvZ4pE/UKDDwOIEUyo4HwH5CWua9rvFlN7Jo
	Hs0BIm73isxbMDNRI45GajHoc8kn0/9kk3Xs/sLoWhZQoBTgQPYJ4ZxOZBY6Hlp1bAE=
X-Gm-Gg: AYBFou17QLCE1PUgZaLWma663zbsmiSCiurXqRItxIfM+dhI669F2Wf0LWbrJ0D2Jg8
	DoKBFFRdpb7WYZiisMDgISrT6Xt9um277KMH6DxpYEwUtsxbOcRMJniKbs28a125ejbjQLuPbC8
	wB+AC/LSrm33/sg5hchABi/xkNL8Pxjy5l7X8NAlsIjgRzz1g5jTn7hQ59lepiwJ20mMVjw4toD
	3iKLXpaVT/JdriUV1t9Wmhb7S5X34Sgqvn3i2Cg7M6lgH3c4IekmXvXZiqE7PI0Uo1jPH1dWtUk
	2CYNHi3tSlOZw8Duy4CVzd3q3lEUuBVhJc//p9Z7G3E/m8Wrfut66oHBGO2Woz7HxWMHP1BLwIq
	vVeb1G3uDwav6rfO12FAybYL5zc2+EIFonmcj8gqAs5XPIqfQIKjfxamTXA52hJJyXZE0Nt28u8
	/CSUsik3sbmLmBUUttEHNtTyTM19XAc2WngkIBMWP0jI09zj0xwaADWjs2d7fvaoXJwwAxeW0J5
	viiO/g20RNdWDq6kmPs7C0P6MeVrY/vR95OXuyKW3lurehwWn1BBld1WMLpPu5pNcix1ke0qu+Y
	+hRAQESNy4ToA5BSzS6wXn+iOpfW8xxdzRDNdR64KCLI8DF9Q9i8MtgyVgW5mQZlWg0FAKpPbSj
	yNFGQTA9O6A==
X-Received: by 2002:a05:600c:a114:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb55aa7c58mr226250815e9.25.1794919698131;
        Tue, 17 Nov 2026 04:48:18 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm124029135e9.4.2026.11.17.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:48:17 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:48:08 +0400
Subject: [PATCH v3 2/3] usb: gadget: udc: Forget a deactivation when the
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
Message-Id: <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
In-Reply-To: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=alchark@flipper.net;
 h=from:subject:message-id; bh=lCYNBR/eIWKILRxQZCUTexJRQVCf4nABtu0C5ClnwP0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT98eU+nf699fqlf/MWuYfmvNo19aRxcsymsuO1Pzrur
 zcqP1HZ0jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUM89i+J9ZP3mtY1iU+tHyhLAiw3hJbs/PO+tMJCq9W/lcW8V7lRkZusIMQ/e
 +Pq78M+Sa4bN5m2Ys9//zOc8njnn/xJ0fX94uYgEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A gadget driver deactivates the gadget through usb_gadget_deactivate()
until its functions are ready, so the deactivation means nothing to the
next driver. Yet the UDC core keeps gadget->deactivated set across
unbind. Only configfs resets it, since commit bf95c4d4630c ("usb: gadget:
configfs: clear deactivation flag in configfs_composite_unbind()"), and
it does so from its own unbind callback without connect_lock, which
guards the flag everywhere else. A legacy gadget driver that unbinds
while deactivated leaves the next driver unable to connect.

Clear the flag in the UDC core under connect_lock once the driver has
unbound, including when the bind fails after the driver has deactivated
the gadget, and drop the unlocked write from configfs.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/configfs.c | 1 -
 drivers/usb/gadget/udc/core.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..c0f9e6625b64 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	spin_lock_irqsave(&gi->spinlock, flags);
 	cdev->gadget = NULL;
 	cdev->deactivations = 0;
-	gadget->deactivated = false;
 	set_gadget_data(gadget, NULL);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 577bc15f61a1..449b303c2f81 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1705,6 +1705,11 @@ static int gadget_bind_driver(struct device *dev)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
+	/* The driver may have deactivated the gadget before failing */
+	mutex_lock(&udc->connect_lock);
+	gadget->deactivated = false;
+	mutex_unlock(&udc->connect_lock);
+
 	mutex_lock(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
@@ -1734,6 +1739,8 @@ static void gadget_unbind_driver(struct device *dev)
 
 	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
+	/* The next gadget driver decides on its own deactivation */
+	gadget->deactivated = false;
 	mutex_unlock(&udc->connect_lock);
 
 	mutex_lock(&udc_lock);

-- 
2.56.0

