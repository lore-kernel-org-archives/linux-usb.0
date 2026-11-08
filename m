Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145220;
	b=2LBh2Rq1DWXV0EvUIQrYZH2s81XIapRgRdjobYsGevUKWLgwd2Mn2v0PKdMmUkfbdTEY
	 81gK/0Ygy+9SL9rZdbAiEFBUIFfWmLF2iRG6L7OGvtkCfgYQ3E4f2TMZd3KzdOgl3Ldwz
	 iCzBdsuMsiWX1E2ZOMFqIMiFriYnx+zhVX5yCrOECOaEKG7IGbTwP06nnfVCfQbZvz7pI
	 KcY1U03IhyCmv3FwMwYjnEAuhZvf/2uFoBtdZyoZs8X7ePwUZw4X2DKvp8e6ga/0AMWAo
	 eJyzlggx2L4gAyj3GUqAhZpuyClBD3/nncQHidU6bqOrr3vWEwS1qGVTvLoJXBQRm7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
	b=h4YR/ke4IiMcjNiyW2JR48E1PFOVylUtmtUdDlYTcgZPVECUXNEVkf8hgKCgohqRMgrD
	 /8V65i741xeuL8kuz5EMbqZYDNXh7cBSYgAn7xb0Ub1vb5Edw2uX/BzFrr43FzszR0CX6
	 krpxuvohgQvPVxUganHrfkfUYDOb2DjDgFvki4yjdRDgN8uVLI53795SvSpyz+oBXNNoZ
	 +nuTo/n5djmE/Co6axRfnq52oVLeCDdh9YlxXPnFpEwqk1yJYGM786r0ee6LmbLWelRRJ
	 02BMZ+DxG0q+5TumGkV6685vPKdvK8BxmVaAFQRPo0RLlW4s57ZvSNxIFjvFPOpWoGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e16XaiZe;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB79606A321
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 13:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e16XaiZe
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so79867c88.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145219; x=1794750019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
        b=e16XaiZeLjFiJzZ4yWhuC5nleaQjirotE1wjpBOurW+JbGOwqzoNfQSfBcGaaRSdJr
         WEFfUvrpC7ZMcYDJlIQZ3V819iVTpYG+QyvktBF+D5mgtRhwv6VQAaup4bo50gRa00dw
         fNeO8B5WXtACt42ECLy/r1lGXAR0Ixn2GUhc94tNH+do7lCgT+1BtTg+H8S4dHFwIt/9
         4/iZ+H7GS4XFWrzdltdv0gpg/6k3TYxjdeC7t3QKmKTSs/ELPBoL6o1scxNQavayR/aO
         HDRkiJbuaL1gQoVtIAIpRGbu02dfCNX/UEnLKd+AD69KYYmRIMT+gqqXu21/XyGKSwj5
         psaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145219; x=1794750019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCa8+1l9l1LJd5eY9Gi4hJK+TGF8pYWhbphz19Tl5cE=;
        b=Ep+KK/GfcVxQdxT3tSmJB5RMg5GzwlEukzRrq31xmccjmvdkk7Pl/7rQXXQusl0gma
         VMZ27dkgOEG1XDA32SfShUooPQUoq47LbqFjqviUQ1H4idHFsoFgCoxUTzOm2ZJ1ETlF
         r4h4DTnEoZhoVzCBmaXWIlavEqsDLtdbVg4zQNOPHl6deSJVc6xOC2+IAHE2PziyiOsv
         JMtezIlCZIqa8ATbZkatyprq6rEAeuVK0cze37eKp3Z44wMOK6z7ryQ2JX6b6F2VTdXp
         DiBnV1H0TxxYxb8+Wymjl2meoBQcy7UJjdwwY+7E4zNG9kHj+28i0cwDO9n29JlJgs7S
         C5Pw==
