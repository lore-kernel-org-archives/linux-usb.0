Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615455;
	b=e7M/nxXUapxXoU+sRnSboIPibo+gxF2VPeifCeA9zYrNe/iHQOIlFc5ypd3s/b6kgof+
	 YQYnKAJW5LHmTq5zp872Ks2l3TLPfR6N0aiD9MDPMcNPsrlGkfaVpN/+R/ITxMNG40oF5
	 fOECI7F9d6sBnxDQJE9saNCIJqjATDBaNtLnE1qkwNcPMoxMSRT8+lZl2bxkDFYGG3X17
	 WYDvD/B0o+AghaLNdYRwZjpILyvicxyVQIOgpgn/PVDdbbROv9kZ1O+h6s4yo35uxmIBE
	 UXeWJIlcS6o60i4lvqzMutVnAS93kJXBoaw8FVwMI+AloTZ7cGCX839ZpYllvcCJdjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fAuA/NwyQoWzRrrOIGIxihxYHzq30khQF7LCi/xDse4=;
	b=NThZO6ea8/vIgzeBLcf6WzoXUP3ZXN+P3JMZNl+cEanWwXmTTYGGMlLutekenqkjnv9v
	 sUgg3P7FIaRZvJmA4WhjGn73urOuMnJz/vpzuFFgVFQN5/oDkWoOjanDuoA9j3/JsCx+s
	 iv/gDUv1obtgWvH6nl8bFfECmNn0DCAw78vBwjHngwVj7Y149GjO1r6b3WPshICZ/kgox
	 B6jvRietMU/qIQpOYnbzphYkZMbRKyGvW2NYdiihUNlcA8Auf5UX7sHvxhvEZJKFFgEu8
	 C27OsGIpavj2bCcq7iPqndg9zSfK43LeqzeowqtGKcW3kixUdVAQ+xc3VL78gVGxYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NYsd4TN5;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A222606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A222606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NYsd4TN5
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5126505cb3so747876666b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795615453; x=1796220253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fAuA/NwyQoWzRrrOIGIxihxYHzq30khQF7LCi/xDse4=;
        b=NYsd4TN5iTuAqCaFH2pxsoHG/1X5PSMDj4ZKdum1E79p07MKhc1wkMiB8MLdfaFDVE
         c+nc3tLNllpVagIp3FVql5Sl/zTZAhURPyn4j/PmGa/hmSIuT5NMDURZc8vKNQ9sLZqM
         KaW6qvFcnzSYzowfpal4wjnmGXCApHkzNIuhGRuRESi+P6GylOg5/3M7sJZXBGEVUJXm
         raLz5iizB8hYCTem5p26lORz/F7fPgURy0YRUe2nXQSEqdZiZGrqTmVAqceVxwxy/Xf2
         VW2nHLB3S9wfrEXGnQJ+KAYnxdged53MhpyFOnXmdjjUe+tGP19UmzP9u/zERj9ZuicT
         aSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615453; x=1796220253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fAuA/NwyQoWzRrrOIGIxihxYHzq30khQF7LCi/xDse4=;
        b=QwhoJOZUU9Q0KgZ1c60xP6iiFcmKTFTKsSCAlIict41ojqbzNiTxs1ZLeoiKV/YFOQ
         JCZwTtNaQzi7zWUNwTszc+DrUin9JiZ+fMmQtpklRdu+ud41g5sPfAMooLOGIB6pumWV
         ZDKJZvYl2uOgAzP5JzozX8Zx6iU3GbjE15MpjfHvkhgI7ke96hY3ry8YX478urDqubvT
         7CCYlYfN5BTAX3vzBSvzwixPRiKL0SUmEfn6bgnVd+T1T6/kwbhvRdenPZV9OvAYSi7m
         a4u7chW8OrF1IGeTk2nFp8bTCqvfwBWb9oF9PseQEip6Yhsl0Q1n7TkvxeoWUvx2UGYs
         Wlaw==
