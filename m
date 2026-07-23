Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51748D87D
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832448; cv=none; b=ozUYomEzZIZeYmYY2aPl7i+KJCe+z2zBtLVgSBf+qKcIm95UFaUgaYlF9vHR6pkbzxmHmPYgfxadjTEQWRfjIi3ibHom1Kch4LOm3IIxD6X64N6FfQbQsMt04G8NYQTM27BKlnPQIC9Q446L5LuSZawJUKh0a9Zf4pas0GAQyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832448; c=relaxed/simple;
	bh=dCC2It8t5ngYjhp2LUzJWM0HuvqaBLSMX1+wrSZKJ+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOjpBv2RJj3QmmNG146q74ucbnJTgs5687tRYK+0UpCqUEinKN6FGF4HcTvBs00DhlZ+jLAThGE2+VjBzfy9yEYw7fCsEiow0sNcRlI3YytZVEYc11YsnzqeXpmlt7oTQgc8O3RQsm/6wX09+U7P1F/niUn1fzB7nvGFoKO5r6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpq9hLLH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpq9hLLH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so945152a91.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832438; x=1785437238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbSTvhrvJVaWNbYcerAizGhExjCM7xuViLJbvyJxqsY=;
        b=Wpq9hLLH1vYJks3QmCuyFJkccrysLBesM+BZ+yNcWOqaY6PItW8BtoiHZh/QoegryT
         mYDQdP1QW8hqLnDno49eHJG1S/nJKQGZFT7p3SPVrur1IGXGypO15xNQOLXn91mLRKHk
         AoPXbJByrIhMbM6YetSupYoQLMJ2YQQrZruB8drHLVwBR3o7BBEN2SAmElBPyLNqABb2
         rMCOBAflr4j5WCL+/HESN16zduHsxZKEwR1m3zxg+U46LbGtRfgF2PytN9euP3vk0Ra0
         +r6AqKzPMB85CLrd22x6SBHqOkg7RRW/TsdLfAPN2Jy72i7ek2xpKv2uoI56QxNXZCYi
         0z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832438; x=1785437238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbSTvhrvJVaWNbYcerAizGhExjCM7xuViLJbvyJxqsY=;
        b=oon8YNJmyEJpA64lfzIKCu8wiAjZ6a+W1K2yKXHT1o9/xw11ziTUC8C7bb6OOCA2tk
         syNocfnpRmxTtUyg8fd1WYO9IhHrgbZAoK5IWTLoaDoax854B/hnsCGNDNJTlEx2ODKF
         1m2WMlQDBtleGvbMIrC/6PJTZmGqZGVFKXNehpWxbqf4LQoTTnXeJepaPWLA033az1SJ
         3LlKbLosdrSVp0ZgDkVXx7WI44TDOf94FSF2O1yEaYEP7+gwOLHDfvEk6m+fWG/fkFaW
         G8wKXFokVRH2cLJwJzvEbSalq4UD7w5yjJVXk1p4TWhMwVRuoGxbP0/XCE8GGU0eawTv
         0xMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC83xD5rGE7MNgUwty3tsu4cn3mulrdBGptChUK07QkoIYw0MgtgrJDgVhe9w8a2AABRWFk0NDGX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNs8yLo46XnGvT8D/oK609ASxa1IGVx8Ix6bcXOi/fKWEQRXZJ
	c7mmkF1+hHn5vPffoHR3pQnj7YTA5uol0S5RnXIhag052ixzZzmWveSl
X-Gm-Gg: AR+sD10dlPcpCF3kVWHCdNSnHCns9Pfq4eRjFOjFTDvwQrUONr3/T3wKT37Md/VDWqL
	ywC0ZtqOoO1ftsa96LCP+GmCQTHzJD6qrm0EXzf9cEasF51kqyIvl2iFlOV9aY+HyXAgTl74hZw
	gEYEEwBUzHdV/SO0A9O6evZFJ9uT3k6Vj0Qjd+FCx0IRMrqMTQ1+/pjhyvoC8o5Y40j00pUkd1E
	HAWJxLCMN3aUDZBOBleJUPNOU8yZ3TyAg7f10lJMYnjBnGHUdoOdiIsk1TI5qqsGRZkT5tW4Wgs
	sc58y3Or8K5O+XkdO6tjsCJWNxbhJR/RG7mbX6RrCps8s/cqq9/DmQrYFbjxjXXnmRBISnLTJc1
	aIPvABC9YoVkz/6fYBellkB9C+sDECclRvs5NYtVIuI7GK8qnr2MiBHoZ2fZB7eASr/lENoo18t
	om+EZRoSE=
X-Received: by 2002:a17:90b:1642:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38ec6a51c61mr3940118a91.20.1784832438557;
        Thu, 23 Jul 2026 11:47:18 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:47:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 33/36] usb: typec: fusb302: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:35 +0900
Message-ID: <20260723184538.3888637-34-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..d0ab247b24bf 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -314,11 +314,7 @@ static int fusb302_i2c_mask_write(struct fusb302_chip *chip, u8 address,
 		return ret;
 	data &= ~mask;
 	data |= value;
-	ret = fusb302_i2c_write(chip, address, data);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return fusb302_i2c_write(chip, address, data);
 }
 
 static int fusb302_i2c_set_bits(struct fusb302_chip *chip, u8 address,
@@ -375,12 +371,8 @@ static int fusb302_init_interrupt(struct fusb302_chip *chip)
 	ret = fusb302_i2c_write(chip, FUSB_REG_MASKB, 0xFF);
 	if (ret < 0)
 		return ret;
-	ret = fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL0,
-				     FUSB_REG_CONTROL0_INT_MASK);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL0,
+				      FUSB_REG_CONTROL0_INT_MASK);
 }
 
 static int fusb302_set_power_mode(struct fusb302_chip *chip, u8 power_mode)
-- 
2.43.0

