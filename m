Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ED448CD5E
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611702; cv=none; b=W/PeG3F1A7GclcHP/ziGD+uaQ6bZ2KG6jcs0eX8Gq0ypna3dnMKvlMr2nT4z8+AbP8lKlF231WVk5NDDnapW/NimriLj2gmZOEi1mKD9GB4gn5jrQnQBbK/aIMrihgOOcK6RfKxZ2U5Q6sho9lLIOx6oULRI0gQTOWGiYbs2e+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611702; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IXsAnaPBDt1FKAM/W/c3liOGzFaCag4odKrZjTeraZCGUKGrc+pMUJtMob15X1aoFhvLhTChqyIHGEH8pGm/h4V1Sivan52HJAsQJROwQP/kfDVKwINRmNxP4Spi1ZGt1uLfwkVqZkgUC5emwHmQZlLaceX93hiGvGC81eBwUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtbnSs8q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtbnSs8q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso18347185ad.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611696; x=1789216496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=YtbnSs8qfPdzgH+oeRaodn+q8Vb2tox19c9H6lxT0EFKc+LY1/TEPedO12k3EV0weq
         ZubHW2aMvu5d9wRdvZ2JZKz7OYJGt9lSYnONx4iIPgTgklB3Zi9nQUeDscBHQNI2nipN
         8PAydIGehlYBeD+FYQjwg6pUJGFz8Zv+UkkQ3/NrLop+gj8ozrTjmwWo2IbPI+M0RoI2
         BN+5/uzNIMcpl8wO3T4RqLVBYURIS6zQbCgT+MIiipkpQV3o9deat8Ivesk3Ege7KHGV
         agTdBI1D8e/AHP9rHdTaJMom7wYS+xvDGlXRUX3Io89bY3cqjDkY4ewjOrVt3ANdSDC6
         BPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611696; x=1789216496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=gY6xF0wuFIF6BC/1ELSbZvZmzl0KT+mgEryEh+VAml5IJBqniHisFPA35eWhiMzutT
         2xqx0zAGwYJW1gxg6TFxm8WVnzTKdhyubnU2Ys5tjcUrqLzoHdGch7iJxWoZ70XouQsd
         RsxBNh3KT1UoCzjWsX++NOJhLcQ3VUWNctwwTYDHSw0ZFS6Vn48XvcILEkHxGQbiiyuJ
         3VbfmJL4Zt2MkrLiddVPm5Z1bQUFXJu6UHBs6ZpZsz5TPfpeY9Q+xcdE33kkVW7eUTDe
         GSYsm4vgcWaMgl28g2fuvOQ7dqzQuZ8DzsXc9Vor14xQ8tKVPsixcCNmTgm8agyMS2oS
         Wilg==
X-Forwarded-Encrypted: i=1; AKwUvBwbSm3obBB5OTvCNJ9kvS37VPClMLsRVyFu5AGr4rY4Yh4eiYOGC0Fyx6Pnu8ruQpbxjvdDhoeVwhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6tFAI9jNe8aTBrae6RkNU5GrhG2JtFX4V5EKefTqRzSLfnKIG
	SkneKEYrTC/YEaFofAG/jrj3leZd5gmQY7i9pvWnNwESaQl/kyUarSC0
X-Gm-Gg: AYBFou05CsLT1pG+M133GMgGYEIcgD4otWM7uT0Zb67LkCeLdHnty+mmGtMtToXJ8iL
	zH7x0RfbHyuncLwno3WgVuvdtsmcAbKWcKj1MZOnu8nY62v0SM28r4MVVQcW+mnXZ1GR/1IpYIB
	CK5e1UkrySTQtYoxErDGVA6f6bGdcVVWYDk6zdbKGAO8VHJtJNnm5/FGmsrLjUMBKb03HGBHgxS
	fvlJFttOzEn14PL628O5Eh8t0Pbigy5UeUUQ7KDG5F7OLX4lqIzXo/X5juuRDeK6vKqgbNarv6Z
	Fis/rQfErlSaOWaK8ql7iL2sohreBMNX00z1fOcIg84sJedEK3bFlNKCWfgiPpCnxVphJJKitxV
	CBGbDFC88iSLXGFyYfNx404yLvAiLEHs+bYnhRFRLM9Ov3o2H6dwFca+lLstQuRGFxra7wM1MpE
	DtyoRuG4QWAAvOimG/kOJN/p0ZQCYiqUx7ESOivRicAwgZEh1RXVFSb06MKgYSF4NRpFhEfxapY
	2u88+jWVP6nyDC7ixL6KBWEWfP083J/
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr17366120a91.18.1788611696373;
        Sat, 05 Sep 2026 05:34:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 1/4] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:34:47 -0300
Message-ID: <20260905123450.5620-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

