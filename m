Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6EE374745
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312953; cv=none; b=iQPbYDFajCjUMVsOElpIqjjUYElCyCAsLJc/er2ENdfZsQXNriu/Pbu1mwcp+a9tDz9PFbpPv6R1tv3lvpw03oqm9Nz5qoKCjBjHGWfHGFpfM985u68voJQnpvVpAtS5X8PQYLgAObXIWWFb+w7IMMZxNXe676xkaWCJuwGtMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312953; c=relaxed/simple;
	bh=GGQqnXopS3w0hGDXFED3WEdOuTRvC90+jNVd4y1nDHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cvGz98DiIBtGf94tQ/nJ1bAJj5qaSzl+5H0fzFiisE1uLHBNJZM1VP1AXx8MtSqrOJbvM2G2lo3eFluVN9Sf6AScvMTxWPaNri70ljK5AYIHvSO12SMRsO8UpEJQchl759X8mZ1xY6Ir1djx7+l38peE7lHL9e3YfUk3iWRAJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0t2YOnv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0t2YOnv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso14961815ad.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312945; x=1787917745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhOyIfgwq3ymDsnKi6KRa4VEpe76UoUoo41OCGygdSE=;
        b=s0t2YOnvYCDG/6hRZgI3WU+ErOVuGgZF/Jsyq+B0ufWdeI9tWvVPM3jbQjRrakWuTl
         Et8QOKY/xq3udSVp1y/4y7UvHN/X9AAoI0Za4hi12el1SO1p1ZNgPmXDAFM5jFj2/6/N
         jeY2XPnO2fMU7EgOmiw2yeoA+T1oA74vzJeVCekqN+IJwsbIoM5HtqaghpJTy3Ok8GXw
         FT0EUexZ1S6l68ptd5L49HcN+o2QcvF1jSHM95eaxMcemsoNNGaJKPAu72xnHFV5Q9gR
         i3gea595QBvPZG+TvvzmXcBV/3pmQJnmT2akRApfx+JwClr/4KbJpkAcogLhnmiwrIPf
         ospA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312945; x=1787917745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhOyIfgwq3ymDsnKi6KRa4VEpe76UoUoo41OCGygdSE=;
        b=f2h9TV2BdluTowqIKlXqp7H7BE77NfmRMEvqiG6caT5oWqia8TAKUHJdG+EOyljfNu
         tI+ZTBPSm0XO1JmUZct27yBhPZGoC2L+ycN75ldX8HZqkHAjPyQ0T//GWpxyB+rvE14k
         9qb910tPE6tk9DwF2xefEerSWSVGAVsJ0Jr9tD6uQjQVwfFkfB8XJrM+gfcnBnFYE+jF
         DJwhy+46pFAfMUWUYFjPNqCwBgsHa/thfhCC5oqXdXr6SZuGc6LrHWpicXQLRA4fQwKw
         xDXmG5qLwhPGQ76v/9KFpsVoRZOo3NwsEEvIOmp5fVDmFhDfgNA9QYf1NO43xrSohfIY
         Mf7w==
X-Forwarded-Encrypted: i=1; AHgh+Rom/zF1e94z5m9Cp9SDVrLTRXT3ITyK6gjIOKRuOMuOA8fp5mtQXtqv6lAis2jkuD1yXdXHdukagY4=@vger.kernel.org
X-Gm-Message-State: AFuF++mLkyZxkCuK/e5kti7Sk6DANd8m5miprqF8ItscTdlvJd4d577G
	p79OFs8L6CNr2pnTsy9ja+PC4sElIGofM3SC47hyxgA3YSh4sa8val/U
X-Gm-Gg: AR+sD13KLTWveK4pG3V9E1ql1usp2Cg/kD5nA5qprONbgB0IhZ69Bb9J0zQDt/zV6Dw
	flOFZE/hR7kZjCbIt4gLGlYbvbvU8dYf1nhM6jzLzwwSB+yg1/5kbi5JoyeTwyPFV36J0zJT+W+
	mrzOSMNyVTiR1i5Ddezds1kPVjc+fKfgRZevD/ioBdpL+MwQekvlYqokFjnHMQQj76ImfB9rFC8
	XQToLTV7HmVJ0d29YRcivIiVq8vNmC2tPvRmSj8yBeB/Xl6gm21HDrGRAsnsErbUAkkBbQ4lvC7
	IBNVJlnUpeSFVtmyZ4PhruH/oMLuYyxPN84DUwZHKkUx/3geODLp9VapWmk2nC0OOTkwVGVEHyy
	tqmaiT47m0i3hM/cF93iF01cXwBQ6N17WsWgSMZzmNsfRlY3MdCsaviKMjAYyI2M/RZMJ2LFHrS
	2H1re0TjQzv3Vb7ogd8Nq4ne/Y0MfgZDSjwULG5Y6mbIx/xs9VLGw59tL53OucCw9Wc0OYD72G1
	1Oxn/YHlZBB5iY4pZFvpdosHQ/q+6SZ3P+4NfnudW3hnMm2fwdh8Q==
X-Received: by 2002:a17:902:f68b:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d64b0ce441mr120097945ad.10.1787312944722;
        Fri, 21 Aug 2026 04:49:04 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:569e:7ed4:3735:ea2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm45738270eec.26.2026.08.21.04.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:49:03 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	pavel.hofman@ivitera.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: u_audio: reject srate request for unconfigured direction
Date: Fri, 21 Aug 2026 17:18:54 +0530
Message-ID: <20260821114854.12218-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u_audio_get_playback_srate() unconditionally locks and reads
uac->p_prm.lock/srate, but g_audio_setup() only initializes
p_prm.lock when p_chmask is set. On a UAC2 instance configured
without a playback direction, this results in acquiring a
never spin_lock_init()'d lock when a GET_CUR sample rate
request targets playback, triggering a lockdep "trying to
register non-static key" warning.

Reject the request with -EOPNOTSUPP when p_chmask is not set,
before touching prm->lock.

Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e53f2927b539..ff811ea1e25a 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val)
 	struct uac_rtd_params *prm;
 	unsigned long flags;
 
+	if (!audio_dev->params.p_chmask)
+		return -EOPNOTSUPP;
+
 	prm = &uac->p_prm;
 	spin_lock_irqsave(&prm->lock, flags);
 	*val = prm->srate;
-- 
2.43.0

