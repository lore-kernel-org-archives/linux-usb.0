Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1D280338
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785652181; cv=none; b=LsklzbVsj6Dqn9HSomJ2wIx9Kn1bSscoRdYPk72er64/yF0ppdKM/mb7ZXoZJA8QSixwqovNnwf3yjYg1N8hdOT0u3oyVli+7U1MS7rgVIrK/NQMvhKPbWh79isK9ITcqgKkmHWF5SAol921SImtBWzi2G4kwfe7u1ht1cakoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785652181; c=relaxed/simple;
	bh=W2h+lQJkGidGNrRAMME1It/pdjA7OM5p9qeNYRTFJl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZmhusUT2O/uUSJudN/RE8l4dyKqMISlblpNYE3z8Y03K57DInJjjEVhVPDZ+00XbCCJpKdXTHGP/0RZPeGUGuly7q9t8VJqaeBUt6BC9WplcBb5fXadQ8Xs3Hn+YZw9LVDyFXxdLOYfx798ceXgAkKH07Q2zg6Xp0VaW8Yrn/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl5VLjWY; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl5VLjWY"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1076548a12.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785652178; x=1786256978; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n9MAKt4rWHUHzsXYDtBo+1j3/AQOYJvXcXJiTFW0dqg=;
        b=Hl5VLjWYlUSjTSSITYtLHuBSL2O6ejXzl/oNTfIXqzKSMpAlZKWFWpRVTubAMexbeo
         /6gvJAKOSg8Kk7itucZTHoH9ojqc8vosAiJIqP0x9FzKsgbSDkARlkZViq48rEk+mvup
         P+JcbMd+FL1HB8HKvrzDhlHT+LY/zOc+1zXaj4LIV4IhUAfmvUSCHirUwrbDqyNEJgz4
         52p8eyznKg068tiwTbSpeDNsYZzV+wGxbpogRFLwcvYh1h/1iryjd/Sn8F+fgQlXNb29
         84u8ALUKa6EVGOEtQoAnlIOjzNqLalKZde+5azsxHgybUePbK2rF5nzJ3hg79pZZPY9Y
         YBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785652178; x=1786256978;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n9MAKt4rWHUHzsXYDtBo+1j3/AQOYJvXcXJiTFW0dqg=;
        b=RkmFlvyisGOFyWuhT9dBtnEfsklSUGSR4+gzalEI6kM4n2srzyfbYEJ/j5d0ND0pQS
         VXIv4t6KQDk6Z9cRaZHNT53tzmzes1RTtGQ5nHzI5mDc97zjB6/Yf1Hxa+e2lPRdrlP4
         eQXpPVdaIx4qxOWjclpISrtGXx2md3YL1DaLQ3BLjtJe8HxfvS1FEhS67HXaTCryhIoy
         Jw+eYCHKsZ2bn0KOoXwsf7TovneMAbHZp39ZQS8u6tT65l19l2yq6llijsNkWtH9d6Gd
         RfJRD8h36HGTfIKTI9+vwayTGV35wwPI72MhR0UN1ko7LhIojJVoqRIoeEdXifahb01E
         mC+A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0QfN49YZyU6TURl8fYGoKqIfS3H42cTbBSX7sxtARK2sAUS+Xndr5PG2UFwfzAPvF+BtV/ReStLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WmkiRhQP5+ihcah8/o1MJiSqO8BmIzd1n/Y5VruOCVbbtvoD
	xovYNkZFRJlosETOws+UWXk24s7CPPUpUewEFWAVZgLM+dGvWYUenQgm
X-Gm-Gg: AR+sD118zOhg04oI7qwh61GSXsRpTvP3qVAkV7pJmwedpidQxtS2UMGxfdTiBsLSUR3
	apZA4oQSU49GKA/h88au9QjmZ/himpMtu4ovYNf4urLfBVIObQldyY58klpmzONiwRRbRWdeAqp
	bi4mEnVT0jXx8rS3TdV0LtW7ZIDFsiSt8PXsBQtYq+qeNQw4xGDmcBLNr352aFA29vk2bBj131/
	EFoU71vsY9QrSMg9RJQoZZ6rP27wZY3NYNkJx8lOsLndJ3N6Yd1Mhj/aTmkOQsoolAr4Vk3Ocqz
	Ga/fRgUYNQou/9wDizKZX+JSDpvk45OYalYhU7eVOvAaZBo4kJaNUwoLPpfRjxZEP0vx6ahpi3/
	T19B8tJ9vyen8dplxpyfBOjAS8n2BoQvmfUa5amvLa79iiPS/uKtArc4OFc9MmPtVy5F7AdxvWA
	brJmutn2zaAqkQF6IcVHClpm4mHUtT5B3R8OyolKIxbVsSBsL9OyNHuZNlfiVmUaJ8Fr66eNw5Y
	A==
X-Received: by 2002:a05:6a20:7f82:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c92a796742mr5995213637.32.1785652178272;
        Sat, 01 Aug 2026 23:29:38 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:1e00:d9cc:7c6a:c60f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e1886e7sm26969346eec.26.2026.08.01.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 23:29:37 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 02 Aug 2026 11:59:24 +0530
Subject: [PATCH] usb: atm: ueagle-atm: fix array-index-out-of-bounds in
 uea_bind()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-usb-ueagble-atm-v1-1-340f085b04aa@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMPjbmoC/x3MTQqAIBBA4avErBuwISK7SrTQnGygPzQjiO6et
 PwW7z0QOQhH6IoHAl8SZd8yqrKAcTabZxSXDaSoUa0iTNFiYuPtwmjOFUdD2pF1ddVqyNUReJL
 7P/bD+37oDALyYQAAAA==
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, Chas Williams <3chas3@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@osdl.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785652174; l=1353;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=W2h+lQJkGidGNrRAMME1It/pdjA7OM5p9qeNYRTFJl0=;
 b=bYH0tFfdO3Yg0q0KTykVH5y6JfEaEjoGUvyjOG5ioIBHfBp8wBtf0vM/WXDyfGyZMDbFevx7/
 kqY08IvHH/YDxLbqMEqH6EiR08J5sZtr9KstuRZaClgOkyM+k9kAdka
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Add a bounds check on the global variable modem_index before
using it as an index in sync_wait[] array whose size is NB_MODEM.

Reported-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com
Tested-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=92f5bf49bf4ac75223ca
Fixes: b72458a80c75 ("[PATCH] USB: Eagle and ADI 930 usb adsl modem driver")
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/atm/ueagle-atm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 4266a0cb7e3b..61723e7ab351 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2463,7 +2463,8 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 	if (ifnum != UEA_INTR_IFACE_NO)
 		return -ENODEV;
 
-	usbatm->flags = (sync_wait[modem_index] ? 0 : UDSL_SKIP_HEAVY_INIT);
+	usbatm->flags = (modem_index < NB_MODEM && sync_wait[modem_index]) ?
+			 0 : UDSL_SKIP_HEAVY_INIT;
 
 	/* interface 1 is for outbound traffic */
 	ret = claim_interface(usb, usbatm, UEA_US_IFACE_NO);

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260802-usb-ueagble-atm-ca29d2bd4189

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

