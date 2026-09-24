Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127AC43B6C5
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293116; cv=none; b=nD6xelyWXScI3hqhcs3ACll0gPrJ666okiKg9WPjfuHzFvlLLgLwKsNFvftRWugHZ3oLyjJfNEJsccGEhywdGejzVa39YnDYIR97ynWP1p/2q8B7iEyWqZQDh//uYcg5wIAGy263vvixuq55wu7hHvMD4igykgIWLQxzvg8OXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293116; c=relaxed/simple;
	bh=J0BNtkJI/I3krcl4EpRdmNeLqUX9RdjaWd+RI3SKMh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5KLljonrGdsBZJtxjSrNPYQ5of5qIVjr6Ssyg9mjaiiBF1E2EjZiVwovDE6iqwd+fMgA9PsdwzzujkF273g62ATJTstoYhG4QDb/uyR3zmus1EqMUQcYQgaN2UybCSLTfjBzk21qCDyI1dxgLPil6k8Y4i2NQH34N0RWK19yQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdHmDfPH; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdHmDfPH"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so248087a91.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293114; x=1790897914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=KdHmDfPHCZwFTBCXufO1Im3l0hUZ5hJlX8mQSgeMDSFqIe4OKQ0dleh65YyBmJ+a9f
         NhueGJIhAorOmKAoQ5yLa6+OaMdM14rbfBmauHIAzVaRb4/zf1CGiwtVpj9RgUw3Wd4D
         OYm9wpO4Yai6uS6SubK1rZUiZ+Rzub4KICqkJbPWqawsQ3sqYTlHrTnAIcE9gkIDPy+W
         TpFOhIZdsKIfbMZLlsMk7wdPh7kGK11NsmlVdqP3gVcNal5n7gj/2wouUMpgg7LbRnxi
         mWOBAIerdIFlwbKK11azxNtSHVFKE5eppYnoRZSsph4n8O4rMBscv7c2rTVSIkYGN+X6
         ZOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293114; x=1790897914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=Z9cDlWZrrGTstO1b6C7DSBLxUDc9wC8WT3//sbTSaX6KwRYS7QBpqrn4CMhZpn9uTA
         MOEldBdOBmY4tCDDX9u4OdFQyjlCsKcNIwCQ1XusBOn+58XutVCUpr/1OSATVY+Pbqux
         tXnB1WrUB3jVr/2fFois3jsurEkeDmquWhJ9xcULaQXsoEUXfSktshMEczBhNHhA3ss/
         Y1PZH32gaos1U4j59YSDIcmW+uqdE5zu9m9Etb6SedbxJ0wHUUp3IzyBAtlg+wdeMjIP
         y2fBzURQ4NTNzZOENtfA6SqIl+ZgXUl5ulR++5IS2LEr8dtMxzxsZzOjmMntsDV8stkq
         XTnQ==
X-Gm-Message-State: AFuF++l5xDX8TYZWzKQDxweHf+PyibjBU9qJ0AxUiyaulV1ZJjFZ3JKF
	PIFkuMAC6ZDKNeNSZ2EUNW3Jx4n7JWUjOjhA6UXQA/SfNpmACOSrJ2u7N7AvPg==
X-Gm-Gg: AYBFou24+mlZYp2bOGpXn+Owa3fBIm/sgMaxUPnwg8mbpn5W2B8gTMSCWwqs/FoziI8
	QGryjxVn6UHzdKgaEsrAoj6ZrhWvvRLoZcALW4N+humvcGvMdhMTIx5iMJJrcE+a6qnsEgohcpS
	4XaDN72cJUb4YEfnd0OT3uW+e7A2vSXU4xlzjbtIo7OhbQqOXP0Lb2e4a8meRIkcQ6QLu9FcRJz
	ZjftCIu+ZC1Xhn3culH1K62cd3CIf0aNbZA+JBw18Z6bRmxoiVgvKUkG5V7wIchHAsHxAFxDxUk
	UaRxeJU19xMM3vYSxOq+fAbOAEEK8GcXCrJKVBf0zf0iKnyRrbh0vkywMrfHOV4nAsy/kg+6Eeg
	LSR1Tn4HRzoDPgkqi/HNU4v2cwpUDwFmPaZHEOJ06Kw+4M55eYU8LjCWyCjrK3XnjCDvFxCO0QV
	EH12f+dINc/pAGebERsy1acLhGi2HIRuQ/87zKUiV7FfmbKUxWSKDoGMQOPVQEHQK3otfxNsE2e
	Vlq4rX+ETZvpO8wBqyoN21WhWBODCtveX2L4XCQWjGXwuqLVbeQ0BOimZZk7SeJpPtaVqX2xm8x
	af3+DGgLnC57wx0PpplCBVARmSVzWLdsx1CKAr+uFLjFq8aE
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr3305369a91.36.1790293114266;
        Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
Date: Thu, 24 Sep 2026 16:38:29 -0700
Message-ID: <20260924233831.127617-1-rosenp@gmail.com>
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

v3: don't drop GPIO.
v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 +++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 +++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 +++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 +++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 +++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 +++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 +++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 +++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 +++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 +++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 +++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 +++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 +++-
 drivers/usb/host/bcma-hcd.c                   | 55 +++++++++++++++----
 26 files changed, 384 insertions(+), 46 deletions(-)

-- 
2.55.0

