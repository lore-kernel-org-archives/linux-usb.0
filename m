Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E42361953
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 04:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786508953; cv=none; b=nZixkUW98oXtCXWgdSxP2I3zyObqLy7lTEGmXm3ruvX6GrqEX0DHpQdPhWOA7NSx4cOqoBDD3C242QcRbrMfVqQ73ay9Tw+GfuQEaNC/cuz1pB7UmtpiJ6Zbv1zEmvb0osbtXp4pNGoh8ibOesJ8ImM3u2YTh/LMlRSrItM/W5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786508953; c=relaxed/simple;
	bh=paXb7cPz84ak9iRT+469yi6R122BTm7k+86ToWnqgxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYKhmjYwc3RA2tBvW9zpm4QjEuOMNSLvIkWKOMHlGQv0szWWWThy5P+Gunmr8BO0rvSGVNR6hfxC7ny6hBxr6QCXgcc1WlSY1H66r6zz4wIQY+wJkNfrAAL0o8LmcPYs9JfrvwqEUMc5JnALzGJJhykOeDf0RfEEVc23cJ4+GZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie0ZCCFt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie0ZCCFt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8484f229529so479246b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786508951; x=1787113751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEJkipxPnylT8R0BXRqJUwVdMYB2oKO4eJNrvtsOxzk=;
        b=Ie0ZCCFt+VnCwT40InHfJoVsc3OV6qbZeOA+1QCJsbaMvm+EoUOkFfktJI6EXnR7oU
         HqbjdyD2J6ZPydPUZ9CEdqX65dPKHhL5iPJCRjNkvIouxkUyYRjRDzC+qYkzPpRvLDND
         6/XGKt6COCMWUvDp0RWft3IPn5xQE6EnMyJAJwhDd5P/yER0eb1gkLHV9eWuc5zpvu/+
         xvlIu+jMxLOgsyfBRF0K6FU5VCUo9v5Tz4LfFgl6RbmioZzSVQaTnYj6QPUiGsC07Ggh
         wt9Gs8jFBrXfdzaiC7nPMfSP65y2n/Wxir9vwZimE97MM0Ff33LfaErJ/eIvOi41TroF
         +RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786508951; x=1787113751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEJkipxPnylT8R0BXRqJUwVdMYB2oKO4eJNrvtsOxzk=;
        b=qWeJPmZSoIt01JzFIw9evJVwrwW3Z3bVvKR+lWVipAtg7dncRag7Cd0WLmIzgMuveu
         btZwyVVkIb6x4ssjrP+gmZkVGrbK9g0V4+iDax19UnkoSOLYFKEbSu4Br5NM4rY3vwlb
         YCDwSlZT1w52azvJ98vVg6h9mJhZXOxXcUFci9V3ZjS2GUNuMi5k31zM0TupD9wj230n
         rMha2UW1MOpBDFO6jBWh/GI39C6dd9KUJ9d/2goZO1ZTTA2byXXaFF7aiGQKx1HAYbIC
         HoSSxntGh7z2+FaIfjEgmhm0MAjU56CVkdccZyuoW66zvo7Ka7zrVdGLDi0neUj2n5Ct
         vzeQ==
X-Forwarded-Encrypted: i=1; AHgh+RotzZqw+kOzjKCRpMTjrMtP82sKgCNWkKnhgCXeZsSW5g6iN7j6xWvUoS/Rqb0MnVQku5W9/8CW0qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2yDqxterTdf6svYT7tfa7ov6zwPM8ElufavVxKnOmVPI0bYXr
	na5HzS/gDHsFPibUHqN89TV6w2eHvPfDADDjcthFyWCyoV1ye6TlkkPa
X-Gm-Gg: AR+sD13p/n2ylC8VtMcQniDkqaAhPZDzGIS0QLbwsbouBhdqugnV2bGRf4WIOErZqOH
	Cm0iZ3SPurJM5o/4dCnK/sTTGiL2pBqm/NeDF8wWzXynICtpfazYI74ZXiOE0i26HakiF1N3ppb
	b4uW2QjFPgirL8zIvlxcgmj3eI4Ef2Vw8VstnMCaeVSSh2XFFJfDTxN8g8/8sjfKfyNsBnbL6TZ
	3G8qVJuyWFd0lZiuQY0EZ8e01mJG19LhQfidi/WbtCFhjv3OUr15vfCXnz8DpcFwsrSis0LDG16
	f1+AZb2BjxFSH5uysi5yQqu3+uE/INoZmomiXKqEZW4u96hodkCrISy8BRQjzDbuGqOMj+Ky0u1
	fgmagcLIJJ5w0gq0N4RgHrDvRdVg4+uVzu3iB+K0LI93l8Q9aeIZp/BbuXGtzfM6G89m1ySkoYU
	6DXII4eokZ7yjj5ojJiO8qWrmqgEyHGqejWUIyp2LRDzmssOG7dCnnkdP+pvBMm9IOaiNqaqjv0
	06luy7s3LFpN7spMWtk00OxAjAgIkRPIZBynb++69MFTc1GB8LxRKR05w0JMZScjsv818+DIF2w
	vwDYlg==
X-Received: by 2002:a05:6a00:e05:b0:84e:24f:2667 with SMTP id d2e1a72fcca58-84fb53c3629mr2470608b3a.8.1786508951128;
        Tue, 11 Aug 2026 21:29:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1cf41acsm476376b3a.11.2026.08.11.21.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 21:29:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] usb: phy: Remove redundant OOM message
Date: Wed, 12 Aug 2026 11:28:41 +0700
Message-ID: <20260812042842.15209-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812042842.15209-1-phucduc.bui@gmail.com>
References: <20260812042842.15209-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the dev_dbg() after a failed devres_alloc(). This is
consistent with checkpatch's OOM_MESSAGE convention: no error
message is needed after a kzalloc()-style allocation failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/usb/phy/phy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b9353f343..117a33fa9e91 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -534,10 +534,8 @@ struct  usb_phy *devm_usb_get_phy_by_node(struct device *dev,
 	unsigned long	flags;
 
 	ptr = devres_alloc(devm_usb_phy_release2, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr) {
-		dev_dbg(dev, "failed to allocate memory for devres\n");
+	if (!ptr)
 		goto err0;
-	}
 
 	spin_lock_irqsave(&phy_lock, flags);
 
-- 
2.43.0

