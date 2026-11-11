Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364354;
	b=LGDRa8AxpuRqx4Yu/CN8mAL69DE6a7F9zIKYgpAsY0f/J77XrH3pSwIvecvB4DZuXhtJ
	 JDQXWVRK4pDdOrhPQjOJHhFFsGOOhcGZSko5MGh9V31HXTBiUiYTsn3O4QJuHYrO/6fdH
	 2sZtsuk1d/xgk4qnAGEAYw4062JM0ef7vHnSWbeViLOpSEm8btTgHoQcMloWjYbUaLgCl
	 nq3iy9PbpdBxpzx+QCA2t2M/gHhuMjk1YXVeydYJmu2LwypZ8QVS8eoAnUbIw2q3hHkDQ
	 L3xkepTnYQ6L7bfI0oHk9Qrurf2DvRH79qw73kOjSHEa1xitNPBJY55Ka6TPSDeOHnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
	b=ZCdCy9UzQClYw41r0nxWbhPMRtqVYj9UmX/J315iHafdGLL5HyvSt2CdIpAhra8l0Tay
	 s6l89/YwI3TC05J6zuTlb6iBButrgBZtjPb/kpN/IdYzuv0eBjckbD3lLPSpbvZA9gP0I
	 5ss1L+NF3mjlJ05qbIb4jGcIfBXvQXPvM8Oo45Mxz7fH1Z/Nv5jFryt3agGUJ6VUW1aeT
	 4gZy+igb13TQ04iMY+//jIESUTpkBtYr6y4XWbAfszKq915spd6j2+dv8bKS96R8Eiiqb
	 QEodIZOGUg01bNe5q0g91cNnB9TCMzaNmzsr+7EPDLRmZXDAYa40+Y1VwQ6T2yDU2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewb6ltT0;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F59606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewb6ltT0
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53ec2cc397aso1436424b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 18:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364353; x=1794969153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
        b=ewb6ltT0oNcgOET9OClEThGLAWDJfZnrUIdUAN8Ir8iQ5AuAS46cbgxdsJ264rm8Jb
         yMqgeKBeF6EdhjGjGHX0FUXsXacGGCpCFtUw85AiH2yL36Vxi7BhgHloWfGQ4aGIpKMl
         kaXaKIo+M8Udnd9mMLGrZuiki1iCJ1r9MZV8vBZPJeOpR5bEQfcrrY/v/oVuGdEy2uOq
         EZrH9xhUnbEIvpYci3SHnAA7/GstkBActbFZmaD88hT4ZThs4HeL4Bo4nyP+16Ggy/2O
         z8AKMjXFgaKfZfUHpuN6bYZiW2gLsWxuy347qCEOKZM+5MFWtYcb9ExpmWEgRxYOwGiH
         8A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364353; x=1794969153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
        b=sqYgmr0XKv1VPMvDHNYXDyOOo9EJ6Sq+tZCcviA124375vztutT7Lyu/cp1poX63Kg
         XStgXyc/KQCL6y2XZ7N5xkHLn+0wxsG8w2FqPRvym2GACLfCETqdZm1NLjjSV/FhkNqC
         jm4mhaDoaXmbaA2Zno9NbTm3src0WxepNAVznpJvoFkI67LGlV1p7Q7ln9gk9hYaWQFi
         jGnVnEhU7OcZHnjSWx5kmuNedkNGJmSTwCsdJ3dcDRTHu2+9QAgIzbHLipbamqjgip06
         sM+CdGMmznNhOQOOQ0g7fCPH8mK419NDijn500WH4Q9zc81sWjohF/qZMffVM7BCB05H
         hEHA==
X-Gm-Message-State: APuU4Z+/yJwTToUZBXzts5rOW3h+cOyuNRzhmpx5uMz53dZhD3dHqFiB
	oKaXBPeX0wA0vdjvFN3WxU+1Z/PH390MVYxw0A2tgAIEU/+Leydx71PTR+ALVXNU
X-Gm-Gg: AYBFou2xZwfcV5aHnb4FZoW0AHlUMskMneaT+QzDX5RotVLPse4KhfnILBoGX4AyElW
	xFULWqdwSVIv9UC70MIGx3jHak9S3hMxZ+pZRaGI4MIApMBGHiXQempnJHK7AoW42NTD9g4ovta
	6v5W2aKPaHjqvOFMRVzAX75VLJfsAmcLWm9Cz4nMX+Tylz+JQufV67r8JxELWKGdXjeyRgWl5Xh
	x4bvfDQAbO8SSxN/s91BvK6PxrzEJ6psQhdMHdNMYIEVRyanWG0VyNmgLTYTcAwlurU4TNlWL6K
	CgvpWu0l6o3neltYP77ewLH6Pw9AWkD9Ws1lTSBLKDK0g1gBk3ZBtQp5VAcHXkzmfSw/TNy00sD
	Cl8J2GkW+du1ne6pSXkolB2jQr6ISlukWI0JT5cV9H/ofnZgwsuMSzp9HNH7OADou6v88GwsKD5
	m7VcYzZbasOlachH/0vRaf0KUQfGjmLAmp0mRAUEdgXykANBuanCyb09YNo+TI1pG6ynauQXTeC
	kSjnUzCKCYprFo7jfwcqZGok8dpp4ROo2HSJJ0RkqhKKmxvxY/mJF9HXQDGR5kZHLzQGMgLEWdv
	/ArfLBWO2Ma48iaanjoMRS1ibd0Q1FY+ldmeTPDl+SEW3wPmhHySUk0b6rxWGXMPunZR7RxQ5Hp
	OU/P2+JSvERatR5mFe+qfiY08QxVKz64rYzn7RA8aEmZR5YCMqb6v6r4z9LGh+loeveevuQaUT0
	KvjA==
X-Received: by 2002:a05:6808:5391:b0:4d6:90d3:e183 with SMTP id 5614622812f47-56b97b1de0dmr793806b6e.44.1794364353319;
        Tue, 10 Nov 2026 18:32:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3917813b6e.3.2026.11.10.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:32:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: snps_udc_plat: use platform_get_irq for IRQ lookup
Date: Tue, 10 Nov 2026 18:32:21 -0800
Message-ID: <20261111023221.70102-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Replace irq_of_parse_and_map() with platform_get_irq() and move the
IRQ acquisition to the top of the probe function, before any resource
allocation. This provides proper error propagation including
-EPROBE_DEFER support and removes the need for a manual error message.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 3687690ca33d..38aa077a56b5 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -102,8 +102,13 @@ static int udc_plat_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct udc *udc;
+	int irq;
 	int ret;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	udc = devm_kzalloc_obj(dev, *udc);
 	if (!udc)
 		return -ENOMEM;
@@ -130,11 +135,7 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	udc->phys_addr = (unsigned long)res->start;
 
-	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (udc->irq <= 0) {
-		dev_err(dev, "Can't parse and map interrupt\n");
-		return -EINVAL;
-	}
+	udc->irq = irq;
 
 	udc->udc_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(udc->udc_phy)) {
-- 
2.56.0

