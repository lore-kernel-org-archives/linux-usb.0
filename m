Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB33E49F4
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818100; cv=none; b=Y5QmG3Rd5yOzTdy6OAfS77lPw/Tt86QBmwCLKsBN62MOS0Z5XKi0fgnFEAON4H3NYN2cFXD6bQ8Rcdvq6m58tj8ujfZk348i3EvUhqxMY8C3YFcpWSNP1xLxRyy3Yd3M6CICbQS7dLIN2uWVjM3cAJLx0wN4jGsT6sQWzm3gj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818100; c=relaxed/simple;
	bh=5QSvUUBEwul0t3wOfYWCRctJgwUlnqFBztayCoeh9K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4vx2qtLJSYJKVy1VnlgumhwyCgjDtKOK5lwr+NycvKj7Ox7zskP20pPOLeBcYsExZf4jo0rZRpX9CiKz8gcpVqcCM7sGd5sMDkmYLnMVObob/EcHi6fMcdgMTafA8gZG4IiJu7jHrwU96KcwikXvCWE8gXtTHOUIuXTBZg7dh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghWEb/Xn; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghWEb/Xn"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-865bdc6ed72so66848037b3.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818089; x=1789422889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb2gmiVIlb5vlxpKkwwNuzRtWNaOFk2YDHgZ7G5RM8s=;
        b=ghWEb/XnNyy4QmDPJ6GZIOY2NBsnV8RtAhU7Y3YaeS+VYJjDZyvQh6LE2C+50My4g9
         +yXdJphB2Sd2yolBWiyE6e6h7gDNhCjTrPhoppjhQOUDoEnRzIe2bokaeDnDv2tLvIvu
         AIQIQor6M4n/ikeOgcIDVCPlhJq61TvzWtsYGf9Z2HFvkiOlu53dkIhto9bF0aVxK2W2
         wSZi1qJFlUIpX7lM/rAV4JM6odFIQktAV+g4KkvqIrZxrQbDHvu9I9HsQ5FeqPgVeU0W
         hatk3X/z/J05tREj04viygGS+rgnX+c0IOFASyhpJAhkNLcKq+wH/0VHMzjUHDyIaaWO
         GQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818089; x=1789422889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb2gmiVIlb5vlxpKkwwNuzRtWNaOFk2YDHgZ7G5RM8s=;
        b=nxpDwAE6M3s8ZKboci3kBloCW65DgOD0LNSz5yhAy97Q4b44SSxzhmAMIe8PO/Z/bQ
         /6ILIHkPayNN7cxsNQjwOswdsTbsdf637MLsFrY8VZ3cTpx2wkekud0hpkey3HNqL6R+
         5G2oizUlwT4s++rshUYYT16jbHfMzQIcJyRSZvV2y0QbdqIl3UPiVv30SrSyFcSRE+CJ
         +y81xbuDZP8Gw+iw89WYsPp/6NmtcCJFBQJwU4mfggi/q/13Q8sfmjr3JwZhL9mSoksV
         g0HY7Zz/TZ34VYLADuqapn2kDufpnL3sBjeZo314ulYud9Ezd728m/x/YhBTLYF+Edw8
         CimA==
X-Forwarded-Encrypted: i=1; AKwUvBzIg1iBwv9aSftoYtmfPa+pDf9e7i5scilI7Fu40EE2eqI6hsXe19xrwmywCnuC1YJbGG+mzuIwiH0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzFLZCEGTvN8vy53MMfZ8jRNDAS8z8NMMfnbXy2QvXntYUdBKp
	2FGazIxeFGfvoo4afzSv4cmynNmCk7+ATiZ5+/6Oc2hH2xILQ/CHhNRz
X-Gm-Gg: AYBFou3JMUt2uxfJDYLM+/8Aa7pgY68VEg08dRarg22ZdjXVeawC8PjCmMXXzSiXcWR
	ljfgvZC/+tgH05i9nEVqQq86T+Mq+GHqv7FkCY1dqhwYAZqJub1yE1CnwJr7hDMI3GdFPP+Lb91
	dlxOn8Y56AAWLAGBDusmCCjvYtp4FPnGz7DbkSN+yumek1KOWTmyReL5mmA5OIxvmRE+nivlvcv
	PwE6hojNkeEsX08c3fvNS8ojPGd1wpyHwlKrdeKpImBoEbRJFVr7wHqjd+/egv1ZED0F2E0nhyr
	K7M/JaItJFV/ldfBizq7HNrlcZ2lJGHMj65BLKEx25LKeCsej7LCI94HjnH1+fQ39kyG0Zmvi1d
	sHPNeTHJI7D6wZgLhGmD/XR3Tru0nYavSS8wqqD73zGiWFtrsE/Tsy/72SOuESH8MGLKey5qc56
	gjpxs2EIJc62vPe2IDLVM1UIaSDavX6TbuB+hyJYPoaOyz2fl3i+aTkckFTZxH8LUNZzlzc8+Kx
	zaP2FEM/wORcNUkJQ==
X-Received: by 2002:a05:690c:4adb:b0:873:5bd1:98c3 with SMTP id 00721157ae682-8735bd1a0damr49302177b3.53.1788818089522;
        Mon, 07 Sep 2026 14:54:49 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439bcb5bsm78484247b3.3.2026.09.07.14.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:49 -0700 (PDT)
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
Subject: [PATCH 9/9] MAINTAINERS: co-maintain linkmode.h under BITMAP
Date: Mon,  7 Sep 2026 17:54:38 -0400
Message-ID: <20260907215439.409858-10-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file is largely a wrapper around bitmap.h. List it under BITMAP
section for co-maintenance.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b78f0bccff54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4646,6 +4646,7 @@ F:	include/linux/cpumask.h
 F:	include/linux/cpumask_types.h
 F:	include/linux/find.h
 F:	include/linux/hw_bitfield.h
+F:	include/linux/linkmode.h
 F:	include/linux/nodemask.h
 F:	include/linux/nodemask_types.h
 F:	include/uapi/linux/bits.h
-- 
2.53.0

