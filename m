Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5493932D0
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 04:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786508947; cv=none; b=Y4caMS5orAY4qtQyrAPDDrwu/JV6iV0yhTv02QtWdBi+o70bNJPm0PzEFTgWq0PpwVrX9HLA/Fxn2erJjVxpD0ovdFC5+u6LF4J9OuwwYhi8askTUMallukbyMvqpOd1T4LIQV0Ci3BB4JybCvDOXWaFfUNIg4R7iIl4NHmlLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786508947; c=relaxed/simple;
	bh=ZSBNYkXFwk+NUO9FORdbeme/ZZ+z2VE3xPQqDmvGQlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyPM6zOS9dhcJmbudTEEeN1fJOm8bu7DPi3n8SP3H62cZtJUmpXhOgp3zoprBMZ/7vyqI/GUsMVNnl4+5dSS/htThWNNtOfSAx6uRrVXlsPCJI0QNjkZsaIhveMA/kbu7OStvuvl3TUBD3bRKkeO1mqXxxBBBjoKCUuGMfT9qOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9pQDR8+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9pQDR8+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so552938b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786508944; x=1787113744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBDm4XABT+M35OCZXHfxjb6N217Z59IKvmM4b+FhRtg=;
        b=f9pQDR8+iLobjINAP+0E5AOzcwAdW+7GsdaguuX3GmJARz2+Q8qr2KNIfBKxRScQz6
         uSoJFG3tU24WHohWEUAVqgwDJg8ELkhVAfuxMpU2/5apEZwaKHpKZQKckAooScFjPRJ8
         48++bzqlZK1lZWuHDCc5BJheYAYZREDgOTs8BC+x9v0Jzw751yyZdSFg44UCE1yiJ272
         1PXxEGwDA0dtqdG96nDClswgYXmY1rLs4cxo5XbGCjzEJb1fbnmv/DpVhGYzpY1Qup8d
         RAL597MMEoApuqmdjntAZpUZgriR/95SDFyc7h9OjfTZiZK6G3qcIPQEY1Vri8Lwhx9E
         YOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786508944; x=1787113744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBDm4XABT+M35OCZXHfxjb6N217Z59IKvmM4b+FhRtg=;
        b=VKFgJXwi4PGvDMY9l6JRiYPJJxPWCUJbJdgvX6ddSW0FPdYJOJBZCKo/+RetIwaD58
         GpuVtWYuhsVJsAKlUadn06fwrYqVlsuABOIglxngRgP7oNsfuGPPKC6VNY3ejBsZXAw0
         zvDkTqiQOjt+aCrp6g46W/PRCG+wD9z9/PCfQMH5m8JzzMXvsZIH0IpSxXn46m3l+2/9
         S9JUb72WUJFakm3ZZVKE4Q+GYjdb43eSXNNBrKTU30zlAkos4cIHSHGdJGURnHIe1pT1
         oupXF9I3jo5mAtewOlgfgR+4qseO4M07cgGWFe9CQn98uzsbLv5UtP5DGlL7NLRDOUpd
         e4Uw==
X-Forwarded-Encrypted: i=1; AHgh+Rq63LeXIZU9zbqs9+sXdPZDIFqQR+MU2Y6/YLT1xozzzkYhIgeWVOjUnWRemCHQrVS/oBJ8t15uUWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0FNa+yLh5vjy3TcAZ1U2O404JWujMNtdBGtf7ezFpNe/DtR8
	ImmNs09d5nOZxRNAdVv48oVyR8DHIIXGot519k7K+yy8lmwn2YWKFfN2
X-Gm-Gg: AR+sD13Qy4e28hfOW+oQf6lNKqzuzti8V+t0T5osMhDEUO2bpQlYVYIACWyFNxmcGpo
	f+ooVa9BPsMwc9ibUEzqKtuPEl+2mkvhzQbt8Po3VXAx7fxd04FOvSydlufKGyZksjOrmsIQIZv
	PCt4nYPOV/Wfg67oxgipkfW6djdaNbe8FL/hYgLL9EeqBD9FDrKg00Ak+HhgunwF0ysaTDlpfIa
	020V+jY7Ru5MR1IqLMrfaub7mO1G3EWXqZhVvswEGBo6h2c0nCW8DnmoQyUYwQB94T4ZcYmrreX
	cfe8oJBVXCtpyvLCv1swQIP4atoBhnsTZKeYwdpJk/lqjlQIm4/pL6eMFFwSencQzyUw02jtGQm
	juFI2fGvUxOnLmBXauErvWHPfOI/gGaLT2AUs4STbJpq1Kbl6QwmFdtIsM90oYJWvQ/VbALufjv
	RrBU2s2lN75GCGr3sQM7V3t4tosb05hjWMccZ5YTLfLdkKdxUOYfWbRmdAcJFl5eB2tWY1auYCi
	zbxWa3BqHQyX/nb4QCWKVwgYRH/VtIcZ8lG91vn5E87j4BO7TNaA9luTa0LuHZdrVDyOkXH9l7Q
	2J1l
X-Received: by 2002:a05:6a00:32c3:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fb53ec59fmr2561067b3a.12.1786508943983;
        Tue, 11 Aug 2026 21:29:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1cf41acsm476376b3a.11.2026.08.11.21.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 21:29:03 -0700 (PDT)
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
Subject: [PATCH 2/3] thermal: hwmon: Remove redundant OOM message
Date: Wed, 12 Aug 2026 11:28:40 +0700
Message-ID: <20260812042842.15209-2-phucduc.bui@gmail.com>
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

Remove the dev_warn() after a failed devres_alloc(). This is
consistent with checkpatch's OOM_MESSAGE convention: no error
message is needed after a kzalloc()-style allocation failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/thermal_hwmon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index ec73d03a1e60..747ac87d1c37 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -269,10 +269,8 @@ int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device
 
 	ptr = devres_alloc(devm_thermal_hwmon_release, sizeof(*ptr),
 			   GFP_KERNEL);
-	if (!ptr) {
-		dev_warn(dev, "Failed to allocate device resource data\n");
+	if (!ptr)
 		return -ENOMEM;
-	}
 
 	ret = thermal_add_hwmon_sysfs(tz);
 	if (ret) {
-- 
2.43.0

