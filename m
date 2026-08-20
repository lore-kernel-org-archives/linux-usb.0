Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B213BF660
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211945; cv=none; b=iLpVS2iGA6icIhBD7DqHniFeekAQqbjXAd0yXhIIiF2oS+cBtExsT6GSWmn76Sbe0Ll0nsibzEmKW+Ro2ivuOZyk+K52KYUXhogrYDZcAMrH2U44YRfnvPSKRjSZTy3eCf8sVooKQk/DxScTdaro5sxj4KI6/1dYx/ls8gT0qpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211945; c=relaxed/simple;
	bh=Mi6gMMTrdKEbNJ15AQPXdegSQJ+6Xj0ZZ+yiyd1qRJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=niuePoVanLh/m7tIiW/oJcLoEkRY6o1xHoBLy6xmYDMfl2bEFx4linYOdF6NUO6DUS+yNXDR3g8sAJF1drLlBTW/7JSWzs1BYzFdsDNH69+lou3jCRmu8YNXDFOcfupmnQEG1feaiN8ztTRFc7Vrt9hnmc/fjYBGQqTrS+wcjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP6/En7o; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP6/En7o"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1273486a12.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787211944; x=1787816744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFG3aPxSt6p7E5MMT2TB/oV3PiYeyY1S0Plz/2+PJGY=;
        b=PP6/En7opC77lPwBXCeozPk8kjHU3B7dZ8Hxt/ce9M78WRXIAxl/8xn/GALd8f80rv
         J+M3Z4ws7GeqH+vmuqh6vFNFQTdbyo8pCTjgM6fkDXhgkHolvKd2KDCHXHUgcrbHA49/
         a5ZOEyriOKboSsgJ8CMialogt1SXx+MzS63vjPu9NyzgWP/rLj5/2gNMhjXP8hDjhva+
         ic6hSsGLGu9Ia3ycpH7p/GWm6PNXyLCJ5TQHTDWRJ1vqDQ30+qfQBBPDLoEnC/a6JQ67
         nWAw5SBRjdgkqterCn4mrs295lHHV1yAn52KCwyrDwA6sGKyCYqVFkHD+XsH9Akr/3id
         LjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211944; x=1787816744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFG3aPxSt6p7E5MMT2TB/oV3PiYeyY1S0Plz/2+PJGY=;
        b=Ag0yqDpr8nAKlrRxsZP/fBlBq087yB6H5zbraIDc14UsG8LkFa+Mt98/RC64krPvr0
         yxQTl3LtgnWSoeqZiw9yKy8zs9mxCKhdbmyAu5JC9NTLUA6s+03UjBsHuWVzOM3S8pXm
         Ype++jk2EdZ28ADecf1a5AMKF7sHTgWc6Ma90zICoZNNNY3Y5j8a4dsgewwGxYhW5ern
         JxjaKVvB7pi+4yaGtVAPjm8O3R2ue32qXy9MD+pRHPYf3T9xCQ1dHGd6icFeR1tENLHu
         IRPSThGC0vh1PR3Mv1eIv8p57ci4G7URQOliY+hexXmP3ZP448pENISQ5oZqShuhhm+G
         zRFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Y4zTOmAifBRCH7O3KQBWyiutktmz7iE48LRZ03qCqZCc6rltGv63KAFPJtUstD9dfco7lYVRwy8=@vger.kernel.org
X-Gm-Message-State: AFuF++kU3VpDGg4kxnM408IFV6ZDf633EO94KlNUrhWBF65BmjBJ4C6J
	ODr83OVrKJbXc3PGkIEFBh1VZbKGQmI9qWtBEhkd3YvlIOy3khC9BaWu
X-Gm-Gg: AR+sD13bdHU3O1098nopBw+X/Tt924aF1kgfCpCgv+GK65U7OgG4+gF0GbG/wXUBhwu
	D16Ynsev4c1YIh+I9RzXwA7FXnm/oU9jv9d7+0xvlyHsDuylCOlkUMpLOlOEUsEOIA2/fMyNOKn
	jrohM0Byq7/xWyQ+a2GNwTMqbo5JyrWzOYjOUVg9j2InIM1UlO45UM+HquOdT3KG41JQNOR6gPn
	lELAtUQ13NpB9WwjwTZ3Y0E3lTKrN7pkEuHpzRWezmezAD0613llo5eciS/xrLtPK1x32CO2dW3
	esUK/o7OEmrXxK7kEI8e2qez6urR58cDh2QimGcs8JiUSXg8n5jBHHPM5ksQrOxMGkOBv4Ded3N
	B1Tc+tpA1AVmZ3hBz/O5z0mJZ0YfF6Rln0XycV734gW/AFBXZ4k2qSVC7oakeP0ltYok9rqjKbf
	cFBjMSWS8JupNZso0ZyVkEuQXYIlHrybmAGbFPEG+/coQkisogSn4DApWaHLD4gBEUbDyLzkUQw
	VcGQvacgyk8XnDuttidwTro
X-Received: by 2002:a17:90a:da90:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-39580a91ae0mr21482680a91.1.1787211943660;
        Thu, 20 Aug 2026 00:45:43 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad69638sm12848089c88.7.2026.08.20.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:45:43 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: [PATCH v3] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 15:45:38 +0800
Message-Id: <20260820074538.102158-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082048-malformed-finite-4e61@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver directly and skips
device_bind_driver() when the interface is not yet registered, so the
device can reach teardown with dev->driver set but knode_driver never
added to the driver's klist_devices. __device_release_driver() then
unconditionally calls klist_remove() on the unattached node, which
dereferences a NULL klist pointer in klist_put() and crashes.

Only remove the node if the device is actually bound. Use
device_is_bound() rather than klist_node_attached() directly: the
latter is a raw klist API and does not NULL-check dev->p, while
device_is_bound() is the standard bound-state check used throughout
driver core (driver_bound(), __device_attach()).

Fixes: 94e7b1c5ff20 ("[PATCH] Add a klist to struct device_driver for the devices bound to it.")
Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223..4154b4499 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (device_is_bound(dev))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.34.1

