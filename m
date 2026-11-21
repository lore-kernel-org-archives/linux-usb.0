Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266454;
	b=421aQ/zbXSeJUBbgecuw3I/Z0tK1rhLLUQN4pYeKYyLcWOw0xHg0XRcV04NkliaEmsJx
	 OyqplOSULhR+4ER1zfz9gcA0O8iichpTCV+/XbfJPJFILuWQGSW0ztz+rqOCt+nMF+wKP
	 Y9+d+UG9ykLQOYiR2EJ9tcB3kcHTH6I9srofY7c0cc+KIPsWg7AcsdGA10/r317Grqm1p
	 H9Kx6+jTk3InTcEdRBCL1JQ0/onntvBkg/F/QWA/q/peEjWosxEhzKcwqID+i9g6r1Q1J
	 avw+xfLbWxR6k8FEIxVHDAdN6yI7AeY+xBO8UO9geqm49O3G50ufGFhtNfy7ECmvD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266454;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=xqK7f3+IigicNuFshjKnlC9DMmy7rusRWxVM3uANEYU=;
	b=w+lMcngaSE69DyY6ZFXO4yKOuaoArAJep69o83a9ifSYYNAmNU67hvW+4Lz5C+2P+Vb0
	 4b9t8rjvb6ARQkYZibEQftkPnMeWOU2etFmGVcuR0Ai7IJVwVjXEbwqi/wtQ0C2dnKaCU
	 4qNoXI4odAIboT3nnfnBQyXMq2iUdVipb3SsvsIvYj34QcppxDpM0BJwhVozQPlGTnlO9
	 nZ87rGSsBbQnleQhvAv2k3nXnlPgd1ODNcQOzVfYfwA+lV3UXNz75Qj9QBTNrjsDGGT/4
	 fp4UgNbJgQWPw8I7CZArd9UUIzL0XFTLrSAr3s/4HeSqB0Yrq83NOtM9XI8zinmhRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=RUvIYAeT;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CF606A330;
	Sat, 21 Nov 2026 13:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C9CF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=RUvIYAeT
Received: by chaosmail.tech (Postfix) id 1D5F21C8555;
	Sat, 21 Nov 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795266444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xqK7f3+IigicNuFshjKnlC9DMmy7rusRWxVM3uANEYU=;
	b=RUvIYAeT25KYkCrztMpR4VSMmDKPBGTFYDTMuQMIMcWFd1zbLi2PseEFIWEX6j89IXk3c4
	5H5rHm064XKP0qI6FjE5tBvvfmgrbHy0wEz+4VsSfZjaRT33QBPpnDa25Q6ed6RtIXajgt
	vYbmDbWln3RkomneTgqUqcx4BuuVBKY=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v9 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 21 Nov 2026 14:07:19 +0100
Message-Id: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23PzU7DMAwH8FeZciYotvPR7MR7IA5p6rAgWKe2V
 KBp7046JJaJHC3797d9FjNPmWex353FxGue83gshX/YiXgIx1eWeSi1QIVWOTRyyadBhsgklVd
 9Mk5xMl6U+dPEKX9ds55ffuv5s3/juGwB28Qhz8s4fV+XrbDNtXJXkEo6Kp2BLFAXnsol4/wR8
 vvjwvEgtvAVa+5qjoUDaeON6wdLpsnpxjsFNS+PyY4IE3IMOsUm1zW3Ndfb8b4zpgejPOgmNxX
 Hu+2mcEKteaB+iJSa3Nb8brstnD34RD54Ctjk7sY9qJq7wm203DOCp9Tm3R8HUFTzbvvdqaRRI
 zhD//jlcvkBOqDD/nICAAA=
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266444; l=2831;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=LTZ69I9arCbO6avvu9EgzDAj2AgFYbnOZK4kFi9TXMQ=;
 b=kJjAbtLQ5nvVl7yZEO+1ZXKCcQN5URUBWfZNmLaHXedwDE1+wnG3GZR4zQA+d75sv4PGj0uco
 qW7HPA9oPe/Dwjf+DOPD92kolM6gkqLi5RvNZAyBIurXXKX+As/XcHW
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v9:
- Add the new no_mode_control = true
- Improve some error handling
- Link to v8: https://patch.msgid.link/20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech

Changes in v8:
- Rebase on latest
- Link to v7: https://patch.msgid.link/20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech

Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 .../devicetree/bindings/usb/apple,sn201202x.yaml   |  78 ++++++
 MAINTAINERS                                        |   2 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/tipd/Kconfig                     |  21 +-
 drivers/usb/typec/tipd/Makefile                    |  14 +-
 drivers/usb/typec/tipd/core.c                      | 248 ++++-------------
 drivers/usb/typec/tipd/i2c.c                       | 107 ++++++++
 drivers/usb/typec/tipd/spmi.c                      | 303 +++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                  | 132 +++++++++
 9 files changed, 710 insertions(+), 196 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

