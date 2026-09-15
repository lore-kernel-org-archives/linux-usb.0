Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C34331EC0
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 01:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435230; cv=none; b=PZdTcbqVHMRa8ALsh8G9oWAavbop2yJlQxYM3yDr0RD2+eEsJnTO6ENUDM5zKdu6Lu6gm9z4OpSIekWEhgq6PHGE3v/73g8sC3R/HGKS6JhSKpF380hqjlmJv/Ys5n3oT67ssxxmY+H9QvwBWXIn7zOKZJQjTaI2zFDiSVppWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435230; c=relaxed/simple;
	bh=CKKoXinNIPjaJ7mWM3TvEUEq1iXPeisQkm64XntF2Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1sEz7f+ky1Nb9aArf0R+T47OsLt6D5DrDClY638gCb07NmvXBcmfELDKlLVAzqM2BCFAAPD6arAzhZaWZDLT68N0jPaekemeCmXFTQxYguByQ0Djb+Mwu9kVwRRz6cm2XUIALTv0GtMPu+tkx5Tna8vPlZlpjXtNfJt4zijIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKDH2hy8; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKDH2hy8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso32707236d6.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 18:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435227; x=1790040027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=bKDH2hy88roSbWAbthQ36jUz4Y0jCVs7cNPSiqCFShYtQL8PzkxO57EEh8OwbrsGKE
         PI7upf2d0tAOHKSJ+BdD9TyT+3WcRz0WbvMwU//wMxAio4P8Xu8BHgcygCDIleLUb7qZ
         1knmaDQgS6L7eyyrVVtREKUkjE86DxvfVSkaoWXj7qU3lOICKNWCdzPxgcMqbaDXjdY2
         Cr99vKTnZzDoBgsK6bKramFb0uWCejvg2jzgmcu7GFtJHfMyeBc7xDbF7nZcDyF/s8UX
         N2UEly39mJdi2C51kkSW3ra9lb3QzvYV5BLjXKt/2hcNhEuayC/GA5MyhyiRtrFTEaUZ
         J4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435227; x=1790040027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=zy4X3HW4o3fa/Y7kB1h72bD3DrA8Ek3UUtIXQbQVTn+QPYLYdOOeK3OWfLdzMBMGFh
         iNy59RFjXgBld+GlhYDxnEfhWBSTr2rSAxK6wM81LC9U1NCnVg7iGCASnZLOV9HE9VWu
         FlQjd1ZkGHN5w5j5/jbYyg9OOqo05Arv/X/nFYC+29DV+pkR9xk27RZq/DjzCAaDn7tE
         JyAZ42hABstT4UZgAWErAnNWROBBjSuoOYY/Py/rm7jitqQy52C5VZkfldkdWCXWlejI
         pNZKxsrxGk4bwnuHfIvPlXcY7X1TuZ/pcNppiaCmuI8YI5puDzlsn67EYW7ohYxP36pd
         wzZg==
X-Forwarded-Encrypted: i=1; AKwUvBzoRBClsGoxK6XOvmVj2WJzJbx9iRL+gZ8fJZlmXzTzbHpTX+1vvmguE8AzDj/LB/PQcbde6TtzhDA=@vger.kernel.org
X-Gm-Message-State: AFuF++lj7Z3PiWLxn1Buuzmq/+LiKVn/M+xSZkUGxCZB2wjrWJ+kbKwL
	a9e6fu1FRm9egOiIkgWaA4JQJszyDOB3g3VFhJ/Dx2mmh6PhsaFKqgg=
X-Gm-Gg: AYBFou18hy8W5K9n+LE2EiNEF15h062O+LE6obGyK8XIeD4P1hOnydCkBmo9j8MHgQx
	ysoei3+om2XpNwZM4J4NMjhtBxiocDqibcBJol9D3vlNlHZEAkE1DLiVk37Er7e1M/rDsOqRc34
	uyxTAyVnZGfsheBrQJ+shMHyvFr3UNN98mTAAqTNweWCtV/x+EMISLTpYLOznjqyt6rrhEQtDy+
	Dyvjtq+kzPMb4gSAE+aDsgHrZcCqpGV3vUG0D/QSXyl8QK+X46iSsJXr3N57UCNRYgL9bZBgVNM
	GyeGzuxYmUGDbvi6yoPq6fxKcw5sKQey+AWlLmrVKkP3U6F/qD1mkNOaYBdiWm+Iu/x/6973raD
	WviU+2cTnuqYp8K2IelmGq+oUREM1r96xXub2gZU+JQa3JdKW6Eta591uD7sH94WQTkTTEvF1fi
	j+ukTVUDnQQ7BB/ko27BMVtWEyLZLssRwLQrLLreJ3EB/Iq14FZoEMZUtKcDV2KgjqT/GDv6nii
	GdQnPmSAUmQQI4ZhNcnwYrGfXHyTmUQkw3xWecErKgPE7Z857fY78jzQQ5/0zKVf1bBUPmQ3+Np
	/59jLJeZnbDdcAK+aB+EX1AITdbxWY4NUFeNSlPiJW0hK8N/bosdBEDLw+Zau0aB9ffM2b+JRXV
	PLFdB5A==
X-Received: by 2002:a05:6214:590c:b0:8f0:3b98:d6af with SMTP id 6a1803df08f44-9122e660530mr96067806d6.26.1789435222335;
        Mon, 14 Sep 2026 18:20:22 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] usb: ohci-da8xx: disable controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:08 -0400
Message-ID: <20260915012011.61874-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OHCI core marks controllers with RemoteWakeupConnected as
wakeup-capable. Probe enables wakeup, but neither removal nor a later
notifier registration failure disables it, leaving the wakeup source
attached.

Disable controller wakeup after removing the HCD on both paths.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-da8xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -447,6 +447,7 @@
 
 err_remove_hcd:
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 err:
 	usb_put_hcd(hcd);
 	return error;
@@ -457,5 +458,6 @@
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	usb_put_hcd(hcd);
 }
