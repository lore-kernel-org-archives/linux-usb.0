Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6CF233943
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077500; cv=none; b=i61BgBJKFzgVf78z03IF1LwWPKEC5o1O00HD1fB3TZdo2G8573/zFHgN8wmSm1UoobHi9P0AU31L6rSgJyBjSuT2o4heyL+U5meM323q6b3nN7NqeSpKiPJMyWJ/HFA0NJ8iVy2TCLnohDYYwIbZxsu51f1v16qi12W6NXLirbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077500; c=relaxed/simple;
	bh=c2eJmS6Fidv7OQwOFciceAX1dEuewckWJWc+sV7tPN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmfmH2ksJtWjJiZZ80xGLKYu8gRbbHluFJmgPQBx4DhFdz/dJi1jLSYl9bghS9RTbOEwcTkDTD2mFsymS01TMQu8yZE6VVBNYn4+gLBWs1t+7p9bxVWkHNU23PdJavgVwljatg8fR9UXWyma6NP6033VC6tiKtXOJvh2bYVOCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DriXPxRR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DriXPxRR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2458670a91.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 21:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786077499; x=1786682299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OApPi/aBpyIH8HD0zKAoJ3Rb4TUBRhQUqTZcuTXFIYw=;
        b=DriXPxRR25QIAiZxJUvKBtEBiG9Viz8SAvEWMVyc4WvX3wptR2w6KynyU9cmlDaVHp
         dxjMsermDzK1US/Uca5lkvgj5PuiNyqgS/7bsbbgH+WQKiAhduT51eueELDYCMIMmZeN
         owX/bIVpn8HMvieMc2kfmiqbbsE7E193QTwCScSXybFulRDcl7nAQQ/GJHj/12RMw6Tb
         JSEOXRgPi1Vsdtw20TLXUa7RNuQanPF+SMf6yCHFqLMTxMvsLLmhHRj2gy6LdfRNP8Wc
         v67jteEzlRzpx5vQoNlJDKm6EtXyu+NW7F5i23+qUvpqBX2n1L4J9d8cGDBYvWNlFNg2
         mlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786077499; x=1786682299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OApPi/aBpyIH8HD0zKAoJ3Rb4TUBRhQUqTZcuTXFIYw=;
        b=TtXYzdWzf76z/qkTXQW6jO/LEN46sS4Yw0yz3q37+GrS46uDVLeQ67jzCPTBpLcMor
         RzmwT08scZ21PpJtw+4JBTQTcZ1aaA3gy2WWwjGGWiYwFWVf0cAe2Xjnackc52vE3XVq
         fqLqfB94pKzGj65WFB8I78175J9Sbz9JMFTG9Rt/+OFcnfaa7aDc/YG7Sey4Q4sd6ECw
         UDZ85s8Ch90EC+bXhS57T6BLsMhc2LXPwF/qLXh5aL8kTZdQkblaTi9QZbzFEcmagPcY
         Pjs8rovHhfjDuLP2BfVG6Qk0rxMbPLvpJ+3mfjL4VS7eBuyQKBUUSKw3l+CnQ0aH1tyK
         Jhtg==
X-Gm-Message-State: AOJu0YzN6FCOfq6i6MxkjCGczmUerEUWMcPa3owUbuZ4tTuZIF6QrzDa
	+QTggeVQDzFSFmTQHLgKd7f93erzwvsbdocBMRG3vB/KIF6jblPamUH0i1qTlA==
X-Gm-Gg: AR+sD11w2m6Ly3gHpO3lFYDwBmzUWMUFm9Q4u5CzUyFgq+UBdQEsQVfwmB3kDyKS6cz
	H6uJzJJpwLPy21iYn1X0gQaTX6ztwZ99aaJGYRg3RitUarBcoV9t5Cxiv6hNJegk2wSvoNLkX8q
	ze9zzir2tMKsKhllonh8PZ9NgbkSlhik9NLekpU+8OAnFnyQWyFGfUV3F+YK7bLZePaWGvRlGsC
	mlmKoI/MBf3qbcFOQUGYDPpYEZtQ8gWZ/nMxrgrDYooMjaWPDPoXIcUrW7slASSeI8p4Hs3RmQy
	XvvXVPNeS9CvdbJ439BGRGhX+wyYpiMmTEOgJoGSo3uGi6l/xYbFIUFqDnyHmg/Uf88FGb1wJUx
	Z2T9X0YQGfHu/GnIl5zKdAzRx1Ipp4eScu+8+MGCVpnSd6pJto1d7KzlJOXhMgG7CDAGtJ9Tpnh
	6OHcfgjmJDg+4ZpaasTLYK2vBi1ADn3QcAJWQkPNtolpcT96pxxQJjOyv+M2t8xFGeBw==
X-Received: by 2002:a17:90b:520a:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3903c54adafmr20909787a91.4.1786077498756;
        Thu, 06 Aug 2026 21:38:18 -0700 (PDT)
Received: from Default ([2409:40f4:102d:3eaf:6f2d:c1cd:a882:e082])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm2749192eec.28.2026.08.06.21.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:38:18 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [PATCH v2] usbip: usbip_host: fix null pointer dereference in
Date: Fri,  7 Aug 2026 10:07:59 +0530
Message-ID: <20260807043759.12218-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rebind_store calls do_rebind which dereferences udev without
checking if it is NULL. If busid is registered using match_busid
but the device is never bound to the driver or it is never present
in the first place, it triggers a null pointer dereference when we
attempt to rebind the device. Fix this by checking explicitly for
udev first and returning -ENODEV if udev is NULL. Add usb_get_dev
in addition to the null check to get a reference to udev to prevent
udev from becoming NULL after the check. Drop the reference after
using it in do_rebind().

Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
Fixes: 4bfb141bc013 ("usbip: usbip_host: fix to hold parent lock for device_attach() calls")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changes in v2:
 - Addressed concerns raised by the maintainer in v1 discussion
   - Added usb_get_dev() to get a reference to udev preventing
     it from becoming null after the null check. Drop the reference
     after using it in do_rebind()
---
 drivers/usb/usbip/stub_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index 79110a69d697..c911626427dc 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -256,12 +256,21 @@ static ssize_t rebind_store(struct device_driver *dev, const char *buf,
 	if (!bid)
 		return -ENODEV;
 
+	if (!bid->udev) {
+		put_busid_priv(bid);
+		return -ENODEV;
+	}
+
+	/* get a reference to udev to prevent it from becoming NULL */
+	usb_get_dev(bid->udev);
 	/* mark the device for deletion so probe ignores it during rescan */
 	bid->status = STUB_BUSID_OTHER;
 	/* release the busid lock */
 	put_busid_priv(bid);
 
 	ret = do_rebind((char *) buf, bid);
+	/* we finished using udev and don't need the reference anymore, drop it */
+	usb_put_dev(bid->udev);
 	if (ret < 0)
 		return ret;
 
-- 
2.55.0

