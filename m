Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4303ACA5C
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045316; cv=none; b=rseKZc2WZcbgYlg4fkEcLV/rQeof2qou9M5k2iDQQzJ9O0ivnrUEkUbj45O8krkH2TvedKq/OpPzJnB4p/A4vMXhx6JOTVTbr3Vt83z5KDxiualYgoWemo46Wl2Z63zrwZtyT6DnI6MYJvaaf9hZMEN90MqtzJc1b4eUnCrT6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045316; c=relaxed/simple;
	bh=vvm8Ml9q1Tf4TVKcptL0B8794cZemUp57P1StvY2U7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0j7kca3JykXf7FDSailu1coZVh5MKM6tC0FhIlbDIXkPJurTPTkzZTvFljdR0qaziz3e4oQ+s7+cE8MBbik/waE4FXqtehBSYoAJRhsVmHGLn2uOHmToynefdgviWFDXumjHAycvU1NPSonjqvFn445jQAoXKnaUOQyzxSUZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJpWcoYr; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJpWcoYr"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c6so3156693b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045311; x=1790650111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WX6Mfh4l0Vw/8UzDpK6UHvwa+BQE0w9TDFZftgIIYk=;
        b=eJpWcoYr2eVCiZ6mOXAfw2vs9peOC+u5k+0YHTIriryDMf8FeAZqar1+S5IjUZwikm
         BDvqTjtlZ1JAfo/ta7I5P60RQc0EKtTPgFtUJIqW6agSSMYGr7gLMH3ItXisYU1dCoZx
         lv7Jzv/PIQIBjF+bdJqurU9/D3fbrAaKQKToesk3V9ePrJaRMwLnxWl0dBuiAog/negb
         qNlaZWzyALeXQLY3r3OOmRVQr7du00gZZ7U56wG2UaxduMWOHRTv59Rhu2DbH0zYDpLe
         +FPTilEDNXJj/nMcQPtj2tTFXKIUraNOz2JvE+ZD8RJtosfGLSHSpw8HgMH+IToSd4tv
         Aj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045311; x=1790650111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WX6Mfh4l0Vw/8UzDpK6UHvwa+BQE0w9TDFZftgIIYk=;
        b=Gck+Vv3iZRcNvwMfDv8DQNqcLlb53e2SWwAFvnX/8J983SV1H3PMDZFCOnDM551SOf
         VFRLkv5nfbrou7oqkqbFL+fVM5xw1eQDlZdE7COZDrFQGaWCQWZ6bZyb5JL2Nu83aDaa
         kKqDPU1NKonWAqHfpZ5ExgyDDt2cVrWNj45q8ASZHBRRcSKqgNlGGIBcIa4cnkArUD0a
         pIqnfxl93G4uEs0y1lA9aS6lZ+xkkWTfyux7r7STQxVATPxyZpuK+xdbdk2rJpECQfAM
         fl30a6/6QHmRG7+u9gaaei1gy6n7LYM2ITN8RwzwEr0ro1qNTsr89iSbGA8dLrElNLTI
         AqWg==
X-Forwarded-Encrypted: i=1; AKwUvBxD4HtTR1I3bpzQWKERA4Ga1vY/M5RUahg8zwz+GBipwGw29bQitb5wh0wV/WX7yui43XOOQN+ctKU=@vger.kernel.org
X-Gm-Message-State: AFuF++mRVBm5DyXxLhJtCLbK0kp5CrdJXYUg4RAvzuTeF20TnoYU0X3g
	KahHQDrMlAjoj21J09MdvDrST8QK8lUiOWmhL7vJZv+nQpuY5Ou/2PQK
X-Gm-Gg: AYBFou1H9vSV+4SiTCBr9CdFTN3KNGVbXveiuu+IP0Qhtk67cQ+QOY9nnnx/iFkpgvv
	OZcmwWIMFxsWMfBxKV2xY350QkyzA0fb4IZah/GwjrEgifTQ+yvpryjbZpOGj6oCm1CniF7L9vA
	I/f+OqAfI9Fqn4pq5zZCzq4VDiX+Pj254/T57P3jEuyP9UU2yynjVNtZ459h8ysrnLRh+dQZz9S
	FBAeEqKCxVhZz6+daPDBbDexrOw/IiHCy1ka/DLxUEJZJ68eJ1qo1sgb46yjL0J8DuoHLkUwlju
	2QWoRjcTqyKWwvmd2EBgF1gP22jLPLo2QD1basSStkvjflRvpjHcUWnwKP5L29pQ5OzAZugv2Nh
	az8Y9rqFEpqNJvbBg3rc0KqlFJORs2b5Ju5fw1jtufcDEh1/ku6wtoziUzjc+v+S/9u6mR1ByED
	xuI+mGUk4wC+Z49qJIymucjpVT/jAkIiLkIOc4x9pAvzL3e7L/7BkV0ZnJxny70eeUBzxM
X-Received: by 2002:a05:6a00:278d:b0:879:ffd9:126d with SMTP id d2e1a72fcca58-879ffd91ae4mr6025072b3a.15.1790045311312;
        Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c336aba96sm112998b3a.61.2026.09.21.19.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 3/5] usb: dwc2: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:18 +0800
Message-ID: <20260922024724.191412-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..62b663ef1504 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -243,7 +243,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 		ret = PTR_ERR(hsotg->phy);
 		switch (ret) {
 		case -ENODEV:
-		case -ENOSYS:
+		case -EOPNOTSUPP:
 			hsotg->phy = NULL;
 			break;
 		default:
-- 
2.55.0

