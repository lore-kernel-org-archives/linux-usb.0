Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F82E4257
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929983; cv=none; b=JuNGKO5osc6JEd+h5KZ6NhdW2O52l5RQwXyw3E3f8asjQSJIkEJRDIFNA5DUkSb1BrrgJrDFZaKshl8thDjkmXECHLrfxPRrWqgKbcBasf947UW/G1qyZkFdjupozFOGc+8I5QETrn1qHVVwabbv9sLbi2TRF7KYXhm7al8piJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929983; c=relaxed/simple;
	bh=A+I/86KdVa8jIDGYt6ApDmQiXDBusJSa5kMa1fb0xTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OzrDORBZ2b4IpHrnnG+jxOO4ngGEcm5CvZ8rxVRc0t0UUbz+Lx71jlywBZfXKKqOowrSVRSRyxsagFLLWXE1+aGpmg+S6hKQsWdSk70145VHO9h1J59o6kXFOOWJTf76MbFWQ5v+xPy1ZtvP+z3Dsgksabl6L1GTLoPgU/W21no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9ivcEh2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9ivcEh2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3466205e9.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791929979; x=1792534779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfkApeXinHFIr0p8vXlFlLyypuKINDLCCxfSgft0shY=;
        b=T9ivcEh20L2Gnf55fpi7DhP2HKShJOGeeTBrs3mIni6QHZp0ttdbtyyKpxc/m9Vce8
         06mrG4FlYTMFm7pK4KNdp14OM3toRYmxvEltNOFm6CdqSKmJH9wYrgNhzFL0ghGbiRLK
         HZdBJz1KcH9dup7ZCLkndjoFeAnmT5BuQGBYW0ipohtIy1mhKFvifFngR45FbEB0EMYh
         jhGgdXYmyQqe1X1d+jTdxoKjFDzskAakrug5B3aBOVNYioYtDaWRVI2sDYDxWE+5E0Qe
         k2+5HsHdT7D0Mq8Nf7IYBc6Gv8Cthsb1oUwt/RCpiHkaxdqHfezmgxOixLbW4Napo6z2
         FJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929979; x=1792534779;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfkApeXinHFIr0p8vXlFlLyypuKINDLCCxfSgft0shY=;
        b=XzHAdPNk0zIYbq5c4KhsHBLbZtZ59P7ZKHIxiAx4aZbNHlF/P4GodGZcb/FovNodug
         5z9amdZz5tYt4rzUPnIt9weNyvA0Xg3lnoJ8RIGqFUsQOElibMAm+OOPgAs3zq0uZxrT
         hRdisN+PlVv1gTCz/di8gGNZG1hvpmo7Z+iA6YB9P8rjyvzNLtlsTg/DYKlPV/CYJrEw
         60RHsBeN/XR+Qt8md1/qqvJvKiDCYOywpHUjaE3EPsjlYtlsGD4/NQr5xh8ibMXr/uQz
         kX0zbw1GJHqF/stWilk0n/9xZn0vvMxbZEYMHHD46tkK2teRqV1jyOjOOiRPDOm6FIu1
         6ghg==
X-Gm-Message-State: AFq9FYJlQvz6imF4zjbUU3AV8sS4iWuzsRSvqdN2lAwT4zHiguPczFLp
	7x73jmwFObKLZdQAsho9m9dNVLWVZCl3YOzxHP4gBmJX7sFBoq9fSbIkAMFuoTJt
X-Gm-Gg: AYBFou1xtCadO651Wv4x6BCjEAKEfX75oELEzkz1oy1gvoONP971iZCiXl419+N3/Lp
	IyP6K6n5baWZDWDVMReWNwlnc0cf036/CIqeaR+JIRoUQfit/eFt8zn19oXo0Kyqp9qU40SSvRs
	LGe4bxACIv57HYfa21fDf7D2LnCOjNh5x6Tr6ucAylnSbQUBNiwZcH7y0b+qFIyCrdXPORop/SR
	oHim+QGN2LtZqEeqZ3B1lOqVp6dJxTa5XHytT/3qM/kd55Trjt2ChKgguXsYWVLfAhIST4Buuso
	SrSankbvBMyL/3j9V8bh+A7Y4GTEdJ7CSuyCgrNq8Kjsx0FmNbbfd+ZQizO0Gepn4g/dqyt9Zmx
	fC3NJU1YyIiAUUEYRYT6SS+JEDdHPw0g6k4sTqhEi5nmek20pk+LD2DHM9kcBY7kkrY2t8Q9YqR
	0uIZfJsYx8iBNm4EoldibAs+d1jfEY6ssv+fzSH1T9k7TH2GuM+t3z6GsjG7wOfM99S3XRtfFIc
	O683xBb+Kbi4/pV/lNIeksBZ/MATRy4cLtqypwIokgjUio8w6Mpmtu19WG6ZOgnc8iG+I/p/8Iy
	DUwVuKDAMEZxuSmADJB4m7exC2dOozFD6LwZ82fZ9yAWoW803Tw8BAN0ZTSATn3CDUrACWkkQbY
	n8Ee/+r65YZKrla5WpjZa3z5uso+gAabTLqyd8K/xbS4WHuSVG+nf0HVr2C+weZDksVG/qOqCnR
	DV002O0djgQlmmQLQ=
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr279668475e9.34.1791929978906;
        Tue, 13 Oct 2026 15:19:38 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:412d:e9fb:680d:a947:4b50:d9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm428992205e9.14.2026.10.13.15.19.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 15:19:38 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: uas: validate status URB length before parsing the IU
Date: Wed, 14 Oct 2026 00:19:37 +0200
Message-ID: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uas_stat_cmplt() dereferences iu->tag without verifying that the
status URB actually carried a full IU header.  The transfer buffer is
a freshly-zeroed sense_iu, so a status URB that completes
successfully but with a short or empty actual_length — observed in
the wild during link-level upsets (Thunderbolt-chain xhci blips) and
on a wedging bridge — reads back as iu_id=0/tag=0 and produces the
misleading

  stat urb: no pending cmd for uas-tag 0

log spam seen e.g. on an ASMT135x enclosure and a Samsung T7, right
before the affected commands time out into the error handler.

Beyond the noise, a short packet that happens to carry a
plausible-looking header could be matched to an inflight command and
drive the state machine off garbage.  Bail out on anything shorter
than a full struct iu.

Cc: stable@vger.kernel.org
Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
 drivers/usb/storage/uas.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..88fed50c262b 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -315,6 +315,13 @@ static void uas_stat_cmplt(struct urb *urb)
 		goto bail;
 	}
 
+	if (urb->actual_length < sizeof(struct iu)) {
+		dev_err(&urb->dev->dev,
+			"stat urb: short transfer (%u bytes)\n",
+			urb->actual_length);
+		goto bail;
+	}
+
 	idx = be16_to_cpup(&iu->tag) - 1;
 
 	spin_lock_irqsave(&devinfo->lock, flags);
-- 
2.47.3

