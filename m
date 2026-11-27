Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786777;
	b=XH1APovUyyEmIp26wNfWZ3Y2Vo0Y5DDsqgVSBsw0sV5Y0QT0iCdfQ8tLQc77i5ggpwQN
	 j4sZdimaZsh1WHP+kGj5tL7j+R1c2YweDF8wslzp7fK/bDW+kRuOtGmQo3NNVdXnokpPd
	 O/+ymKIM29Er2izJFgEfodt1dxPb/0iA22dtHGaUachaDm71h0NR9BRnSEwnuIzgDZXdn
	 CK5l4OoLyb7S8xf5OwLLnKOUcC8XgiDiyOCsqkYjPaierZ1wlYVwDR5bB5NxUOFGLB8pE
	 3h9eQw1sC2JI5xdgG4VQrN4KhIOim1wS+8KiXk27njwoOymyCYX40Dyb6K3BlpdWZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
	b=KT5fbSyKM+jspeFXVSJREJmQpBXXDBWUKgnQTsB0zBXQmgV4X2vWM0epMh+DM/VLtU+G
	 oMjGm07BIsQ/QET1tqCqbGKpHv6YwCG4bKZLobn1+kekSdCzZ9nOEcgmhdmY+Y1KKq2pc
	 LckZq44YstxmqJ1M3lHDj8Lwt3EZBGvkON+Aq7UwqqICMoQD8t7AIR75XIPPn/c+2uNXx
	 l0miqyP8Z8HPl6e1ey5l6fthBEPPPFIZud00xu1yVTCpi9KGEGKAD3boHGlRCY5UWWnCA
	 2IP4gSKQcOm7AbDwtdaX+N8Al5CVIxEbtIkbqpk7fYa5MTRshkno8GmPcDPqeGzoKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFmnAQCG;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC7606A333
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AC7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFmnAQCG
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3991448b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786777; x=1796391577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
        b=PFmnAQCGmUDdTMbFjohN5Qw5vbSUu9pJkDMdy2HNY6Sog+4dQa4GU3wUGczYnePJ/A
         wEIjLiXanLNLiHF4IXuj1YwNx7iZFZ0EejX1Rdf0VtDdet9GjOUC7b3MA7uqAAsCuj3+
         muxRDUokbipsylxiOmFwswCuhloPN/3k4YEg6FaJFyM9Tfl+q5d9Hxjg9UD1dIAlnZnw
         x2o23YNO3y7U/6SD4kiY+6t8X3EXSMiNZdgQ81z3dosbd2RXflQLOVPNpWCnS21VLR2L
         p4Wh2LJdXRSuKgkoafexf5yNKJkGgHoiqmZ4kfCg/tBKJnCaQqMhQRY7BdC3Jv4n82At
         26VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786777; x=1796391577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
        b=YlHrLL7J/SBrdDda9twvvCWr1kY/21o7RfmoG5+dCuedTXN3Kk3R3mEb0hDesuSOv1
         A7CxDrDPLnSvqFw7wABzIpiPmpJDFhfAbYvtNGH7QUDOcnLh45/fT0otBP9jnRDqMjHZ
         zbG8qemwtWEUWcPGMbFIiILV+vgG+TItlcjrP4KigWfvFhReIlFkK68kZkA+ox8GKYdJ
         /Bufp3d8pM7di3kFNYtyUgeQwSWsCX9Yu4wLopS72LKSeMXVkoC/8Q5yCvvVvGL/fDtS
         mbJ09MXtZaqfCA6+v302E/5Zpg+fYfrNdqa4Jl4yho7BBdCNiqXKNSor2ozTFaQliRc8
         2uTA==
X-Gm-Message-State: APuU4Z++xq7VPA7KYs4Nq1ZTtbfrGHHjdvDOiwgY5vcfPexl8CXFbHI4
	U5tk/HE0IQ/z5slS534RQqGDsws6SyZ9PGY81h+GJvhNvQf+0m0s2z1o
