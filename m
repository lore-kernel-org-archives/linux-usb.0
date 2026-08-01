Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD23546C3
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785556789; cv=none; b=BIPCi0lXPKZl5tD8kH9L8uix6J7LAyXdXbRJmq00Ne0Ery12HI6/7yG5kykSIjqKSUgy5xp1VcQzT9PhytMssUCHEqJdpHGMG9OwytkuJH9+bTer+UCvdd3i1YYmrIHlVKXt/z0L1LvUyQozMi4GZTZzF5CKRYyISj7cmtbACWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785556789; c=relaxed/simple;
	bh=VkQMmcdU2OxJXgzqlGVZnX66U59+4GjFZVlRptupx1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsQEznKeuAayGVblHoqMjKDL+c5zIG27mO9O9184sBllUymCNISnyrwKN6zerivsF3OXG39WVKy2bFEAibyTZGH15uPVMwZjzHbcR0TS4Y3P6UiBQUP/25l52+ipbIK1n0X+kJApD8C2XpSmNIUDBwz1ArGYD4BfZ8GWL7oIVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3viuEQA; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3viuEQA"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2423592b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 20:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785556787; x=1786161587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkQMmcdU2OxJXgzqlGVZnX66U59+4GjFZVlRptupx1U=;
        b=r3viuEQATaFvhAe0Hlb/QBw/Apvkp4bctkviwZd6563nSZXTS+FBsA9kvc/kF8bR+L
         RgkH9JlT2ooNJYCj3xqnkOw3drAAopxd96bp6KK0FEfV3T8QpG6PBk+6Ljyc7pSn/Y77
         R9jriWUf5lNciJNow7uSpG56ePn0e0ItGyjDIdYFkbnOxU6zOibroajrM/cbxkXEwmAZ
         xzXKATecsvns/t3Z+dE40MTaEGujjbBtF0ImHK1x9k7KEDD6+Dysqcfxwxr1mSwgfzd+
         kK81thbI2bXotl2ioBuWCRw8zUoit5ej3FKJS5cpEcA6BA2bI0atLfzIktQyUETnhu/7
         YafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785556787; x=1786161587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkQMmcdU2OxJXgzqlGVZnX66U59+4GjFZVlRptupx1U=;
        b=g60AlixwqxLd7no6Lu9Vql0L6MBV5wtVRvFmCJdcejh2naAb8i5AW/bmq8P1VkxlnA
         /IZdOLmFoGNBMF5eMCczvajj9Epbl7QEeiSV9rUJU3Tr0tPXH42iMEBbM/E7jcR6nvS1
         gYERWqjEB7xWx80COPpk6AIJYeusl6aHYsipMBnLJCzRtbw5KfTiFNRauhM4yTUxbci8
         MiJAG4jgEZmJfZr9pfJY27jU+Fk10VNHG8lDqZ9adkXVuBaDZNF3teyE/RflcUtg1ufN
         +99D3m7/TulxhrLu8WBFTIv3RF9z3T3VZZ9nYrRVdDyFbBTG+oV17s74DQb/G4135elu
         mBrA==
X-Forwarded-Encrypted: i=1; AHgh+RorjFA6Uz9qgg+Ot0Ily9p4cEakhfDHdvwAjif7OHmVoSa6nCnM6MJQZntpq6mLQ9mDkaaEVJGjNwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaIagxLOwbH57G6N90L7o4DFyzUoWWhQyvWsFC6ovHNg/tRsf
	IXStpfOhatZ8CdWzc5qAxZ8TrE+Uw6sm1YT5wmVUzdWwuqxCzHdLcxLO
X-Gm-Gg: AR+sD11PuYpia41DYFSrJU2MVuo2u0OGCB6eTiYJ1XR5/6vvD8NWJGgLkcX5oc2b2kZ
	k44u3kmkY6ZPZUQCYJw2+SGI2cjkNthyoTiyg5K5oyJIAMHn+2F56HBZGow93Pr1brXTybxm/X+
	bIfmFeZbqWmjPaX1br7irWvBVKoEy10cQC90cOGHTX4DqOl+kCdfQe5BXotwnr+AeQxtBldNIbY
	uMLou9rIZAmXiZoL6Jct00MoBDnGCL4WOXve1ebAtFCS7q5hfahHT8qCg39n1tA4Ty6h4tyX7Fr
	+G8bklUtzr6XwxUd16ArMk9r87wF2fQ/r8Iv8shojkxsiR21ibIJATe0qd30lgaAqClMfMPoqtV
	18EASwEPIIVEyfaxV2eVqh889yrQLn5F3gErvjY8UZYyVONtDxOuqlt0eddQSI5qNq00z3r+90u
	O+vxulhLisXegv/1IJbwR63zfC5A8JZP3eW2sQC54+eiNi1M8MR5GTlfaU+QO2/Nv0dmUEL6dk4
	g==
X-Received: by 2002:a05:6a00:4b06:b0:848:46ea:bbe7 with SMTP id d2e1a72fcca58-84ee4813a67mr1969176b3a.19.1785556787195;
        Fri, 31 Jul 2026 20:59:47 -0700 (PDT)
Received: from Inspiron5409 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ee1b049e5sm826657b3a.58.2026.07.31.20.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 20:59:46 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Jianhui Xu <neuromoments@gmail.com>
Subject: Re: [PATCH net-next v4 00/12] ax88179_178a: Add support for AX88179A-based chips
Date: Sat,  1 Aug 2026 11:59:41 +0800
Message-ID: <20260801035941.3307404-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731-ax88179a-v4-0-2cf1f71b1dd2@birger-koblitz.de>
References: <20260731-ax88179a-v4-0-2cf1f71b1dd2@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested v4 on an ASIX AX88179B adapter (USB 0b95:1790,
bcdDevice 0x0200, firmware 1.3.0.0). And it worked smoothly.

I applied the series on top of net-next commit
df13c1df8147675470213ffff29dd5762fa321f5 and tested the resulting
7.2.0-rc3 kernel in a KVM Debian guest with the adapter passed through via
an emulated XHCI controller.

The driver automatically selected USB configuration 1 and bound as
ax88179. The MDIO path bound the "Asix Electronics AX88179A" PHY driver
(MDIO device ID 0x003b179a), and phylink reported 1000 Mb/s, full duplex,
autonegotiation enabled, and link detected. Driver information and read-only
EEPROM access also worked.

DHCP and interface-bound pings worked, and bidirectional iperf3 completed.
I also tested EEE disable/enable, pause enable/restore, module unload/reload,
ACPI S3 suspend/resume, and QEMU USB detach/reattach. Each recovery test
restored the PHY binding, carrier, DHCP, 1000/full reporting, and traffic.
I saw no AX88179/PHY/phylink warning, oops, call trace, or traffic timeout.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
