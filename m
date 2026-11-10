Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312174;
	b=Zz6dTOTelNdgFn7Pb6ZexRmk0pN5SeQ9IwfDHdhrnylsypx36msrbtFHsRB3zT34/psM
	 80kknQ+C3PO64khHyX7uinArHR68bQnXW5iDcfSmBE94ayzZbAy1mutd8/EgXAfj6Y7sh
	 FuPK0MlHukZ5hitPV1exScY+HUzGVy+MwPInJuEmkxH3fpSBZKfvVDQmvkNa76tATcTFF
	 EjtnXtHYaCc7TxNMn7UpxtDW0VYV8P92AUQDhBmFhpxZoFwtIAfCJiYIDgyQY71A2yk0L
	 CtN8EwYR78QHpRiueXz4rKZ+Xzel5m4kqDXZlU48Gdh9lxYvrIO7AN6rv84v02ESw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
	b=itUKGvQ1+j2+6u1rwgcyQlu9btXKG7HyoBu3843m9u4hexncfTASbjKZD1lmL7KBrxdu
	 nFm8bfKHnJ79ApmPPDRk1nvmMAiGzETuJKPVQ+18c8ylwPiVyTmBth4wa0JZTsUvw8Rxd
	 uMXmWAuYIbWlau/kkkJvVw/oeRu+IB2q29HRdVXa4/R+6EXBDn2TMmGRr5Yjig7nhRvCp
	 DlzZGqUYvljQjiWb0xeaF+9a/8rARrAEHOymvfXSK5ZO7PaIuMeE4um6r54KgPakJkewM
	 Pqz/71ey0qBrNjYWDPHM4J7c6WcJ3F6RHaFoLmaOQp4rFP5vOdeAz4ITf0+IPGq7dVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSDlQbfx;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB1606A33A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EB1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSDlQbfx
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372bdb942dbso2575119eec.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312173; x=1794916973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=jSDlQbfx3w+kTQrgktf6wDUFty1SLh6ECHjfH836acX0MKF0FcRwXmKfLDWc/YH6WU
         F+AyTHmN2bvbrDYANH2na7AdjtN6sFOtW+yORrVemO9+MLHtbzSUeWyClojBl0glCvK4
         nknss2LXWxE6eiiv4sOekf5Ht4/jPuhnTuhkUYisl8UZrU5q6INzIEvcl1Nns9SsrzQ3
         QKWuvHb8HvCPSEpyfdiyxoVTbKUubufh9fzyFVuyfmQQflgTCt1d9PqXD01UN0FUkkBS
         WbGFyO0mY6XBg/9feDU3URVoSCvRvna7kXi13CLZ0iLvAsiohrQT50zbt+WOGfmJ7Z4e
         6a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312173; x=1794916973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=Xo8fr6w4OG1IxTME2MSTwtp5mldL2xEQ5juLJ/jLh48J5ncoe/pyszutWMI/XjJJHZ
         H+T7gTDcVAY1Zn6jGHElOW9xqr2DsMZmkLZxk8Y3MOa3kRIAcpMQ2/4WQ7bpHbJJQyQ9
         6R37YWzZc+CsdDt+8fuVtodB1EYKGy8pSczBwgDW0PoLLem0GXSl+KaLHBjIuyqJwhhU
         cTixZVaCJsqsNNGxlMgxCp4l3JcghLDSrwUqtiP+9RwyBscl6/VSV3B+fDZ7Zw1rRY6p
         +h5QV04mAF6Vw8ofVCv551x74LT96CW7CmMZXbXc/l0cIDaaqrqjVAp9pvJ7RtZLy2z0
         32/g==
X-Forwarded-Encrypted: i=1; AL+hErEbyRtEHsAAcNvM5UOoJbwMxE9Stgjnnpf+j2b7RZ/GSmmf870yCsaPPE84D2M/vzypj23NrAi8AUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MzMiXK3cliAFWQD6ZQDknyUWoGw7WcvsuNAjFjBb1K+mmCy7K
	3MZXJX/dEnm1et0Fg4pPnNINCNhVUWt37tpOEgDYJtu5peFetlmnur2F
X-Gm-Gg: AYBFou3pn8MFmRz8ahEkCp6mrEAtzLDYNao0wDO2wD0V7vgqoUgbZv4+TbsufMdEPWO
	VrEdZAVALnntG+ocmRTIjZ10m+wI7MPHRDRabDhIMyioae6ZfO9CTtdOGkNMeZs8dZ7NFgdeiHf
	7i8LBbfATHmMVR3TsCIbL3t61huQ4Z/0YYoRWQUKp9HQnZ6jMwTHL3UHsb/3Huw0+ur3LDo2odU
	EfE4ixVThlI/bx79OzeVQzHP346zu0rEZo1Zwo75awCYtNmFMRVCQeLoimnN5zOMX0vWhJKItuh
	w++3oBWKkRF6O/ADruWsQArhvn+etkcAxwGrxdTGKgg0rHuKty3a3o593qXFEO9/oj0TD7IovDF
	1MepYPbBxGyMVziAKcI5A4mDh1Fvp1BbFyCRtoq7F6awsUiW24xSzmF4yZBZ0/ZpQa7eL9toU73
	//WoTu741BOt4W96UVvSt4+THvYFFrr5adoody7BRklTkVrcZZFKU197OmLvYj0rPYnUlDTaaNl
	F79wxfpk+IhTNaIhgYRducP7BKCsR1n1HLG4gWvpyNXhIKgBLieOGrUIIa344FR0H7v14TGExF4
	cFy4IkykkjnuuuprP0xJnwsYxy8rJt6b+xuFNGU93h1PjKig
X-Received: by 2002:a05:7301:fd03:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3751ee7c2c9mr2880533eec.7.1794312172706;
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm5931001eec.0.2026.11.10.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Roland Stigge <stigge@antcom.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 21:02:43 +0900
Message-ID: <20261110120243.2540098-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114351.2524921-1-hj351016@gmail.com>
References: <20261110114351.2524921-1-hj351016@gmail.com>
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

isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
isp1301 i2c pull-up access from process context. The work handler
(pullup_work) dereferences udc and touches the isp1301 i2c client.

udc is allocated with devm_kmemdup(), so devres frees it after
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which
queues pullup_job to clear the D+ pull-up -- but never drains it, so the
work can run after udc has been freed (and the isp1301 client put),
dereferencing freed memory -- a use-after-free.

Flush pullup_job in lpc32xx_udc_remove() after the final pullup(udc, 0).
flush_work() (rather than cancel_work_sync()) lets the queued pull-up
disable actually complete before the udc and its isp1301 client are
released, so the transceiver is left with D+ deasserted.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: flush_work() instead of cancel_work_sync(), so the pull-up disable
    queued by pullup(udc, 0) completes rather than being dropped
    (OTG1_DP_PULLUP would otherwise stay asserted after unbind) -- per
    Sashiko review of v1.

 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3d930f..b98faf5b71e5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3187,6 +3187,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup(udc, 0) queues pullup_job to clear the D+ pull-up over i2c;
+	 * flush it so that disable completes and no work can run after the
+	 * devm-allocated udc (and its isp1301 i2c client) are released.
+	 */
+	flush_work(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0
