Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA42313534
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955204; cv=none; b=MT13mbjJ4jYoOyRlRXd1ejWc4U5S5IpLa869dF9rHapR3ZJENJ9mnh3KbA4ZdKoetcW0RRu5ytuT7INFqDH+5yO2kfDmHXB+9qb3jgY7jCBwRGKkC5U797ehBn93vMYtPn+aFpX5Ej9yv6iz2lDNSMyZH7rKbdZUW2foZcBdNKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955204; c=relaxed/simple;
	bh=fKdRgGaEQ1DKjn+OgbOLKOAaVAQH9jINRbPsH9LIGzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzLedJo3wUZkOhdMUnl/c65N2ArWkXsEDAiwOonjc0b8XfPohjU0aK7e5BQejEISipfSZ/jhKdZrHEbYd77OZhHSZ67ZP/24P2Gf5XYbu8wdr3r8s9XPYF8NGzXN1tmnW0Eqi7ms6Np3KF2FyD2E2o8Iju5UEnBTTjMIlovHbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQSprUib; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQSprUib"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2824664a12.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955202; x=1784560002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5TcpUNZnrt4SbuBdue6MfVxkNhuI2q7ex84bolmGuw=;
        b=LQSprUibVAVKDSBwNSDzAxrAQfuDf9eVimsIL7sKxt/Ao4wxqf4OrchUxpln7BGodb
         NpGMbVRFzqBjlpjPuOupoCuKNucqetba6JJG42B5uisVQjxxp5e1HPNtoQoviwrfH2wM
         QaMyydIJZ07rz4kWhdoSoJYTm58WeFt0BtXRS/qudgm/vEEq/DJO0QX0M5HSuVXeGnbY
         7MvXroyAi7XeJmk/Maey6qH4dwFjUrvWha1MxfCTwdybAhUMlnYgVkhC556fiaT9Lq1b
         HRlPkAt/V6r7D8UdDRL5MryZPMNjyC9hR9ka8t/gm6DZJOWs5+jvSPxp6sIxe2hKMKth
         W/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955202; x=1784560002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5TcpUNZnrt4SbuBdue6MfVxkNhuI2q7ex84bolmGuw=;
        b=j0kAE+6g93K8qD54E1CuAdrSG6+HS4rotBZJLbfGUxKH9uDW+OCP0hsU4o0PDoOPbK
         48cZSHmS9xzjE0g4iVPKsyAWe7lYQBbMHMR8Txs2pgz2bhxYWwG+J/unAiBbB6lB8hQa
         mwAnjxlG+ZwoQsmLfhCW9W6K9EvGlvMahAK5Saa+zUT+0UW3BdGOpb/CZy6ufH0ULJ2n
         Vzgg6R24mDexmyBDPToPNLQNJun6t1h7bS+4PICqsBTojP+qOI0igOGOn51VDNG5X7+U
         lk88P+9T3ijDMZiD7zB3jLnvNXYCHaDBStDLsmYuCcNqwmMWOWXBWOIQlxSqrUt0EfzX
         T/2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rop8yqdAoEZSXP4C6Lp6aHk5RXNjX/4XeL8bQJjM0qcY8r4E8SBihoBKf+EenPUF7AQRPtW/+M/6RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQvOCSyMcJVPUpZj6F8yQdBpU2JJQG86VJY7bIVryCev1OYoW
	xSvRsB26c5WEBon7uhx5I7T+1MghNgmpKWhKBQaRAq4iF7UIF+oYMVrv
X-Gm-Gg: AfdE7ck5s0zKJMgIw9L+YhKybxncJ6TFKxpRbeFdoR7hpaAEZ/QGA/72zYjoIxFU9aH
	rxsIIL2ymVLczNGdbkJxrVuWPNZgymhrKrEYVuX0bS2Bu3Y/5j19DxjoS4zFCENkI240UE+UV3B
	/PKJJTaSAYwTYh/AUojMSX69s2OeutplHivJl1Nd1xlUX72TKd3LofwYQ0RMoASo6IPGS0BpCNS
	YKUacQFiuhqQMviADmKD/BG2QDTK1IyH0+7XDoJlkgdlqB0T4px077Cn3kl43mjzzbYhc13t8re
	5aCINNSnCBKv49x/Q8wzNaqU2frbLvj/0GZY5MGmCKxIs3VEbqpTJ1LW2WNX9fq9NGzXHeM+w8w
	gTic34mDrCN+FFXwA5kpdmllNsgpd3h7EAg3NgWOVc/HEvWaiyLIcHPziViagpnwbvXtxmqEqGS
	NYYUJ32UylzcQ0zF2ZAEtMIpmgl6i3son/iWKDNlxAqF/yRwmtoGHd/sLIIBy72fQ=
X-Received: by 2002:a05:6300:48:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3c10fb5ffb2mr10496496637.0.1783955201727;
        Mon, 13 Jul 2026 08:06:41 -0700 (PDT)
Received: from utsav-Legion-5-Pro-16IAH7H.comp.nus.edu.sg ([2401:4900:8821:fbe9:7119:6066:921e:7077])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm13578502c88.8.2026.07.13.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:41 -0700 (PDT)
From: Utsav Shankar <utsaveshan0206@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Utsav Shankar <utsaveshan0206@gmail.com>
Subject: [PATCH] Documentation: usb: remove dead link to external USB programming guide
Date: Mon, 13 Jul 2026 23:05:44 +0800
Message-ID: <20260713150544.20962-1-utsaveshan0206@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "Programming Guide for Linux USB Device Drivers" was last hosted
at lmu.web.psi.ch and is no longer reachable. The original source
(TUM, cs.tum.edu) is also defunct. Remove the dead reference rather
than link to a third-party archive of a 20+ year old, outdated guide.

Signed-off-by: Utsav Shankar <utsaveshan0206@gmail.com>
---
 Documentation/driver-api/usb/writing_usb_driver.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
index 95c4f5d14..6f024e164 100644
--- a/Documentation/driver-api/usb/writing_usb_driver.rst
+++ b/Documentation/driver-api/usb/writing_usb_driver.rst
@@ -322,7 +322,4 @@ http://linux-hotplug.sourceforge.net/
 linux-usb Mailing List Archives:
 https://lore.kernel.org/linux-usb/
 
-Programming Guide for Linux USB Device Drivers:
-https://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf
-
 USB Home Page: https://www.usb.org
-- 
2.54.0

