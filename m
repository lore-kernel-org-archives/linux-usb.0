Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EF35E948
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131490; cv=none; b=JnyEQh0ek3GviJ39kG2yKI7B9SQ0hP8VFySRJmx1zNM66Tz1BaTnAHoKloldI2ZJAyoLtl9VqyylDx8Jq1bxVGkvfOW9WrTIJj3NVItGkv9gsP4N6ZKeS+q2lmh6dd1YAQIcrs6cm/SdiI6jw3jGaPB1U02T8MlsdAZiLMfxprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131490; c=relaxed/simple;
	bh=H6RNI7iJD7HplsXPYXrV92tgr+rs0lz6O8B6ZhGH2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r4BOyKHLvDKycZGttZuUy5bNbguIMRYkf8pdpN/cDQ3OFwuafZsSaCDGHU3ImvXOJXNSYz0lg6s4QLrdzSfF1Z1GB3l6+v2c+3t2sMgmhRCqP56tbyi8Ho6jtueF6O0R85eO2cs0uHs4wCFMUCh2eBDUyhhBHJzTgi3AEpI5UHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlDVNMT2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlDVNMT2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4908b92904fso62894525e9.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782131488; x=1782736288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOS6Zt8GQJgwWRUMY8O/sY5TwBUoVkVr7zd/cVT+/TM=;
        b=OlDVNMT28lyYEavcdH0JnSRTIdhUI89g7oJXTCS63QCwx8bvbIQP0cOa5xdgWIyIpc
         auYMSRpuQjvoMYBygI9zxVol9hT0baAOW+g+yUk6zbPOtrMdOkq7a86J/tB+E4LYYoUw
         7LTiHU99jw/WziJWkPelyLokLG7h2B5qwupFSlG4Jb+AmtOdMBJPa4h8GYvJI4E9IWwk
         6nj8doF+fTXrNZhz7f3CM+1cP4c481Xz7jS+OBTzDeZ4oSTVWsMK4lj5lTA7QK4HkRda
         BQaHI69Wo+r6PWxZpWmhSqgLcHBeSNpgT+l8YjOm+o6E1/CFE+Ssw0TCVJ9jhrjUF/Dp
         0o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782131488; x=1782736288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOS6Zt8GQJgwWRUMY8O/sY5TwBUoVkVr7zd/cVT+/TM=;
        b=Ww6+giPtbVQuHlroU0jjFsnv58KY/jpZLefKbV8Ev6jdNtlWuhhgkH5N8VWF4Fksjl
         GgXKSdaD2VgCA08q2iKb+a7X3rp8dFQw4vwp+LmMzwnRb0EQO/Z3JNp5fEkqgYs1OE5U
         FSFh2nO0uVHQHypG56/AFFdWeT5w42zi3xWG/n8H8BdK1dnZ22mb+WYiXFw7+lCz7Zcm
         g5aybzpnXAnkOTWQzEfjCtEKeKiJ2rhWLFTp1QFkiZ1BnPZxhvuO6tV9i2+Jn6E5j9zT
         c9dAVP8TeLTKYuijRExvpVPZlYxK6cHIrI5HO2uAwcBUMvHi/ONsdVdeuSpGaX7l9vaB
         uS0A==
X-Gm-Message-State: AOJu0YwPGL/oBivICodJxKCvjkqg9Hp5EssxUkz+gCJ6WGP2msVSx4o9
	n9u1epquHnS4mXn+bJox6PVL5iDxq0Qj43zB5mAlyL7kVCjhD55PTwt+
X-Gm-Gg: AfdE7clkb7F/gR30ybQ3xp6lPRb90sEw2iYlgtr3YZQ5QYkdoFAyuuPlpcIQQwLWwr4
	KKrbFHiLJyHJ3Y1r7gokjFoEp4OCdP6b8jES/giw1qbO4tUCjvhwegME/cRh52p33BKZs+JMDb9
	vjkHYZ4CRUfEYisGZXzz+vt3611gmft0CNsgw9emmgHEIZrBA6WwG3BvSl/oSSMO88lalAe6ebb
	s5Ss+gm5eeLEaytRSQ3A3ifOeFX+NW/y0fJ+7/Ddqs6980h9C5FY2YhoIWcceM6uGnEsPQnasNU
	8fRdBogmyym00SaW9nrwZTEVY87u77P1D3CyMpyys/WYGkR49EHleKd9jzQcvxyc6jSLyAe2wJW
	ji82R2WAcS2Doll1/ki1vXTN4JOLgZl2KnyHQ7cyB4gFAmI8p+6TV7+u3kUpc16WImvTtrdm9sD
	R/E/oJ+3u5Ds8u24Wky71cKU9Yl0gbgCfhSXpZsXZ4X20Ln801XeJXQJ2k+ishDKqcFBLEMT5z
X-Received: by 2002:a05:600c:3513:b0:491:ba04:2ce4 with SMTP id 5b1f17b1804b1-4924253367emr194616315e9.16.1782131487688;
        Mon, 22 Jun 2026 05:31:27 -0700 (PDT)
Received: from 192.168.1.39 ([196.92.41.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221da1sm25448020f8f.36.2026.06.22.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:31:27 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] usb: misc: cytherm: replace deprecated simple_strtoul with kstrtoint
Date: Mon, 22 Jun 2026 13:31:24 +0100
Message-ID: <20260622123124.2380612-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

simple_strtoul() is deprecated in favor of kstrtoint(). The old
function silently accepts garbage input. kstrtoint() returns -EINVAL
so the driver can actually tell the user they typed something stupid
instead of accepting 0 and wondering why the thermometer isn't
responding.

The 0-255 clamping stays the same, just with proper error handling
in front of it now.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/usb/misc/cytherm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index b183df9826bc..81de3fecf3da 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -85,7 +85,9 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *att
 	if (!buffer)
 		return 0;
 
-	cytherm->brightness = simple_strtoul(buf, NULL, 10);
+	retval = kstrtoint(buf, 10, &cytherm->brightness);
+	if (retval < 0)
+		return retval;
    
 	if (cytherm->brightness > 0xFF)
 		cytherm->brightness = 0xFF;
@@ -217,7 +219,9 @@ static ssize_t port0_store(struct device *dev, struct device_attribute *attr, co
 	if (!buffer)
 		return 0;
 
-	tmp = simple_strtoul(buf, NULL, 10);
+	retval = kstrtoint(buf, 10, &tmp);
+	if (retval < 0)
+		return retval;
    
 	if (tmp > 0xFF)
 		tmp = 0xFF;
@@ -272,7 +276,9 @@ static ssize_t port1_store(struct device *dev, struct device_attribute *attr, co
 	if (!buffer)
 		return 0;
 
-	tmp = simple_strtoul(buf, NULL, 10);
+	retval = kstrtoint(buf, 10, &tmp);
+	if (retval < 0)
+		return retval;
    
 	if (tmp > 0xFF)
 		tmp = 0xFF;
-- 
2.54.0

