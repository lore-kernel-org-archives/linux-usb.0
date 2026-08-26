Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CB3EE1E5
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750652; cv=none; b=ZKMGcmf1ildcmGK41RdavvXzf28s0FpljB+1qrbW9bWdPQnppuwwuSMDdXYh8EmKBrnmGh17F15OIQXTMweIAHBFy8vNYCarqCvCfu0nUFZebxCBnyi6FSa5X9lSAVM9jepWoZPJNg64AaM+QelZ7ifJPZkULojkOZKB8R2Rw3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750652; c=relaxed/simple;
	bh=BL86GUv2x4eWRcbpalPAXQx/D9oEM6z1d21vv8etw3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLb487qeFmKkUEkXzr8Dtwk91XkFYW+JjoH5c3XWcrTlXVZzTe3+u/4kIFx9txkgUrWSHnaFN+sJJtJNiNpTeJnp0Aj+4bHv92GSRcEd+nfzb9XifMOGsQgmh6LrlGvy9DoVo8deL9i4cNtyXk8E5Xgd8Lu1dtY8e0GCPeRHg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdO20yTv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdO20yTv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c252cd2b3c1so70370366b.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750650; x=1788355450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=NdO20yTvvO7SLchcNREQFlELTxHXaaZDDcum/ppRjBiBTslwR0uQIDs9Xb44dwlBkh
         rf2kXbC8Vi3ctUU+WvqXhuY/zotbm/kEw27ZQWrMnvAdDlxlTOsck7lZ6ZhKWihHpXDW
         NaHzyqPNJ3HPWFYDDEthJ/cr1UK+NimTnm9PijA/6wTANmVKu07oDqnSULgDXl10uFJw
         E1NLjm147Zg4LGWUF+zt0wWxaS4O1fzRJxqhkAenR6ZQmrY2L2TlKESt5YBR32i3ack7
         8967e8r5yABNtwcq/dMkQXvY4hZt//apPcXYJmIwhC5aRJKy8hq8eHehRP+3CLIkDd3n
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750650; x=1788355450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=dNYQd7/mqjqtHTdye9CJ70qF+yvXauVpUwU92NwNMqNqlU3m1/KRVgsyC0/HPpWwYa
         aj2JpH1aksPxvD94zKk7E440B51xa8IQukC7Fnm5mxBS1Ct7Ec47wAJwbc1dzyPfZu45
         /FWy31t0muHQVqzadgcYhRs0O345m48LoFftbGY58inCZZMr1EA2ZR5xxIlcxksQi7UQ
         0oj0hUIq2zcnaNEpREvBj5VCdVJzvDF4Hi80eNv45JlbjX+fAnHfCx6+P7WG5luJ4RmK
         PcYKHB5smLF2SlM8chLGCNfO9bes2et3S76UNqqYYlKH/xem2q0kz6OoGb8DPsUKOwCO
         T9tA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3vuPrODVHnIgIdUlP9st2KcFpQVOgfoJ4k7HO5nqusRHAEmvlzvj0zpUWS8r45AhJ6xnxDzJc4zo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHQZZi8tGYmT/RAs8X4JqR9tRMyanae251xEdCHSAx324/6bDg
	pXWhcRUSpy3pBGg/RMsfN3BM5/xQfhGQ+fBzoGozMXoQaNYvqlOgs7MI
X-Gm-Gg: AR+sD11JeVHeLx8hU4emVJAiDtas4j0H34jWghD/dfWaktmCPb3vJb1AoQaPfuoQlg6
	rhYH9qmkFLmxms2m08jMlJSTknIPSEcuP2T97r73UIHxtJ/rLoCepS4mi9WRSR8VcFY8fCbGMUz
	z/I9I3do7tD26M8dsD/mP2Fk5GeXVlo1i16h6HUBejGhgZfKwMuQvWBkcYnhex166BEQdmvF0w9
	Kbf6hthTsz4e+WkIbSDaJ5MBeKTRmyrwIB+l/1TFvsP2nWl+dJZTfPgABzj/9qHolsHjZeYcie2
	uFS3wUQmj6g7gk40J1JUc2NxjUinepYzC0Pw3Z1QNOxbTQVwEFlkhw6wc01aLBecwwbEJQ8outW
	j8hwncCAKn+yBPjM9TJHXD0HTs4COfg4ZLQ/MC/zarxv5oqpW11pAwftDgZU+wyeb0A2IXbtEhk
	BlYz4iEXF5iT3blIMztRe3LRAUnxukS43UeOHwhpJGxr7DJjHmkrhAdODvk9R36+Xwx8Az27Hiz
	sKhRrz4Rpz1RSbBJNNtI8LDgLvjQRdWjlX9zL7MZVE=
X-Received: by 2002:a17:907:728b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c250bbe0e01mr814991966b.7.1787750649485;
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm648518666b.39.2026.08.26.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 0/2] x86/usb: Add Yoga Book XMM7260 modem power sequencing
Date: Wed, 26 Aug 2026 15:24:01 +0200
Message-ID: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L connects an Intel XMM7260 modem through a
Cherry Trail xHCI SSIC port.  Firmware exposes an INT34D0 ACPI device,
but the modem requires both SSIC controller restoration and an ACPI/PMIC
power sequence before its USB boot function can transition to MBIM.

Add a DMI-scoped xHCI quirk which restores the SSIC vendor state across
setup and resume, followed by a platform driver which performs the
firmware power sequence and coordinates xHCI runtime PM while waiting
for the runtime function.

This is an RFC because live XMM7260-to-MBIM enumeration and suspend/resume
acceptance are not yet complete.  Feedback is particularly requested on
the xHCI/platform-driver split and the ownership of the SSIC sequencing.

Maurizio Casciano (2):
  xhci: Restore SSIC state on the Lenovo Yoga Book
  platform/x86: Add Cherry Trail XMM7260 power driver

 MAINTAINERS                            |   1 +
 drivers/platform/x86/intel/Kconfig     |  16 +
 drivers/platform/x86/intel/Makefile    |   1 +
 drivers/platform/x86/intel/cht_modem.c | 418 +++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c            | 114 ++++++-
 drivers/usb/host/xhci-ring.c           |  31 ++
 drivers/usb/host/xhci.h                |   1 +
 7 files changed, 581 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/intel/cht_modem.c


base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.53.0
