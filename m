Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598434;
	b=E49BhMKIha4qol+BcZeoi3M3FK/k4cqXuP4VayTWaTqcaQLn0uEmFgU2H8ENSobdg1kS
	 28M46wmO0EfunMsVwx871J2cjm0Sbn3yqFBjwtyG2dDGc2dDTMk8EXuGWFwj56/yp3Sph
	 caFDmxgB2+KLmG71xOpEH3B2gLHNTXvD8iz5a1M4HnG6Vt2qM8+M4zroIsMpLlNx7uqGz
	 pdNm7m+dKFGl7L7blKj6OTyQDqEBw/BjFNQiM8/PFupPpRE9s22QFsD6g3YFacSUgQzF/
	 E0Y/F9qmNBdAZsk28EsZ+xi9tJH8kLxhc/wKPqnjjQa5UeEsyXi1c7RXX7sq2hW1mEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yq3uivVkq2skbrTjnqtd+llc3MlOFRYJuIzdaOyLkzc=;
	b=2X9MbcN/TkCHZFF9p/22pMmYfhrN4cX0rvhS6IiVWudYlz6l61TBQqIKmCzj01STBv8r
	 fd4xzoe3vrCdV/Un6w/BQuLC68ZT4MdsAurobSYqLugDncDEPoM+d6tggLW0uzFalCBD6
	 X9Ri9xJ0POiiNZqX5C9FrjOEmO6VA/vpmyzPp67MNQXCWMfEkUTkFqnUgdE4An2gQSKoC
	 nDfgcZqQczBHe3Mxa2WXZJsW+clXHe51hDu92pj4Tmq8dwBZxKFcuLGGdA0VAB2fEzceW
	 PT7/NyB7sTh4ZJvU4nGoqPkXGiRGiUxTh8ufMH9jzdRLyTx5oxfwYuGAoQgG8M5XIDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TrfCpZKU;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC71606A681
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC71606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TrfCpZKU
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F0133F641
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795598428;
	bh=Yq3uivVkq2skbrTjnqtd+llc3MlOFRYJuIzdaOyLkzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=TrfCpZKU5MLG55murkkNUiKZUkOS1okM0YZlpQxVHPC7+2XA57vcE/zKszGyke6G1
	 CmEpdtzGS6HuGrrRhNNe/8hI75LZvMiekKXUBL/Ph+qdgxC9xbld6rkgV3//Th4QSN
	 +T94dMRKyjwbRwRw/ngTL4Uyfgfjg4wr1VpRJI4+OuRecKPZpPyQCBAn7HXm4rmuw7
	 oIJI059ZtFrHaAsRu5pbhti6qt/emzbH/Cyduen7p28y2EpYdF+yy/N8XltwxfpEyL
	 /OuIeSz2R91hS4CPKhVxxhsMUxVWYI7nWha+3WGE2kgLf5bkAGH7ot0fQTFbdWGKWe
	 XBXWib8hMUm9odooxfW71FpadO97SMQZ2aL4rnmnl7mDkrqAbuAqNB4b9/rcvhVm8D
	 xLU9ma0SlW7me2CAw2PyJ5qbnRDkBbIqO3gPmg2GSTGbLEFxmntee/GmBhzEzvH22j
	 DBFq0Fsfv6DnjAaep+pNEjNDxf5KtJ4gD1o0vhI1bDNc+oIHet3AaBWZA0kQUOykcc
	 iBv+PI+VkneFw0px1ItkiD6QTpeBsZT1cf6YV9YWbaN0zn8Go9lW7AErKQMH9DlAgO
	 MPwNkuX+aXJCDHxJgIpRHZAkpwIlIyD9CpW1P+Ch3hmkA5f+1pyJ1SQut1ciiZuJVr
	 5rSoezlP4Mr/PLCUFmdMvZI0=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efa9aea3c0so71911845ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598427; x=1796203227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yq3uivVkq2skbrTjnqtd+llc3MlOFRYJuIzdaOyLkzc=;
        b=HMnwI8qqj0FkvvPFW6wkIHPd24EzlZVtsoak8BWsfkUyCKSuySmMXrlAcHaZnq4c+w
         V+ogxrC1zrxcW+5/OzXEZbv0PIR6am/6r2wugIMsveUTb4Q3AtgZTPdzXVc0hD4SW82i
         UDnh/cF5pGqlPAWNQqxjcjLkVXaO7npqD4CbUU0B52xVos58Uq0FVUZgAPQgWDuFCBEA
         2kk1Y3lABK63ZfRx8XYN2apv6XZwTIuJ2JO3L+47R9gKsc8NFSLQ25fetSY3OLqR9QK+
         SpgPNAMT29csD4YIdUeUMCHP/2RbN0pBa0Gq88UgViHSHadpyypZZPKFdyf+fX0KWk0U
         Urmg==