X-Gm-Gg: AZFdTZdJymNHlHd0xxumq3bZyWSfZz7KBqEJln8PwRx7/i3PNWJ23eol/Hn4HuITR80
	ZWqHb9JUrDDKMO14g3QcdvFN+xogBGc7nlaJkWe7zJr90AsI/G0QQSuTODXO/DxQFUlJvC+wJ6d
	uB8VjnbO1ZvESDzPhLx6nfo52YOzVhsavT+Jk0wu7zCBYU7VBI7dUTHFV3PSwvBJyEn/8gqe59f
	72et/EK4xECnuGdhgPKSWayiw+1STJ8VaBTb3jgOxmjSJSJp69+9kqHh5jbpWT9v2Bs3AEa+T9Y
	bSMCwg3AVGrMDIIjW1Tdxm/3MS9bRb8QvxUgcKF5AklT5XBKvJCeIL+olnyZbPaGNd/hrWYrDNC
	JeRDwDw1w65yhdjT1NglhDFDmO0k4oVcIb9zhLa2fTV4b8ncWl7SlvRB5ZeMaDO8tWRusQBZDQt
	A7Vk99GD0OUE6NjAG8lKs5W5W7T6zUL5VtN6dadmPIuau9nRue+jLbVAh8uuLs6rFpiJTNpzgv3
	kpDCBidCy+vzq5O9LsSutIgK1x8fpD/bm3Fz9M37ewBtaRjFSqHinx0vBgiWSCJevL4na1IxHVw
	pjCOOB02Y8XI1Pcyp1HLqdPNUd+DmeB6qzMpHAlzGHAD+DmAk73Jw0YBUaXh50Ekq2IGV0GsBLa
	RyecNrDsLjRMTPlmo3FHr1aeIoO0dtVbFDwME5Wz0Q0wv7vlUCh/FahlYia6p3dqreZDYDkb8S/
	TPVhWRnrrDbQKpI+dv0o5FK0h0uDS+wH9sigXgw4Bd0t8YqkJyl30OL43VSrxd
X-Received: by 2002:a05:6a20:a109:b0:3e2:a47c:9eb8 with SMTP id adf61e73a8af0-4014d360003mr26313617637.28.1795786776717;
        Fri, 27 Nov 2026 05:39:36 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:36 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: phy: twl6030: clear comparator on probe failure and remove
Date: Fri, 27 Nov 2026 21:39:23 +0800
Message-ID: <20261127133923.1452-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127133923.1452-1-luob87709@gmail.com>
References: <20261127133923.1452-1-luob87709@gmail.com>
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

Neither the probe error paths after omap_usb2_set_comparator() nor
twl6030_usb_remove() clears the registered comparator pointer. Because
twl is devm-allocated, a subsequent VBUS or SRP callback from the OMAP
USB2 PHY dereferences freed twl memory and may schedule set_vbus_work
after teardown.

Clear the comparator with omap_usb2_set_comparator(NULL) and cancel
set_vbus_work on probe failure paths, and clear the comparator at the
start of twl6030_usb_remove().

Found by static code audit.

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index b28a94b..5ea0bfc 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -368,7 +368,8 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	err = twl6030_usb_ldo_init(twl);
 	if (err) {
 		dev_err(&pdev->dev, "ldo init failed\n");
-		return err;
+		status = err;
+		goto err_clear_comparator;
 	}
 
 	platform_set_drvdata(pdev, twl);
@@ -402,6 +403,9 @@ err_free_irq1:
 	free_irq(twl->irq1, twl);
 err_put_regulator:
 	regulator_put(twl->usb3v3);
+err_clear_comparator:
+	omap_usb2_set_comparator(NULL);
+	cancel_work_sync(&twl->set_vbus_work);
 
 	return status;
 }
@@ -410,6 +414,7 @@ static void twl6030_usb_remove(struct platform_device *pdev)
 {
 	struct twl6030_usb *twl = platform_get_drvdata(pdev);
 
+	omap_usb2_set_comparator(NULL);
 	cancel_delayed_work_sync(&twl->get_status_work);
 	twl6030_interrupt_mask(TWL6030_USBOTG_INT_MASK,
 		REG_INT_MSK_LINE_C);
-- 
2.51.0.windows.1

