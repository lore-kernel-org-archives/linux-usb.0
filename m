Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0C3F6C39
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945339; cv=none; b=ckkBVmESfdVIVxAa7bQMVbTkoBK1AMQe0NJU0PHOv7NpG2U1YNhZElfKCnjgTkdAaEG5uvSpjmZLnqz2L0XMONKipqU/1JEuPl/zbWfS/bSIVQKdQmsAwhpZoPZNf3t7nLPvoarIYeOQ88AHcphK2sajCeXkbABufOoOJWHZE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945339; c=relaxed/simple;
	bh=i9revy8VLWe78K5LwwdNyDtoNiNQUm0Tl8IJOkz5m7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKA6FvCbUuOpGVS5oOZkJrmLL1M6hQDhtUJCJXM7vr9aiqnpus84DZ02d9vxzU9dYielk34wuLNHFAxNj0ah/np2ed9FpyUpRS4SzweaNtownPladtrm9CcLSsqIO+ePxnwtWwW00OrAdWef5yV+K4DCrx2+CRmL40xHuNy8Jc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=aB5LYk2W; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="aB5LYk2W"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848882fdb18so2175353b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783945337; x=1784550137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9c9AJztkG4yGnpdMUHH4Rn3KSbRLamlzTpskyxVmLgU=;
        b=aB5LYk2WGNReKmF2qBfiJIJ2pG4Vqw4cB9Y9v6xYnkPQlsDNpX0RRQoVSQyNd3Ue0K
         SFA+1QbV1pTgogfBjO/LTQ9/82sgEcIuVbWmEO5HaAzQu0FlQzZ/pviUDVtiZbWEuKiO
         swZheZeY/xM1K5dRCQIUGx3Og/hCKGvJygZ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945337; x=1784550137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c9AJztkG4yGnpdMUHH4Rn3KSbRLamlzTpskyxVmLgU=;
        b=Z1vqDCHzmoecOmq5gWnR5lFT45IgRoYqxAR5S6NT1TXPYy0kt0xuPOhjKbXGWFo9rx
         YUJ2M9J6HW2ccjka7oIrsipFk3EHlQIBYMbztGmDqgDGVcVCeWh/2gS2oOnvFyLkQABt
         A+ZEZy6ZyDL7p5/9HhJPrg3ZMOS3MiZbzEjT7up0+YmC4Zsr1o1fKqhqUiAWqlGmRlQO
         BsSL8kEoOyZodGMbADE8OFydl+DWcHOcuPQW+Nl7eLLqrWM2U3Q9MS0GCA6N4l1Hg17U
         16CLxPKoER1DzNxmpcBCEGzmpMm9ZgWl/Ff7qe8o+7fyMzW0KFPb3iFTc61CfRngM/cu
         wZ1w==
X-Gm-Message-State: AOJu0YwwmqLdMtO4+6+M7uKvSmeb8MO6R1gFUx1JGTa30NviCJXKfDpZ
	hEQ4jQoljmjAsORdU6BIAU6wC6REweP7NxNvCOhLL2JkdMQsHkx6LUMQfRxG2WP3uGw=
X-Gm-Gg: AfdE7ckeoJZRRJz4JJK/yS0fYDHaG8lPl2Hd0sPpamkB1FkYoMCZml+HmAJwJKdL7N9
	h1sVcngm7wTL0sMhdercd5GrqM+zznDvbMVONrfOwp4UkzB/HaF6choGAZRXUwB/FhUh8Nqiei9
	wnqXqpmvI3fZLFxiJ8H8kmqdaFbhHdYOrGE4M7vWZ0AjEU5q7y655wk8T842dQAopU4c6Lzopbq
	vRN8BoW7TCkP3zM/XO2NDSy2Q7D+geETX/MeDvfWpPB1FmCCFzAVTkX+FSOw+lqMFT8sO5YPqqJ
	z4WTjKChom5dNbOBZKYz28vKuSvR5aNfgBnLLiIEdqBP9q/wQZaGkQVHF/Pr4t4WEajEeU9zaOY
	kX+M3/KKeaEMeETH1jmV8oY+n4aDqTUuM9vPcG1NEa26cWuGXUljFYin8C+kTQTTVtD85ocOfF2
	uZsJLWZUvedN83wv7hjiD+3nDFEQ==
X-Received: by 2002:a05:6a00:3388:b0:848:420a:9cd5 with SMTP id d2e1a72fcca58-8488974a28amr8798261b3a.53.1783945337436;
        Mon, 13 Jul 2026 05:22:17 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm8126216a12.31.2026.07.13.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:22:16 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 0/2] usb: ehci: Allow ehci accessors to be overridden.
Date: Mon, 13 Jul 2026 21:22:03 +0900
Message-ID: <20260713122205.1350933-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the kernel tree at the moment there is a driver for fotg210.
There was, I think, at some point a driver for the host only
version of this too. With a few tweaks the host part can actually
just use the ehci driver and a bunch of code can be dropped.

The weird ARM SoCs I have been trying to mainline have the host
only version of this IP and have been running with a modified
version of the normal ehci driver for years.

To use the ehci driver we need to be able to override the accessors
for the registers, override the standard locations of a few of them
and hardcode values for some things that are not needed.

Before I clean up and send the rest of this I wanted to show
how I did the overriding of the accessors and how it cleans up the
hack that is already in there. If this way of doing it is acceptable
I'll clean up the whole thing and send it.

The benefit of this is that we should be able to drop one mangled
copy of the ehci driver.

Daniel Palmer (2):
  usb: ehci: Add option to override ehci_readl()/ehci_writel()
  usb: chipidea: use the generic ehci_writel override for i.MX28

 drivers/usb/chipidea/Kconfig |  1 +
 drivers/usb/chipidea/host.c  | 17 ++++++++++++++++-
 drivers/usb/host/Kconfig     |  3 +++
 drivers/usb/host/ehci.h      | 31 ++++++++++++++++---------------
 4 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.53.0

