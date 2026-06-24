Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D173845C1
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281375; cv=none; b=dG6Ymxj7EMDHqxVkn0iZBiTRyqgSlzb1WrExCorFJIJ/PX6YUn8hQYLyYSL5CclDllje51HZyTNZcFzyavCKL3C4v5LZcBPCjWFI93vc6g86gS22i4o4Oshcy24lylL+q0TawfJKKhuKxqgLnZjVajSXKKdRYUzfvCwC3YAFK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281375; c=relaxed/simple;
	bh=TXk4fa3D41VXHM6wPe/OIN5XBFpRyysnQs6Rp1YFGkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6SXIRO1EWw1IiuuUsyeQeOIvU0gLI7wOlH6POz+eN6r3+s5Pu9+AaJlRvp+tFVPvy3QPmscgByqBTo5hrZrqHixTJu1ta2Xt2LvEwS87M0puLcdIbHsjti8jElKxKABEL81CpbyG6jCtdmNvixNqjigW+62iFTJtqRNll3G1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY7zq3oj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY7zq3oj"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8deb37737dso222865a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 23:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782281373; x=1782886173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxAaM/1kNN1HWVvYIeABJxE6tmk5JJUqKChm7Am8Wes=;
        b=PY7zq3oj0ZqNllzgopI+HTG3+YKZky9RioJuGM3POGZ+PjL+1Xm8yjki34WnacAIJf
         mchWacqI2hR0tBUrH9Nl+AvafyZqnCpxYJBCn9hUDNVDhw+2Ybk9cz/SAbO6six6YuVd
         KVKwcWmlbkf3ARJFRXFdBWU5u7NL+3zKb6wekVp7QkQ675euO+29r4PNUwioILXA44Ha
         3V8TniuxixYP9jHuqaW/4lMSJsMC6fHQ4o+zHm1GqiKMUMDBfKyislCrjCo1ehBZfxK6
         YWDtVXHxDRcAdP0IzbvXWJi3nGRKn9I+titWZImjOKXeCA+r4ftg1yr8psHXusAydYIJ
         UbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782281373; x=1782886173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxAaM/1kNN1HWVvYIeABJxE6tmk5JJUqKChm7Am8Wes=;
        b=iU+UG43bWJrKRlfPRV3MZLMrFPNptrMCWVUrRTs7x88EeFILT8aiVt2IAKAJ1QuDq/
         JDLcghMcqILKg+ANS/vtsutL6tORHqQPyaUoWtzMjAVwV2BmtKVfhpmBtNDmaDOx0nWN
         2WN/sgKfrZPkYL+wEvuHajwLw4NyE7GyQK0wMmxVKuu805DWZ8SjpT1Zhsydg+5DroLI
         s5tkpIxMwOgd4/5mP0L29TlAD8ngJpm6deH0T46ZaxVFGeZzm0Ykqm4JJuAx1EhVLtgJ
         rjxx3rQfMKVkAcOUhhmpoS5A55/eNe34eztfhs8BVU2hJoOSW+U2alkNUlRSPjzZ/NUy
         pZgw==
X-Forwarded-Encrypted: i=1; AFNElJ/r4HcvUwiDulcY54a1+7G48+my+JfZvNpZjTBamxeNMJwd51xOizJsQCcjdnSLN+8eLewxG3yaLgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiX+ew2aBKPuCH1JpL3m+Ns0xL4tTv7c7BK/VJTrKUuO+OmiWA
	jhTaMrpf+J8Cmij42sogMDGSt3h7bj7DZGYTZeYPbmH9ulhdQAdw9xKZshqo3SGcy1A=
X-Gm-Gg: AfdE7clM8sTlXkJEsTl9m870j/chF6LaATn9fJxHrnDrslrsxVQs4yxEvHjvQGho4Bl
	3DUvD/gQAISFbCEc4DCUsIjb48doRGKwcFwP9lO5+BgMR3QNATXJRHEeRaCyVAVrA+O+1xIuNL2
	90JnM0QO0idAXB5kj3jY7g8zfX6ycDUGDBmJDzgmfpKPbzmf9vOebzJ8GiCcUcXjam5VpMYour+
	oZcM0lutqZhpWwrSAOe79SjWPHEoAepwms0LLLtCgAD5Zz8ktrN9MQmccTcGVXoyXyGTVcxbqHU
	zkMFW9XebSbaUjFLtC/gQeZwkdFH7fZzo+Hl7yHzgEx7xVFOvWI5ItoZpTCpdXcWO8oTZmR5MBQ
	OWgFFErnNjLByu9Kp8uhvquvHZ76oCUYPuUCkZzEsNPpW/SR1aFe0OmOmwu/5zSgRANX0X4gjmx
	XUaBZUp/Y=
X-Received: by 2002:a05:6a20:1587:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3bd2d298c5bmr2455975637.35.1782281372649;
        Tue, 23 Jun 2026 23:09:32 -0700 (PDT)
Received: from gmail.com ([113.90.157.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc326c487sm11585658a12.12.2026.06.23.23.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:09:32 -0700 (PDT)
From: Milo Chen <cmh79479@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Milo Chen <cmh79479@gmail.com>
Subject: [PATCH v2] thunderbolt: xdomain: notify peers after enumeration
Date: Wed, 24 Jun 2026 14:09:09 +0800
Message-ID: <20260624060909.2610434-1-cmh79479@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Service drivers may register local XDomain properties while discovery is
still in progress. This can cause the properties changed notification to be
sent before the peer is ready to act on it.

If the peer has already read the local property block before the service
was registered, it may keep using the old property generation and miss the
newly registered service. With ThunderboltIP this can leave the network
service half-discovered after a warm reboot and the login request
eventually times out.

Queue another properties changed notification after the XDomain reaches
ENUMERATED so the peer can re-read the final local properties.

Signed-off-by: Milo Chen <cmh79479@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

 drivers/thunderbolt/xdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 86b2f7474..9c068d073 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1811,6 +1811,7 @@ static void tb_xdomain_state_work(struct work_struct *work)
 			tb_xdomain_failed(xd);
 		} else {
 			xd->state = XDOMAIN_STATE_ENUMERATED;
+			tb_xdomain_queue_properties_changed(xd);
 		}
 		break;
 

base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
-- 
2.47.3