X-Forwarded-Encrypted: i=1; AL+hErEU024gE/D6rHNa0mukMmJPomxoR9x8CqmPLY7kRYPAJhlifXXVgpYTFkH1FOwvKCfMfpHk9Xq9rNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jY3Zdlg1whP6ZMeEjNUrs5xqwkLQLXRBZlJe06ic1y5IR3uqo
	/LqX5inO4rmDl7i73xzVtGBE38J7CYw4SDFQPhEQvw6bLCtXOr4JVxfCGHgdIsmHTrkpxLJonUV
	p7psxHNWHEw==
X-Gm-Gg: AZFdTZdhG+lhHeeM9d1EVNeieyCzUfU7OIPeM2++Rgr9vNl/B99jCRpsFuNV5wMFaJ5
	Tgg452cy3a5YA1Gv/VAFghD7PYV1GNpFamt6KZORDIfBWn9xzCfmQlKh0BhMnTVOlau9UFVqxDK
	SGcxyjfIhkCjexTwNwk7owV5NPdcrOC43RBLiF4sh/vOLNJuiOku+I8c10nFEcEP4uVSo2yuII6
	6gtfUpcGJbfxY1u2Hc4mR7KJe7o23rtSv800Fn9nncu3KlHHjZW9VFT5IvPYXjItK667cH7wGXq
	f7PVg4Zhiwd6Tiv0052jyxahhINRsBmLEy4Wq2QBvsmC4HGMqtxH7PuGVfd6dJhv1bcKI/loAt1
	WzxJLyVegxhrPLK4WJESIBgtogoKxoXnvbPDfPqH2SGY6dipFSJpXkS/E7ukVMO7AQhpKwOQGwa
	5ghEbPLerSXj7SDMw2s2dYFJwVTFdIbCQ0aBbL/eXtuA8bB/Y6/bhQA3eyJFuiAaaHmoKUTI+BN
	gwa4uzSW0TyE+ew/XxlYPI+Hk0rsYNj6jhtgc4Mte2z8WSmmtP44Stc4FxVaxw0GutK1hhbk19S
	ScRlW5xA2hyIND5p5dxlznOOEYU8RhJeZdnQSf3vKXn9dHblX/PFy2DWiUSg7K532dl6iZfcb4/
	FMfGRMHpCrj6H2uJoCA==
X-Received: by 2002:a17:906:785:b0:c43:ae92:9ad with SMTP id a640c23a62f3a-c513a999796mr1200824066b.17.1795615453300;
        Wed, 25 Nov 2026 06:04:13 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm627741866b.0.2026.11.25.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:04:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] usb: typec: tcpci: report BC1.2 current limit in
 tcpci_maxim
Date: Wed, 25 Nov 2026 14:04:10 +0000
Message-Id: <20261125-tcpci-maxim-bc12-v1-0-656e01201efb@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANrqBmsC/x3MPQqAMAxA4atIZgNN0IpeRRxqTTWDP7Qignh3i
 +M3vPdAkqiSoCseiHJp0n3LoLIAv7htFtQpG9iwJeIaT394xdXduuLoibFqnQlhbGhiCzk7ogS
 9/2U/vO8HSmdYPGIAAAA=
X-Change-ID: 20261125-tcpci-maxim-bc12-49a0ffb71d26
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Hi,

These two patches allow Maxim TCPCI (MAX33359 / MAX77759) ports to
report their BC1.2 current limit when attached to a non-PD Rp-default
source:

- Add an optional get_current_limit callback to struct tcpci_data.
- Report the Maxim TCPCI BC1.2 current limit from vendor register
  BC_STATUS1.

Tested on Pixel 6 (Oriole) with SDP, CDP, and DCP attach and hot-plug
as well as USB-C PD.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      usb: typec: tcpci: add get_current_limit callback
      usb: typec: tcpm/tcpci_maxim: report BC1.2 current limit

 drivers/usb/typec/tcpm/tcpci.c            | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h      |  8 ++++++++
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 25 +++++++++++++++++++++++++
 include/linux/usb/tcpci.h                 |  5 +++++
 4 files changed, 50 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-tcpci-maxim-bc12-49a0ffb71d26

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

