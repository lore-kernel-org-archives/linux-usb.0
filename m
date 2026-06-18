Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D33EB810
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777717; cv=none; b=KHMuXHPefQh92pxTlTKm1zZWMpCqYqoxZhfZccJmVv4/uYJT4ysDOQzqx4NsSOaFGPmuic4qqewj4q2O7sQbDTHu0udZWTB/EostnKvxwKtEUOpWz2tDeK7KCf+EFN6fZKDuH5fgciw8jMPfT5Y5vrrLDKNqBIjQj+ldSZk8yOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777717; c=relaxed/simple;
	bh=/ph9sLNxzAH4C/IxXRsz9y0wPDLhnOzID6phL4K8OI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilpqAureZQdmiEy1FbsZbkkmFgenJzqGdObCtkIyjErAex+ktzWYI0NHKUeZl4t3Hm/gQg6j5wyGz+9oUm4Cr31AQFbib31xv77V/qH8xwr/LoO0z4kj06PZCbVtIY5YZiV75/VtReAQoOyNrcMFpt/lkuWsmjoepS3MenlNuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z0bNZS3m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z0bNZS3m"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4633193af19so579388f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781777709; x=1782382509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFiC4yaH+yHhFXvZVffNRQ5JjoUucabPkwg7C0VSjd8=;
        b=Z0bNZS3mcYm1ZKoGClQbrv6KCLRWy4trQTbf9dUZEdLYp0aL/YSphkRZcKzatTWurQ
         Gmr48pefa5BHI5/nXyJ7oObLvzyMVzf6PCf5TJ1A7AOUDGeRKhj/IPljiJfEgooxhHjt
         Ep0+hxo7TEWFoGneZQxnK4Pfahj8xqu2SXIwK93EjLC0sjN3YmItAM/G0Smn9d2jBEvV
         EELqwaKqqotKZi4gxPHRMkVg0L1G6wUO2V9I2X2uVbgZ5fCj8YRC4FYPt+GzKg06amX3
         st6/VZDFIhyJkYVhQrTbwYqGCMLP9plWAGJ9ujJKE9LiO1hgk9DOryp01bSYpzTNc282
         Hphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777709; x=1782382509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFiC4yaH+yHhFXvZVffNRQ5JjoUucabPkwg7C0VSjd8=;
        b=ZXKO4sZvJuld0902k9EPqazbJBBbYibM+ami331eTChiAxeExECEXakhQt2S0rPwnp
         dzkPjvhzswYN/esavBcOos+63Kru9ONNpC9bDIzonvsNbmEkZijn1zrtS21kiiKR0pSe
         ldUGFcEruJOO3tefVLV9kTvlGEWUjcfZuUCnOtlgvlywSV84x+0Va2X7HFAqTRysup8X
         h3ULbnh89s940jYafFgS6FoL/zioMquo7tGWbvfvO16h24HB8aIDbAA9Eie38UtACPpl
         3TPNITVHIu/yrtNN7uh+MQSVH9MKTq+YyL8+7gj2k84sg9nfH/CtTA0wTYWKfU6lOpvs
         59Iw==
X-Gm-Message-State: AOJu0YwWuTUf2aEa1SolZMN4vQ1LULgSdZdG/Fj3vvUnqdaWk6Y1eLBZ
	qmzYNBTU47C6HIBZTgyWGPpbDc/tViT+ZE1x9GPHgnm0SkBFOuo9x1pDcXHli5CyDlM=
X-Gm-Gg: AfdE7clZwie0Q0VtG5AdkpLAA/CT70/lWruFRMtW5MM+Ql8/jUztBUIUDTscTFB4INA
	6soRQwzhXWYsS3dR8cM9YAjjiGxfpL16fgPq/FDylK5a+ZMpN8uPE3NF53g4n0Geq8ed+WVRigP
	kpW4Igsk6rwbrQdaUtbS3uExxJAIB7+Hs26csPxhU3UPQyCJ5qpSCdctGQNUyhVEg/jHljRTXq6
	e2LI+gx9rGqcpqsQDpP4surI0RwLyV6fwEhAgl/ZWH9I63PFsji69gUw/SHRgQJzL5S+dgLiXsy
	G+3IIH1KZf8KnO0Q0e0O9X+QC3TBMZHGj/uy0RTJ9N8UzqXKY2AXy9A0mL2TfqZsRShwvfz2tQ6
	7xw0YejzxxHhrcykyC808T8cVe8sPLeoAhZ2R39iGGdY0q+BiJqPSZ+CK/Tjnftg25tZuJlCpU9
	pbmRXyr+1y2k/yJJ3eO5lwI3KizWliNhdoRqHvcg+kU3gEFDENjxPFrtAbl0Ki4a/0bROilFYIm
	rfH
X-Received: by 2002:a05:600c:6216:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-4923a9d07a4mr20695825e9.22.1781777709351;
        Thu, 18 Jun 2026 03:15:09 -0700 (PDT)
Received: from localhost (p200300f65f47db048595530b320b6c5c.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8595:530b:320b:6c5c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49230a58becsm224242985e9.7.2026.06.18.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:15:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] thunderbold: Assert that a service driver has a probe callback
Date: Thu, 18 Jun 2026 12:14:51 +0200
Message-ID:  <7dcaa7db505c01ecc08ebcd3aab419b3466dd1e3.1781776904.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
References: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/ph9sLNxzAH4C/IxXRsz9y0wPDLhnOzID6phL4K8OI0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqM8UfEE9mGE99wwqYYimmIWj7mIoGxyievI4td G8EDkUeP2aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajPFHwAKCRCPgPtYfRL+ TnqCB/sE7SCVSa3bUKxRBOtFQgWQj9Y7yiUJFTPDopfixZIbcGh+YEts8Ayvk0wJnSZicm1yYeX lF8Z9/E5C+dpuX82IlxGx33798tg0ngD+2gE9jIkrpf8D45qYFhmi/qb8Rv6Ellr8wA8+CkkuRJ YjVlHbXeiOWszeIq1WsN0LKT5S4IIyOkOcMqnoHIv+otwaO6ywXxa7+OpZwS3AwAw8z7cV9nv+m nhorUa1apgbamAR2rt2hnhs0D0f+Q0mivzWTRc1XvJZ/P4MFXtWitODs3ZwwyFbfuHC2FTPZFNV ZJsHFZsUXMlhn6fbwjIlJ5EOYN6QOYR0Jqz2ifXTnf0V9+M1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tb_service_probe() calls the driver's probe function unconditionally.
Check at driver register time that this callback is valid to prevent a
NULL pointer exception.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/thunderbolt/xdomain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 86b2f7474670..05442df0e99c 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -968,6 +968,9 @@ tb_xdp_schedule_request(struct tb *tb, const struct tb_xdp_header *hdr,
  */
 int tb_register_service_driver(struct tb_service_driver *drv)
 {
+	if (!drv->probe)
+		return -EINVAL;
+
 	drv->driver.bus = &tb_bus_type;
 	return driver_register(&drv->driver);
 }
-- 
2.47.3

