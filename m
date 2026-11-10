Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310537;
	b=rRXEzYrFgvIVXvvVCeEqJ1ruJAidGjx5ETQrWWb0Cd8IfaxffRNe58IYiSunboAi1OcR
	 66q+UaLwhAEe4N2/NyCFt7gpSQYsdo57t8WwwFhhOya7yuCgcFJpoygr9ondiDxnkVu8M
	 Cxa5NxABd2cYE3WLjy9c/ZlqUIxHpZ8odeEfMen+hzcy7y5JHK6C48737Zi4WKlToy77J
	 jCLHwWhbKK6OLHcd65NRYwhAkXlP6KTA26PVuO8xs0ozlOcKpOEAIAelV76y8ov6rFpgb
	 +uOCMD+L32zcTjW3qT7NdjxdpELNAHbr/R0F7BZA8rjs8AkPrbGXE0SzU/ZH6qlACzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
	b=rtuP2LxQjgPpK8KvmG7g87mp/zwMxhd3c+1bmjhnIOR5r9GrDb4dGBqHtllpUEeT4WD1
	 Kd8aLdaaNJoVNjRA1Epjoi8G+RpsHCjk/a+Ay37kG0QA63oPYoNYJAgAQ2AMpRdE+0pbp
	 txsMUoW5odbMn2B7iaHLn12eX+zZq7Fwhy4PwU/ylUNFKGyiUGgug+WpLp/gUZ7CdTUfC
	 BchlTEqkiw7YfGrKF8/nfA7Ilm3lcz2DE7UWPijzeyUZ52FUxN3FkKaR6w3NlHEzL7Th1
	 mmPSnl9W0exMbMnLfczQxuWcpHx+zD/+zIQjnfJcrSxCJlExXHNpi9ySsAj/q97WnVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE0qWE6r;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA114606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA114606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE0qWE6r
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3856179eec.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310536; x=1794915336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
        b=lE0qWE6rLEzHfNoA21IpOUbmmJ7E2tUdoftzBvHiwSlWedBAdOfuaIZzQyiS7ZKfBM
         k7BPoYeQ4s6Yfajesc/InpK9TbrfkTJTk4lOBh+h7z9AxaMilIfLJtH/OsSP0Gnqslzf
         gRYSfht5DQfLdZJS1/EAc+xGqXXKvNbOpsrNl4yuKM7p+NXGjERwCNvte85gdgJ35G4P
         cW2Fuozs/4KQmL26oyOVulrshCNzNzizyAlJwFUlXJzi/mBUB7jAIPc39cog06dzfPoV
         AHL4jRyPbgS9xQaJr222eTWaiez8kJt5AG++eIDCTuRY2MTNI8NRgSmPjjGMuDBTUybY
         8+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310536; x=1794915336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
        b=FP94XvlkPV1yfEchuiX2M4Bg5MqXQpPCHnTwW32pXFahxXqwAN8SwkDfeWPvVyRAPE
         1MSy6oX973TUTHvCqSN0k5azrI1QWfMXh2fYzyzuZVGOd8uhIQLNjel8aVQavOi5sDxj
         igc5zKNCTdW6Bj/KlZHjciNc1hk2vIJPu66lsW2X5iIotJjrCv4lf9AwB+4Ipg6osLXE
         EtkMfhfQtUVTcckhVrMoUfTHRHKDc3g0TCo8VWVTry4jKvVsU1UHhMFLXZrSTzAp0Ux3
         jY3jWYG0ym+atkyNkPIyN8sBer8p0lRM/TsCFDf/MN9lirWpdJ4Fp2TaifXk2U+mkX6a
         BHJw==
X-Forwarded-Encrypted: i=1; AL+hErGry/PT3UuT2CzmCu/0NGcoTOy8Gad4mg/pHU6Yp9FVWamQbH39hP3s63mUdKZahI4dfRhXRRekm50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/otIHdCI3DKcXt4ppKq9P7YsQYL1Ik1Ek1XsLXK19xiixBwiNJ
	D/4PMYcAL4KjOJieSjhgwFYpBTVBhgN9DrC2lcFJ3P0cKOzD3hV/mFIXe6A09otA
X-Gm-Gg: AYBFou3o0EJ6mR0dasAFqbPT7Kf7EZxuVYiE70VEKOHvIJ43XYTWHr1XPyOjzjbVqVG
	i9pX2c+bh+/11YZHTK6H7JzYGIkkWt6kFfdYB7ECXHGUhUlUYUi4hNj/fcKD5Gz/R2bWwreQlIh
	8z75CtZyMZiia+AziZLk4RYqEXhOEF3Wbz7OV61PIkfiAmYeIibBtB51nLLyJ0p/z3dMPhi7nzy
	FLS+l24/4eFkOC63PyGR+pNb3p66D8+AZj6Jkhjff+zmR3bE38nftaZbPfFb4lUI2d+OeBzsJB+
	b0G/uXShZSmJb8keNS3cwW51avAGOvfWdAPpWdW9+EhPHocfcYIWfp+45FfJBPKdkSKBcP11a17
	blw3INYhrFSwYnVqO0L7zxa5aZicVasdR/WqMS5uNQLIx/i4mb9T0giqv/+JJGlIb+ufeirBTk+
	iCss1qgCN/6hvWszzBjBG6FN5uo+trs4q1m3hLTMsp0ZIq/U1YwHY1LlErqVcYv5c2Cy1AEolbh
	qt0ddVKK2id4AH38dGtZzG3LHDKHNIZmruGh39sb27ldW9hNJ2uouQS0mJjFaTnnQBpj4t04wg4
	tkI/CQ56R3toShOiOcwINsCZTX15+EikQ/oyrmI6NcBvfeip
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4851767eec.31.1794310535882;
        Tue, 10 Nov 2026 03:35:35 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm6098205eec.12.2026.11.10.03.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:35:35 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-usb@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: aspeed_udc: cancel wake work on device removal
Date: Tue, 10 Nov 2026 20:35:23 +0900
Message-ID: <20261110113523.2517891-1-hj351016@gmail.com>
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

ast_udc_wakeup() schedules udc->wake_work to drive remote wakeup from
process context. The work handler ast_udc_wake_work() dereferences udc and
takes udc->lock.

udc is allocated with devm_kzalloc(), so devres frees it after
ast_udc_remove() returns. Removal never cancels wake_work, so a work queued
by a remote-wakeup request just before unbind can run after udc has been
freed and dereference freed memory -- a use-after-free.

Cancel wake_work in ast_udc_remove(), after the gadget is unregistered so
no new work can be queued, before the devm-allocated udc is freed.

Found by static analysis; not runtime-reproduced (needs Aspeed ast_udc
gadget hardware issuing a remote wakeup that races unbind).

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 81fa495..20dcbd9 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1460,6 +1460,14 @@ static void ast_udc_remove(struct platform_device *pdev)
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);

 	usb_del_gadget_udc(&udc->gadget);
+
+	/*
+	 * ast_udc_wakeup() schedules wake_work, whose handler dereferences udc.
+	 * The gadget is unregistered above, so no new work is queued; drain a
+	 * pending one before the devm-allocated udc is freed.
+	 */
+	cancel_work_sync(&udc->wake_work);
+
 	if (udc->driver) {
 		/*
 		 * This is broken as only some cleanup is skipped, *udev is
--
2.43.0
