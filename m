Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCE3B27FA
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026899; cv=none; b=LwFPNl3ye447SImgV04JVFWEsFkR1T2Ijejt+t5ROzC8famdtRTzAS5FaM0Gc2fOOLD1EZrlFYc//iLZAM9eWb5JtNryjSI0it6KKX78Nvk8eoCNcfPOJ/GqPJrJx8uEgtwyfw4LDRdnIKGdgPLZoQoP5fcRkLZ+aqvBIcXxKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026899; c=relaxed/simple;
	bh=/RJPQUzo8Go/WWZI8LnS462v+isCtH4+yN5e8p2n4sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2kTYql9SF1ToTC6slh8j3JoeKy5ZI1tHTOKRsXNuDDxLp0hLam8vNMml8J6fvsnf/HGT7Vl7stAsnTPGXnQhvvQ2jj4QPNTP0TYIXnHo6k+mS46iLi6d9YuzVMXKAt+eFrB09ppkqn7ux1+rrc5nVlpplcyF8qaHHgirQDfhIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbdOfm6B; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbdOfm6B"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2405490a91.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026897; x=1790631697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=LbdOfm6BhozfuWm+UtGi2XXXTHalXtTTRHOscznmNY9hIgTJ4miOGf/I5JRYlXoalm
         LL+sEbA6+fONxp8NThITKhqk1q8tyjJ8z23BWKzS57xiJDSgsUgwQmJc6LtpUUsJUwc9
         VlbOYqpibrzVIRG4PDUl29t6uHswV5AGf/79WSgpKgByHVBGpUe1iHNrrK7MzT06WnTY
         iIYXuwPUcdtqhATIQfpkOLVotz4hig/L61rBnrlUb1rEkc4Zh1b1L3bEyOthCJyag779
         R4g7r3iSbnDxWLysuVpLtlYTUC4h/u8VW1DSBcneTWqa7mdZKqv8J61e3XKDxgcCUGtu
         aRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026897; x=1790631697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=UMlrj/w98EX4z1RzFXoovDvqT3axYcvIGQULcJD4mjYI3/7QLeYNdzgqseiyx5Rur4
         AaT7gLBT389fHquEIB3kWlaCs8AIS1X4ShuRhyHFDLu437ZKn1JH7U7YoKD4acDiC+T3
         ibEO00hl9OZcDc4ONtoWN2V37fwpovMwTHpPdZ/w1dTWqSqx+mveCP3hp1A2mfLXIT5j
         WEwvXz+CMF3N+BBMoY4PEz46WWcJP9Gj66SRrxDoyqV3hRFM5H1wZcBSIIWJSZjMlm1o
         nw3hiMI0IIvAo2fSdee3gxuFNtafzXn/Ds5PJY8swzqzmDmiSbNFX5GO4C5NBcvAYr9Y
         EBLA==
X-Forwarded-Encrypted: i=1; AKwUvBygBjgLS1qJsdnHaOmCjIkzf6cd3r44LvDmFMUtJT9bRSr8shL+2jBpWSMuKIO6GaXs9UXV2s+UpZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mEiFKI0xjEx9qII72gEQXd9LKsO/9sHt+u1PhMiAjk3pQaxRT8
	jqBPZF6H6POkCffv8fhcENlfZd7pwCflgGBfApHnG2EJAhLhw8JfwBfs
X-Gm-Gg: AYBFou3Z+pel0B2RSO7FEfVFHRAQh5/S+heC1ErIdY5brdr0b9BIKOWqNSjJYKTw0lt
	mBrE0HG5p4kpOd3QJOpbH/5UHI/LWiezi4jIuXNv6ZUKOAEi0OKepQbTp9Y9F//949NF1ln2u+a
	9F6uMAOqJ13e1gWbaDFqIIFaGQGKOrJQx8UJ8IK5YjfbEsOmjl4Pulx3ug0LP0giU/sczYA88DT
	dEy81Zo5keTWCHXrUE8VPmM89LOKGxkjMCatPoChwMcKc0JG3TzaMfaBe9iNPsfJ9o9cpOIga42
	pAykG2HHKT5d7p/bKwfmKE1rfWWBzUlMfmuX5mRHqwWpwc6z+rvpcWIN4JEtqZkjBQdK/jCX/SC
	qS+g0WvCB0f9a8gM44lwEtKJSIAAZ5VNSSWzr2U3+ERKWeXBAx8AMJopmWV/8zKtI1wfsTzRBEW
	OXjldLrNLTOg9IwZ4p81M6Hd41W4QgC0v4X4P32ylytzO5ApgIPHLQUpYHNBZmS5MXOCiFGhdzg
	S3y0IZ2Oo9z8i7Hi3PJMG840H1BTRF7UO/sO1skE6i5/rglz2Rs968bBBrK2/nzQ0f22Rz8B9Ct
	Wx6yYU/I235cAlOT4V4w/+q/DhDm3As61ceqOm97ym/OZ84SSw==
X-Received: by 2002:a17:90b:56c5:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-39e54dc1a3emr17982461a91.33.1790026896931;
        Mon, 21 Sep 2026 14:41:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 0/2] usb: bcma: control VBUS via a regulator
Date: Mon, 21 Sep 2026 14:41:31 -0700
Message-ID: <20260921214133.16519-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 ++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 ++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 ++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 ++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 ++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 ++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 ++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 ++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 ++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 ++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 ++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 ++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 ++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 ++++-
 drivers/usb/host/bcma-hcd.c                   | 54 +++++++++++++++----
 26 files changed, 384 insertions(+), 45 deletions(-)

-- 
2.55.0