X-Gm-Message-State: APuU4Z+V8bI3HZIp/ET1kUT6Sab/2BpZoZOezAYX5SmDeQlDLaDeu9bH
	1xp1rpBwM82JJXL/xY6Lms00y16SKN+qQjVM8OiIfDs4p6AZ/0h6ZhsBz51U6ALI
X-Gm-Gg: AYBFou3lLbEtJ3IRZG1kYojqmVKpJO3fknKAEhqyPZ1jITnTPxLDn7BKsttwpzzywEi
	vzXsotDoW15wbhtN320xRjUJjokQs5rzmIt50NJIfaBe5FTjSn4DD9HnJRcKbSKexzLpDZqp2w5
	01kl/BOppDTCGyy5zqgFQEjWz3J14JTChSbBpBB9n6MuJBsMOE0VSI4e9zl78grY4CTE5rX7N45
	3tFvtabdYehud0mTxvm7tSUfm7BPNsn+hmHHmcugNEitdF6SRAJozoRd2MO/8DnNeRXDMM3HZY9
	wnegJja63V2t1h0Gp8yjk5LuJPpn2SkmdV/D3nEWBvbrSwOol6zP5EhrmHgX7zVE1pHX+IJoGUo
	HQi9r7GIdaeZHmhwTfWfF9ZrnJhyUWl09Du5f0DcVcTh3RDWZGIC+q61fmywyJfBDsyK/Oj7q8h
	1oVtkrOWrLpwNHLNS0XBYgkDp2EdlDilqANgDXgdXEyoIZduUgT6GNDMnKv1ioI7ZM3o41axP9y
	6rSpraQz7jcvJD7LKGHWVDK3d8HkltODP+rso0QGS3UcZPk3GUVicrEqAZwSNPJ/agGIpmHJZWl
	rtnLEO9Xfw+k/062X8UomhXjtS+pJ6vHaxagwcLSEMaWQCTi
X-Received: by 2002:a05:7022:ea86:b0:160:6a5b:7edf with SMTP id a92af1059eb24-1b39ff1124cmr2107985c88.44.1794145218579;
        Sun, 08 Nov 2026 05:40:18 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5435920c88.13.2026.11.08.05.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:40:16 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: phy: cancel charger work in usb_remove_phy() to avoid use-after-free
Date: Sun,  8 Nov 2026 22:40:01 +0900
Message-ID: <20261108134001.536207-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

usb_charger_init() (from usb_add_phy()/usb_add_phy_dev()) initializes
usb_phy->chg_work, which is scheduled from the exported
usb_phy_set_charger_current(), usb_phy_set_charger_state() and the
charger-type detection on VBUS/charger events. Its handler
(usb_phy_notify_charger_work) dereferences the usb_phy (notifier chain,
dev, chg_state). usb_remove_phy() only removes the PHY from the lookup
list and never cancels chg_work, so a work scheduled just before a
provider unbinds can still run after the provider has freed the usb_phy
-- a use-after-free.

Cancel chg_work in usb_remove_phy(), after the PHY is off the list (so no
new work can be queued) and before the caller frees the usb_phy. It is
done outside phy_lock since cancel_work_sync() may sleep.

Fixes: a9081a008f84 ("usb: phy: Add USB charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/phy/phy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b935..caae749 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -731,6 +731,15 @@ void usb_remove_phy(struct usb_phy *x)
 	if (x)
 		list_del(&x->head);
 	spin_unlock_irqrestore(&phy_lock, flags);
+
+	/*
+	 * The charger-notify work, scheduled from usb_phy_set_charger_*()
+	 * and the charger-type detection, dereferences the usb_phy. The PHY
+	 * is now off the lookup list, so no new work can be queued; drain any
+	 * work still pending before the caller frees the usb_phy.
+	 */
+	if (x)
+		cancel_work_sync(&x->chg_work);
 }
 EXPORT_SYMBOL_GPL(usb_remove_phy);
 
-- 
2.43.0