X-Forwarded-Encrypted: i=1; AL+hErG/cBxFCELjwwGoXqwNvd9ZAejin+B27i7nZl0fuxdDSyjUM/m/FY981D/gofof5VyHT8P1U+NPN2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eNbZ92UcUQuursSRPBf+VhPJl2f1WK/xi8yfQq7BOXzGkl6Dk
	efQcpJrP6pQ6r+43o/hoCZ0r2TdtAlvrulmCa5M1llMwKUrrfQdB8kVtiKF5/ygyWJ0wlXKXI4D
	5bmKTf79uKjeGOmb8Cds3PftebDkcTOhFgw/3AhSgRHUD1zoetNmyTxrxWL51vy+CKtxmbsZIyW
	YBeQ==
X-Gm-Gg: AZFdTZdaItP2T45k8y3ZPZ1vXstiqk9HzOw2MIBxpWMIcC+/KtzrFKe3v5fNmVNFK4u
	VUqsMqFDy7T1Iu3Q5MjjWrkfkdwDIefhEygGS2rGr38UndfmyJcf46eq1jh2nF8jiyIMTFIBjVW
	BLizeM256y3aTBYVOSa1tchI0az64rzcVihokNuP8awAgAZNicCva9h4rCYD/qZCZtgXgaVLGsE
	2CmW8mlYSqYc2nfBG2uqlpvTfWlk4E9b4jBVlTh3R9HJ+H/c3LjEovDCT9+REASsqcXBrG9RO0x
	7V3o7pC4qi8P76WPRFckbXgz3zsaNzjOIo+JdBlBV2UzZ4LIkACVZPciLQHVAbREshLlMzgLjB+
	axySXPXAUz6kDWLMSatqZaMT2HzEH0MsjqttKS/t62iAJeMWtxbeoaPZt8dyrMLz0kWdti7kWvl
	iavPTtoG1pEULxFzIdS/TaciPgaKwcPw==
X-Received: by 2002:a17:903:1ce:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2f03f14f2aemr173899285ad.39.1795598426928;
        Wed, 25 Nov 2026 01:20:26 -0800 (PST)
X-Received: by 2002:a17:903:1ce:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2f03f14f2aemr173899105ad.39.1795598426479;
        Wed, 25 Nov 2026 01:20:26 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm42673685ad.37.2026.11.25.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:20:25 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-usb@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH 0/2] usb: gadget: fix max3420_udc endpoint index and bind without pullup
Date: Wed, 25 Nov 2026 09:05:28 +0000
Message-ID: <20261125092004.15562-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
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

This series fixes two bugs that I found while looking at max3420_udc.

Patch 1 fixes an out of bounds array index in the SETUP handling of
max3420_udc. The endpoint number comes from wIndex, which the host
controls, and the driver uses it without a range check.

Patch 2 fixes the gadget core. Since v6.7, gadget_bind_driver() fails
when the connect step returns an error, and that step returns
-EOPNOTSUPP when the UDC has no pullup callback. So no gadget driver
can bind to such a UDC. This affects max3420_udc and four other UDC
drivers.

Patch 1 comes first so that the bounds check is in place when patch 2
makes the bind work again. Mainline v5.7 to v6.6 have the driver but
not the bind problem, so they only need patch 1.

I do not have the hardware. I tested with a KUnit test under User Mode
Linux that emulates the chip on a fake SPI controller. It gives the
driver SETUP packets and records the answers. With KASAN and UBSAN, on
usb-linus:

  no patch:       the gadget driver does not bind (-EOPNOTSUPP)
  patch 1 only:   the same, the driver still cannot bind
  patch 2 only:   it binds, bad endpoint numbers give UBSAN and KASAN
                  reports
  both patches:   the tests pass, no reports

I also built both files with W=1 for x86_64 and arm64.

I did not test the other UDC drivers that patch 2 affects.

The pullup callbacks of pxa25x_udc, pxa27x_udc and fsl_udc_core can
return -EOPNOTSUPP themselves. This series does not change how the
bind handles that.

The test is not part of this series. I can send it on request.

AI tools were used for this series. The out of bounds index in patch 1
was found by an AI code review of the driver. I used an AI coding
assistant (Claude Code) to write the KUnit test, both patches and their
descriptions. Running that test showed the bind problem that patch 2
fixes. A second AI tool (GitHub Copilot) reviewed the patches. I have
reviewed all of it.

Aristo Chen (2):
  usb: gadget: max3420_udc: fix out of bounds endpoint index from wIndex
  usb: gadget: udc: do not fail bind when the UDC has no pullup callback

 drivers/usb/gadget/udc/core.c        | 9 ++++++---
 drivers/usb/gadget/udc/max3420_udc.c | 8 +++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)


base-commit: b0baaf6cbb16bc773d0c76916aac17c44a6cd557
-- 
2.53.0

