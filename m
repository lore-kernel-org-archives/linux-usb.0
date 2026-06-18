Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3F33EAED
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814684; cv=none; b=mZzUu/tOZpYlBTaw3JPYMWPkBVZ/K+nFaw0VtOjEBw5zr0NfTnbLrnbAa8PSJCkykvY5hY+3vM17QrFVlNEM+99EReNnj0k73BsDM3h+V/HjXcofAgJ47hJKJfV+7exOjGE2aeiDtIUECAvTZ/ENugFDSSVegNilB8wyYS/4HQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814684; c=relaxed/simple;
	bh=/LPHXZT7LD771IVECNquueWpuQAnVIKcTNUWyjKTOHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=urOI754ycYCQzZUg8OoD1y52y8nayGkiXBhxGxH3kPzGRf56ogzVz8RyU8FWqRLmMoxqg88OA6DuNUov2xpz9jhyJ3p+Pe5v1LZFK28hhCxnQL4gNSw9oehpR4nJqzjBakK+uXKF6qz/ofmTGJYPMvYRB1SYtUlZDoLNtTIagbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSEtq4CS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSEtq4CS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso989503a91.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 13:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781814681; x=1782419481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hY833qL63LecSXXf24b+TIT9KgU6CCDE0sbpVpUWuMI=;
        b=eSEtq4CSsT6JKcYk9i1QI6lR7Aupgp4Wn2dD8yLjW9sRKoirMwOGXczLslllss6fnJ
         AFziRRp2IbRTV/DQrD39KSGeG9kjhCb2v3dmT3ZMbtNof6hILPv/tYjOvZ8gsjnrDUF+
         4SHe4OJhScU/sC6h40nToOMprRU12MsTxXV3JDPH0HochCRBGXEzMZ5jIJN35owkavlc
         m8s6Yox6LsQOySElTeqlLtxxV0ZYYjS/C979Dkkfe3aASWIL2r5YkphErxOhrSO9eOHv
         SzBWdJapznb3pYs8SIxTDRHuLqfXagivzEE5SNDPDeRB0plqOaNlbMDt0VofgzoDIG0K
         RGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814681; x=1782419481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY833qL63LecSXXf24b+TIT9KgU6CCDE0sbpVpUWuMI=;
        b=QCgArhcoyCT3IUoTqGAyMk6CXzvXJrvUi67F7rLs5T1IxsHQmI1AhPbQzYO5MBRRLX
         BYA1wN1RQL/AkWjNyJGxb1PTjyE9ONi7FuG719O6JoTpaKg+/5xFyaZC6ZsVu0Klimea
         QiLDhbSOW/bgGtqiHSwSuXrFR81b8PsxuOhqK9MTS7XQwyWAu20vRrgB4IIdj5YyEe8k
         uko6cPdx6QwnK6nomAKFrGdLN9mWIZC6MrVo7CJPCk/C7ssr2+6E+PGZfq5hj4nmnZO2
         6+iP4gnINfEz16urXoqrxMybVBCNwoEkR2UyP5Vh8e7NhQVFO0T1u22TeLXXB0wcJszd
         gDfg==
X-Forwarded-Encrypted: i=1; AFNElJ+JDhvVPCzRBVEX8otHQoCtWZAKMQVGxh7/lTDpaUaaL7BOvR0kUvWrhG8fGqy2+iCOYyBR8tULHWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRXqpYrSOhK/Jg+33n4Kmv9e72NuE8EUMocpJzWtUgexd8CKy
	gkG79Pd602CWhZHa6Fj46m7z7C6xti7DhrM4Rdj4ms6fdNL+bbvidNVr
X-Gm-Gg: AfdE7cl8dqaJJy3RqZCuPmMjaI2cXFBosQMc6LzXrI/B0OijXrp52m84lwSRC6EQzbx
	XCHTEcXhSUPhLVKw8rY9fRn4Sxvdu/SLIQVrUG4wKHUMt1ctWXhqvHhCrzh/Oy26Rc6RTqq9Fa3
	0bQ6IUGZcBcRTTcWq1rfemfE8+DWyY74X668jpxsM7JSom5E1p+KyZREyECRH5hbfU0rFjdieAP
	+J3KJwaUHQQCbDJZvZ27iXia0iq+2y8Zs8GCxPnJ/kATCWqP7wa25o8KAZfYcTySh9j0DqJrvYx
	GlvDnFmcaxY/59fhmJ7PYV6RhORrutslb3BLMcVdvpi0kIr85PQk/Z1VXzTzZN9XQYJl/AsMF9V
	L8e9bQIfE/NvlBadTP+yHSP8KYoDpiNGHqzT98Z4IF8KkccOQzwqpUI1u00hGRDQycbJ9TXDVzl
	s5mT5xDDD4XRuR9TP80i9+LzSB3wZ5MIIUUQ==
X-Received: by 2002:a17:90b:2709:b0:37c:ad9b:680b with SMTP id 98e67ed59e1d1-37d15e90058mr1278525a91.20.1781814681485;
        Thu, 18 Jun 2026 13:31:21 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de5d3dsm544009a91.10.2026.06.18.13.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:31:21 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	kees@kernel.org,
	o.bock@fh-wolfenbuettel.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Keshav Verma <iganschel@gmail.com>
Subject: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
Date: Fri, 19 Jun 2026 02:00:53 +0530
Message-Id: <20260618203053.4725-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_port() currently ignores errors from vendor_command() and always
returns the cached port value. This can report stale data when the USB
control transfer fails or returns a short response.

Return the underlying error for failed transfers and report -EIO if the
device returns fewer bytes than required.

Fixes: 9189bfc2df0f ("[PATCH] USB: rename Cypress CY7C63xxx driver to proper name and fix up some tiny things")
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
 drivers/usb/misc/cypress_cy7c63.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 4a7f955ba85b..8601ee0a1ea3 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -177,6 +177,10 @@ static ssize_t read_port(struct device *dev, struct device_attribute *attr,
 	result = vendor_command(cyp, CYPRESS_READ_PORT, read_id, 0);
 
 	dev_dbg(&cyp->udev->dev, "Result of vendor_command: %d\n\n", result);
+	if (result < 0)
+		return result;
+	if (result < 2)
+		return -EIO;
 
 	return sprintf(buf, "%d", cyp->port[port_num]);
 }
-- 
2.39.5

