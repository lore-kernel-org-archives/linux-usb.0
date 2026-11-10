Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294409;
	b=Y/xvEAdycXxBoixmkDWi9CPw5pOq0mDY2Eojo4mNQz1rGC6mP6A9UQnG+EAOWAu6gWBa
	 7NEpHRiUyYgjeFkDQXzKNp/OlQ6TGs/IGqHPxSXxBySzbQ3PhZN4fRYZchN6PL6cOJXS8
	 9gabfhOM6zr1gQynBPJwQpKri+ELOESSbeFD4oY3RgkFOpHkTjLI0TQUsIo1kRqE9aprb
	 rQsqFY1IurZHvwUP9+XxIAMrmx6ksE0VHYMXmFhPmF8Lz+/PYeBjveZoyCQCk8Sdjgljv
	 7/cWIkRUQH823LZEBoGTlC3KU4UTtyRN7xQzQZ9jZ1ImuFC3gqonSN6y9o0x9VTsM0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
	b=vJgLgV1MSqBenB8quNo+nrQGCBktpxywR1Wl1qtKje4TXLm/bX2YbMZe5i7lXnJszN7+
	 W75nnJZYtqoDOMvUNhpMvhclQ+sFjsfG66+2d6ThXf4G/rzv6rJsd6HAQVqXNbFMZKe1e
	 8jYiwHYRUfqwwqpusQ5yfARutdZ6NjeJDQEMZOsSgmjzhJLNUMuakbX5yuRJ3j/N8yTUo
	 CVD6ZjPbcsuqgSVf9aFa1Ud5kIhzshkGTKLkRNRIkSTr+g0ca5Cxk3vATtjuTwJwyCMQS
	 cLWvvq/vyNIexmvSA2FsoV/HcfikkqfoAtecEwQEFC7KR+gkdmx539IUzmGf2xz4kBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC69606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso1571432b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294408; x=1794899208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=xur0yAYhREMTd55KzyJm5zbg3HXoHVb1qk1JhWPSqNWMyhGSzmKR/0NOqEfdIcTGt0
         032kXl//6GeRrYO5qabzdcEi8jRvx4DVKz+MNvgE/1lwV+fx5cQFmDjKq4RUmRtrZeUQ
         Kvaq9CHdh6vGjJsFmWKcvF7/EAB8A983xBzQ/6y76Cr7kR2XCMWDx1EUsQ2XVq8CGeT6
         kqaj9pDmn5Xu7+u96+GHsAzuG5w1pkt7iYlII3g+7Jp44BWV5xvUqQpn3jLqzgK4HT7E
         32Y5YB7O00VbjWH4JbEY4HOoCWPn32OeG0vC4vAGmYyrPu3Cqpy+MIoFVqmyM2gpmczD
         fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294408; x=1794899208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=ovTTzQronyDIvJyiBBFC9hxWhOxr7P6sngzYnM98zNmmc/G8+aOatrLvYHYbCdKH9/
         PHJLplCf57vXTNRD3DAu3cOdT4RReU6H4oj1fVQlawKwix23vL4Sd2QH9VFlUV2Ee8jP
         vmTGwAUiGmW4rAxuZRd2OUXHg9/ElJyB0AnwZA/95RyAaiZ85wP2Ze1K3t8Aj2wRGkj7
         NLm9FiBFjtsQpYFzZlMhLxD/Sco6k8H29CIdwhlJxqc6s7rKIVXfkj52W+Tdu+RsM9P3
         sOshZQEHMBgTlWB7tDbEZfNyKo03JT2v/yocbuZV067/KihsKfEmO7FL4dbuaDzrgxOA
         vAUw==
X-Forwarded-Encrypted: i=1; AL+hErFmL5+wIBu+B2T3lrWQfXLYrqKhlKS3yeNoz9ZJkQEtlmsg6F67SM+dmCZALHH7aK81S1OibeyfdL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UsumNcDfEn7WmDKdtE4DOxz1E8I7lakeC04Bh0jzPllo9MwrX
	Aiun5zmJzow1CmWVpQLBJUuc4ikmOxt1Y9hB5OipoyQ7aHCtl0utac3G
X-Gm-Gg: AYBFou2uQX7ByK4jmTf8+6YelwOxXO10zFZfT3MTs/cC82OsCcHWh2HNAStSIDPKAPo
	sMWQh/g6G/KdGP/zrhR3qyUwXLgS+BW3A6btumJ/h85DDZeZo7oXFq4VJ2Hh84OlEpBdznsvli5
	lFdJRZ1RhpRrvQKPGlSsthD7bklnuj/skucAe0ykXlwL/qgODaVfr08WrASgpxCeSktD+u7g8i8
	vnVUnsYlOPl6UO8oKwYa7qd385WwApXdhWU8kcz2ak2nuQIKLqQfQu+5ks8k1jZUiDIw+a4Wo3y
	D8U+Eo/p2+uYqwCdr9IgFyBHlZZGezvjpeAqTepFOXPmFwZnZ9zfFnGM/u6kpI4x0aQkuaxwXC0
	McqKmBruYOy2hh0v/tXt89i6Jj5X/LEpTNeSIawyoOHqjZb8kKVBhfojSi0CX1zNKE3FkyNs9jB
	1nXrTA/QQMXyBK5kAp3ene7CDDc2Vip2vlYRchRIOIdPF52nBQId0cg1Rh5pCcQmjbEs1YsU5pT
	xr69WSjBU/xi3XWcD7xNnSbHydg+gqQMfPbqYn1990AaTmDyWgM3cLEwjSOxKYy02TXsQPFe5z5
	zUSsVxXIjO+ow86AenbImota344=
X-Received: by 2002:a05:6a00:1389:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8ba8725e415mr1910547b3a.38.1794294407637;
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3f3e7sm511794b3a.40.2026.11.09.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Tue, 10 Nov 2026 15:06:21 +0800
Message-ID: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Inochi Amaoto (4):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC
  riscv: dts: sophgo: Enable USB role switch on Huashan PI

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 +-
 drivers/usb/dwc2/core.h                       |  5 +-
 drivers/usb/dwc2/drd.c                        | 77 +++++++++++++++----
 drivers/usb/dwc2/gadget.c                     |  3 +-
 drivers/usb/dwc2/params.c                     |  1 +
 drivers/usb/dwc2/platform.c                   |  4 +-
 6 files changed, 73 insertions(+), 21 deletions(-)

--
2.56.0

