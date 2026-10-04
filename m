Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507D3D0C18
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132740; cv=none; b=chstZrYSzsdM6PDk5cgOfgAJ1U+Ffeonc01y8NfSL84TTCXQ6hm2XhiCxmal8Rd2T8LRM8SsqYY1C56Bl2Fxh4dWHWsR1gsJhf9feVOdlkksqrgKBIGfS8EEnMfvqJxlTOE9HpYzS0BeMlMD25jeRwL1aK+1E6BnHUInOcN/vZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132740; c=relaxed/simple;
	bh=v+M6jZZkpPcV65ZunZ7LyGs21aPM4qlR+wPHbDyhJRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDsPe2ARwL/FeGO0ZRiDSn4VzLlKNfIAv6RDiyyo3vBy+gSdokOtRn67RcLgcBwPh2N/r0CbIZOLbn5Cvxd/RzZ3DGRQXnYSMYrHOpAINTSphuiaZFwkh5z1kHw6Qfi8qSnhxtgNF3W8KNtuIxD+d7I8Z8RsI4rEdWoujscs2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/8PimF9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/8PimF9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b06bb6e40so755585f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132735; x=1791737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=K/8PimF9FwoLvW9WqIiGJP4GMxTwD1xLltHZWrAfNRIWFb3IcYuPT1DwV/A2uuk2WV
         +itZ3oPLVDIT9BixPyQQX1f1EDA267huN/+CbmeEkl0mTAD39CJ11wJLRQuSoG7CAyYk
         Qd6/eHOV8Ys7SVz2LGG/+1+qgCL4Br2YqcJcMIr7Cn3OTYhwUKldsfhKDbSdqs79w1Bt
         xIwmaBLPrwVclr5ZU5O6Z4/r2+GpvMFZoY76tqa8u9VCN2PvTUq6yLTtxBjf1XMXNrL1
         vNDbBrAFDa8H0KKEdr4oCY5rBwNKu6YBT2Op/BqwLClTIblLYPYFsT+zR1hbAIHQPK8j
         jwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132735; x=1791737535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=OO2hqm0EOF3kWe/CMU/Mps6c7GERU9KQrXpHB1Q69Dog4JKFsed2nKpU5Ah5Ygxz8M
         i/kCGs9RYrp+aRohrkh14xx0ptFRq2slrOJzBe2VZN6FYqA0/3XHUqm0rqGQC90Z0Tul
         ESBHI/gxXDebWxu8zgVnDs5jF+m2Oq6Do/uoaiF9eDHXIDozi5xUMq+0tkPTfiIfIP45
         Hma7k0U9AHDzCpgzMzLG/aWDIHIOLxEycWsee+YFo/B6Nrvdo24A3pf+A88Vkevamrdu
         WvshBPHvr9R5NX+xAWy1S9ow3rOT3180A7wHqHEzvYEyaCWdLjEeTnt7+q/55b25Gjj8
         DIYQ==
X-Gm-Message-State: AFq9FYJ07ycQC9axRWCwLtpql9267o4Z8et7GY99BJ2lcmzyvIEjINM5
	q2sICetP5trk3Ej6kQNPnHQ+/vE4Lf1ssDOLckYPI/ZJ+fSnAzYzN1Pm
X-Gm-Gg: AYBFou3XTutFFwJ0Dc1JlYg8Ex4C4bNRC3/FrhjWsWcENyVkdhLYI0gtLqnyN6lh/57
	b0F48vA75d/KzL3UPN3olpE3W4csA6HB02MqdWNAQXNIvLKcD2WnuPb4MIqqKI918FiDmDznvWR
	QZecymMW/jK/PotrdO+KeWwoJPiDyRDXLrpP/xcZdrvF0J6NfMkTmzDpyVYnEefHvnUqGLYBvky
	kwoJ7dhnBETxaNrrPI2gs8F1cxnQ5HEKXlkYY7xSH2VptDQqVQcO/X3JUDg596gBExxHlBH6j6V
	lWUtZxSABvoyojymClXzPc4QOp7ly9Lgjz5YhAP+wFDjUgxEHJEn77BJB3tKQNH0HnJtuZDUU6q
	1Lg3Qbl/4cg6YLjuoR1htA47K3cS9J2D/gy8MgghH5wsus1xRh34iq2d7EugoPzHrZalUuN9W/r
	CAPIy7boF8h1JFYtK1sraTCBWYPgUnRCQVkoF9r8O8uS6DpsI2TUaCLs1vEo1nEMxMYLU4ZH/TE
	5Ev6mRe5KiRbONqpK7DvsF2+LsflQ==
X-Received: by 2002:a5d:5f86:0:b0:486:e835:ab88 with SMTP id ffacd0b85a97d-48c47fc5cb6mr8242586f8f.13.1791132734865;
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: tegra: separate schema and adjust OTG logic
Date: Sun,  4 Oct 2026 19:52:02 +0300
Message-ID: <20261004165204.205660-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate Tegra specific USB controller props into a dedicated schema.
Adjust USB OTG mode behavior with extcon use.

Jordan Viknar (1):
  usb: phy: tegra: Disable internal USB sensing if extcon is used

Svyatoslav Ryhel (1):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/phy/phy-tegra-usb.c               | 55 ++++++++++++
 include/linux/usb/tegra_usb_phy.h             |  1 +
 4 files changed, 144 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.53.0

