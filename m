Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4B3CC9E9
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818085; cv=none; b=Rz+mv/lZ57OjA54UJNUMHozkk4I8qnLVbtN4ELmL3mUQCssvyW4+TnxG84tA7DuYFVL/Mm94EyRsO4eOh6qgOjAbNJyCfq5wS2MRwOKxfLcuVc6RXYi/iTa4rutaVU/66+2UdtLS/f0/Ox6Z6mRuIPM11EnoIXPQl1Ll80U7JUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818085; c=relaxed/simple;
	bh=N2ns42t2lkowA7Fk1OVBdhHQEf1nFZ75mrokscC9jI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IT4Us57BmQZCJHPJIS8E7Mw74XNlshl+8UjP98EtZJy5W0mnxGVUO3yVuci+jBM6Rj/4Br5csFakkPXUXscSU3QymEDyLC9Xf69OveOMk7sViiPKaXdQouCnEJd4KQoQMi+NeH7ulcalwVg7OiyVoMPuJRVb34wGB1bDdUX7zHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESc7aepS; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESc7aepS"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-86d43cdee51so46880527b3.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818081; x=1789422881; darn=vger.kernel.org;
        h=content-transfer-encoding:f:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwpffGrF0yp02BONayMPau7nafrjjaDgDJ94lomGBcc=;
        b=ESc7aepSBuly/9ppsfLYBRYJLWl3bY6U3Zqi8NERXRZXHTQtkmGORKatwI9JFWodCT
         Jr2Upbd6VVDQnbKS2KEl5dDCWsTK7KmSNUi0u0yO9qqpIvtEEt4I3c9lVTF+NT7Y/hte
         ypD97wM1OKM3oE2v3b64UPmW7wUc6HuxTurJaqolOZ3ulgLDMqfwu0yly09DormaVeIW
         6UmuFZqQIC/anicxTFgsVJRT3iFJ4QMpqQE7lvu7DlDIhTMWRxE0PoQryv2K0VzakQ8Z
         OZrhwaDI3b3kR633Qp6SmeuupwQkm5/h76TC5KzPQxN0fyNOnkcBcPMSUv7gqCehx+TZ
         sKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818081; x=1789422881;
        h=content-transfer-encoding:f:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwpffGrF0yp02BONayMPau7nafrjjaDgDJ94lomGBcc=;
        b=IJD1Idg4tw3j7RT706ECTq9ou2pHHevnoW17gH8vtGqEhVFz4MZYAWXk7fUBqHuHUS
         1ldNtOpsBB1s2g3bgU71/ZRH0derSJzkqlbsHVMjqckktLTKimDX6daJK+0LkV8k+263
         wQEiq6+5R9Kr6yE10yUaphCSz2upyAbWl1LkhnDjHV3SZYWceeRkHc3OBUYUu6QG+VhM
         n1XH4RfTSpPfVh6C0UbzcO/WaJwsHuT52tDtHI5pC+8x3T8+gwopn4YbwKuTkTHPicC6
         F8Oviy+d1eNQJ6FZNG1Yg82kth7mAXMSyBb+5teJanZNS6DsqTg4+4k1SJUfqeBUFMCP
         Nlew==
X-Forwarded-Encrypted: i=1; AKwUvBy+gczPB+/MQwxZ5KAvciGrIhtEd6+aZG8UqbvG23joL4ISjHgZHF6lwnWFuM2iQnWEjLKASp2mALY=@vger.kernel.org
X-Gm-Message-State: AFuF++laWLCyO/SbaJ2+24fzKbodSMgiwyVbkWTPeyzfmi5fc1n5mubg
	rwqHmfswBaukEEW/VCAK2ojvPUGTVPJcEBoOQXcXemTQECY3L2P5yxoA
X-Gm-Gg: AYBFou2chp8h1l1AeUnJXt1yp0hjK5GsyHVkHxeWVQqOctH+iOnANfdEKXKFdAvU92M
	e0WI47EmWyvLBQSbaVzOVBBtpi8jybRj1JpyMC2dxKngo2woJ7vrUg7C59YegJ5KCW/R3CUmund
	uxLyK0mgqnZRL1JAb1lG03NbW+OgKtdKxiqGYcSon1aGmkBfeh516HXAGLC13to62PLYIp4u7OM
	XI+sW5e4EMAiBqBEDbbQBNcXBriGMj9WUUGXNZIehT6GNyWXA3QI4NB6yKOhKH54aL0Zh2ITWCn
	GW1Z04qeNxalv1RxTZP50k1TYEr6dknNHeM7/wRtmoS+euroZMNUKGDJeF+2NvQcrWZBW4GC8Uk
	OXXPlb6BOJ2gwh+wVCcA/Zc2fIZO2iaksOhZNc5G1OD2wMiBf5wrzUx8Hp48DHJykAfmAynYudq
	wjPYQmybDkzV+T8gZBnjhTq9dgJ6sout2U6xctZ45hc8qKJ+a0emzYlVFLni8bBCZ5TdIPgAU4J
	TrQJDNxjt6a3lKPrg==
X-Received: by 2002:a05:690c:c509:b0:873:5bb2:6c21 with SMTP id 00721157ae682-8735bb26f1emr64757207b3.40.1788818081486;
        Mon, 07 Sep 2026 14:54:41 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493168dasm78139017b3.11.2026.09.07.14.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:41 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/9] linkmode: better use bitmap API
Date: Mon,  7 Sep 2026 17:54:29 -0400
Message-ID: <20260907215439.409858-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
F:	include/linux/linkmode.h
Content-Transfer-Encoding: 8bit

Several linkmode users discard the return value of bitmap_and() and
then call linkmode_empty() on the result. Propagate the return value
through linkmode_and() and use it to avoid redundant bitmap scans.

Add bitmap_and_and() and bitmap_and_andnot() for callers that combine
three masks. The new helpers perform the operation and emptiness check
in a single pass.

Yury Norov (9):
  bitmap: add bitmap_and_and() and bitmap_and_andnot()
  linkmode: make linkmode_and() return boolean
  net: amd: xgbe: use linkmode_and() return value in
    xgbe_set_link_ksettings()
  ixgbe: use linkmode_and() return value in ixgbe_get_eee_fw()
  net: phy: use linkmode_and() return value in
    genphy_c45_eee_is_active()
  net: avoid copies before linkmode_and()
  net: phy: use linkmode operation return values in phy_device.c
  r8152: use linkmode_and_and() in EEE checks
  MAINTAINERS: co-maintain linkmode.h under BITMAP

 MAINTAINERS                                   |  1 +
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c  |  9 ++-
 .../hisilicon/hns3/hns3pf/hclge_mdio.c        |  5 +-
 .../net/ethernet/intel/ixgbe/ixgbe_ethtool.c  |  3 +-
 drivers/net/phy/phy-c45.c                     |  3 +-
 drivers/net/phy/phy.c                         |  7 +-
 drivers/net/phy/phy_device.c                  | 14 ++--
 drivers/net/usb/r8152.c                       | 10 +--
 include/linux/bitmap.h                        | 32 ++++++++
 include/linux/linkmode.h                      | 21 ++++-
 lib/bitmap.c                                  | 46 ++++++++---
 lib/test_bitmap.c                             | 78 +++++++++++++++++++
 12 files changed, 188 insertions(+), 41 deletions(-)

-- 
2.53.0

