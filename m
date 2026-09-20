Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974503E120C
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938841; cv=none; b=c7CNkZC7oEFxd4I1eJoPLdq0RyAVESPE8Jq2y2FKxwBil8snqsE2XFButKo/XYYv7er6LXGHbwjC/Fi665xWH0L7ybffBG9poUpRwuSsEPepKP3dNYWB8o1o2QlbT4qt6bPeEomBvWIpTkj+2GbiLRynjPk5gGRkPM+TdVFefL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938841; c=relaxed/simple;
	bh=o2jGA+oz8FAHUUGJjII1o9Dpx+I2JLINT0FHkUiHcKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCrMEmxiFKvS8e5fradcCH8xZRQid1X4wmdaL56vIODju+nP3rWBwh2RaEg6WbHEP5bmiqvsipPZvyfLL5pjhvWKwibGWNlVo0Ryucun8lqhBgZEVS/DS754NXQNwJp/eCW9ZW35L95hBH55G52gkbBO+v/nxEkDbjn4whUJLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTFA5MuV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTFA5MuV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso941462a91.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938840; x=1790543640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=cTFA5MuVrIwwUpiHun3AF0v7E6G2C4VNXJNI3vjaAVvOSFmFlLXloxJj6PxGGRqIYT
         CZp4KvTeuWSInVT1j+yAvm9853t05hBoamyjW4KEfRz66TrHy97odZygbJ6pqmfghoip
         mdnppQjZ9CHodLVZFF/MELEHV8Mtc55NP1uKYBWHvpw5nVkCEiFd8PbTFP5xgIicLqhp
         TdbiYmSbjqK2YOg4YGrbmf+hjICwn16ozpBdZIfoUp335Wz1h1l+LSQkn5x3RUF41Q+z
         F8WpI713bNTrTsSgvCVSc1a8CNLnTlkDAXrRvjJpAidCF8ZlQk1ckTdNh7ThXpElJDq0
         KsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938840; x=1790543640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=MPbzaVbw3B9l6zQ8gEyUC0MZd2o3GtOGHX0wg8+eLscD0kNl3sDHf2+kKm43OhouyO
         x/sMYKxq3EcTfxYnmCkFERR0sfaKNnCuPv9g3zdm/o4agekQrw93qE6m/mcps+4T9Ozi
         /utXPjIQ4ncZgGvThH/Qu8c/j6igUrb8jNrKDgYzjejY0pu3SYcT26cIQyh8xBa567jX
         8b1L2gvbs0h1cmIFZ2/mpLbtwehQ+EaMwgfsQk3NwPqwQcAydpxB4fGpRd/F/pyVFBkl
         xfEt6k2I/dGQEYENBSLbIgPuscsWx6qHeV5cbW7K1ZiNgVf2T1l0LToDdqX5Icp0V8iU
         2g9w==
X-Forwarded-Encrypted: i=1; AKwUvBwGv9cqtbC79oOrbVKKzQJ8ZN42R8RW8gXoXE9NkY/dTB+TaHj/NZQo7x+n3y+F3XFc+Y3xEtbfHVo=@vger.kernel.org
X-Gm-Message-State: AFuF++mqavNir/xt1UnWwnsVg0mKy6Gnb0T5h4WHGhgYwySLSJJgHR0G
	MoLc7nYisbEMmbxcXVkis3jS5lU99JmjLBdkCsaWpk+NOedOEFRD0dVJ
X-Gm-Gg: AYBFou3lyxdVVFbS82IlbNyoyd0/0fG+n5TiX/4vSqAc1VZ7zySf/ifd8+u+qh5lZSM
	p0Xf9wp3oyRe0v9HuHvuQlHrMnWWNmkH/dJOPxJ1Fdnluw4afNYDdZ8RAQbOaVZ4+NXk8/xXf+P
	1N7BevrOVwzVE1j6AExSALx1DHa/02I3L1q1fGj0DE3qzq0P5Ju7jjObOVZa/+Pn0eHbZn44gOC
	ZbmQDZkvsX8nLkileJ5fX3GD7mH2GUwewdHxHOISrUYwWYUa65O3JiP25KqTu7mzNoMF0WtpRrZ
	I+sr+ttwKYl0Auo0AZtG3MvpmuosdBDc4ATiYWmXAYrsQcE4pBCx5gHTsW/NpcQFiQu5RDD4UvY
	yVudX/wY1D+QRM2rq1Es6fDy5YiH6AQNPePJOflA/dJlut9mpTkPYYbvHwIF4Oo5ZZf4sSqJR1b
	prjKCDYUoVzIKprxTUxBNaFwfwXzhOV13UEbxQZQ8yQZT7kpOyZtvynZ7m5+oKI4t5p4nakvMZ7
	PW94EabLCW1LYKzQGQSjM9TU8pT3rP8fBXF2T2g0etBTs7fuuwwah1JGsM75li4O8nmpuzCNMGl
	p4w02rAQ1rDtJaMToLf2R/42sfVuice1gotebu/TO7A9WESTCA5BCUnBzKk=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-39e6c68fec5mr4752048a91.38.1789938839949;
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/2] usb: bcma: control VBUS via a regulator
Date: Sun, 20 Sep 2026 14:13:54 -0700
Message-ID: <20260920211356.186967-1-rosenp@gmail.com>
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

Rosen Penev (2):
  usb: bcma: control VBUS via a regulator instead of a GPIO
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 14 +++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 25 ++++++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 25 ++++++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 14 +++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 +++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 14 +++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 14 +++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 14 +++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 14 +++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 26 ++++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 16 ++++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 16 ++++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 26 ++++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 14 +++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 26 ++++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 26 ++++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 14 +++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 14 +++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 14 +++++-
 drivers/usb/host/bcma-hcd.c                   | 45 +++++++++++++------
 26 files changed, 422 insertions(+), 47 deletions(-)

-- 
2.55.0

