Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C483446859
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818088; cv=none; b=ghT7eVdXFNtK5oSQCyKsoz0Ln+3Y24vleJ6wuePtUIM4dI/TWW0pbofEdbc0qHB2dOhO0nk43f1IgbEZP/eU68fLEC9pgbxLWYmJ3mBDkbjkMjTrbqaOKjVQdplJtF/HX+nn21F9RlWkkwXFcLoarXvBIDz7GL6NOI3Z0v+QA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818088; c=relaxed/simple;
	bh=dSgp3zWwSjr9wqGRxsOA9TZ7pvQN36MEudn4AjbW3aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDZe2XgkiGrFHEwc4ZQoadD9RJ20fak7diMxe+/jOrVgTVfpOD5yY1qgIe/0JVTsp19ihYdXMFXnMHRVjtsPTnTpq6iacKvZBdJw1VWs3+hCe3SXsk86c5Jz6HKOx6pgptOW8Xledi6Ev5VtbHVpdwhfRIzx+Fh998IKZ0FB5ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOKxDYex; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOKxDYex"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8726acc5eadso26725887b3.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818085; x=1789422885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yLPkFJQmuAEoKFXhrbZigHnjiojakFwcy+wMysCsSc=;
        b=iOKxDYexOWdYt48aqmNLAKaaI0hZvjQuto94utzuN5ThUmbbZ2fVxpT2Wnkj8dwKQj
         KwMzAUnsE5RMpeNTZSZmYVBcPjjAL1XzGfLiOUOGKuTNa+QZkShNHNoHvpmrdVeh2W1w
         pUn8ItYuGmey0EuLVuJF9XGiIB3xzl2S+071wu2TNsqIijbQ/G/QsUYS77M2nj5PHwd+
         tz7nO+iwpDrHCSTCroJ/MFEZl7hhTUNv2ZgFJrcjVmR/rTOoSZEId6neXikrE88OBHV8
         zEboIv4oewBaOE66t3DG/ScdJZMEaqBe2jeMs5qolF/9AxpJlUmMUl+UtllkbvnASGLr
         MDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818085; x=1789422885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yLPkFJQmuAEoKFXhrbZigHnjiojakFwcy+wMysCsSc=;
        b=ZsOMxRf91OflEDrJnRv5rdTCG/t8znTw9fyEihQ8Z2EXKwug537S3PqabbTTPK0VRg
         FckjIio8takiDqEi3LlHL6xekb6dqOZIV0mrLIMttUyoFcQcMqD69BkuESYTHIT9jRX4
         O5jfIpQMTNQxgh9BgXdxhv+sFCAA74qhTmIbibCcNSeyo3PR7S8q1R5XtxC3Cqxs/tV6
         C5HCOVdomw9RzE6H+XtX0G20SyK2qMjYb//WFUN8j0QakPsjOFPmhH+lg3gSgkaRlzxg
         CjOAV8EVTksxe1+CUV5gzn9kQlqzMtpEEC8c0T77RzYNX6rl70Z7+kOAy+97uOH4kDYe
         2TDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG8ZssCv1CxVlf7P2E6v0iYSxFbNkEaw9j5b1saXNnulsXsSG+2xIudBpiiSkRbziB8odtKP/2DAM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKYKsap3AOXgwB1AotUMx+H7VeTfR/yq9zH1IRtESfW3aueYhF
	D+MzO2TLR+ezWVHcnCQzzfSxCVkPNemGfHzGjv4C5cBqydZI0aWqFRzG
X-Gm-Gg: AYBFou2SW0VRpjljX4NBLAbk5oxrISxbSX27bVZizWNGGdy3dJgOElHfmAJHLdtos4X
	i213L6EGmD5BDnO4vxTEa2yon0l6zK5ZKL7yBt0WEb5/lOiIqRbVX58rYm/scfrqaxbqYnGM/Y/
	chyNB3xi+eeyIKjuk+dSmcPQfevx25fymku8LJuL9Bx8IxJVpDzJFNbUlr9fMD4NTqRF2yWbdrX
	4iXmY+3qnwljDDcYiqL2GXvXMkRd/G4Nb3fghnE4RzuP0kDL2G96aeGe0KeVscdHAbU1nUe8gME
	vKQwFrtnD0gZMtJf/yQP4UjaGDqDZNr/Ris3o4VO8JI89yJP2k0abDZ/ePiYDvb2H6cpY5WsOSr
	kzyH6O0Mr8hW5xnRljRtYGPSJr+xXSRhb+14qZOCWjRm0YwVml5CcisKp65o72IPVB25h8+0mbE
	5mic+DjOpn9X7lUwdUcGj4aTJaD9lN0y+LCJoaG4qbITj6F+Fh22BzTuZ0hULlPCReS94OFoZ3M
	tBUc85eW/8Fu3BX7g==
X-Received: by 2002:a05:690c:698f:b0:81d:6af3:b9b5 with SMTP id 00721157ae682-87125a1c600mr104053797b3.9.1788818085373;
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315127sm78135637b3.10.2026.09.07.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
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
Subject: [PATCH 4/9] ixgbe: use linkmode_and() return value in ixgbe_get_eee_fw()
Date: Mon,  7 Sep 2026 17:54:33 -0400
Message-ID: <20260907215439.409858-5-ynorov@nvidia.com>
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

Use the return value of linkmode_and() to determine whether EEE is
active instead of scanning the common link mode bitmap separately.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
index 36e43b5e88d1..a7b7f89f29e4 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -3751,8 +3751,7 @@ ixgbe_get_eee_fw(struct ixgbe_adapter *adapter, struct ethtool_keee *edata)
 	edata->eee_enabled = !linkmode_empty(edata->advertised);
 	edata->tx_lpi_enabled = edata->eee_enabled;
 
-	linkmode_and(common, edata->advertised, edata->lp_advertised);
-	edata->eee_active = !linkmode_empty(common);
+	edata->eee_active = linkmode_and(common, edata->advertised, edata->lp_advertised);
 
 	return 0;
 }
-- 
2.53.0

