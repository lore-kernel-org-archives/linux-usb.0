Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133037AA77
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752244; cv=none; b=IBYQRG6HL38Yn7aaW3Z/ymybw8YyKuIykMYOCI9A4j6wvaGjCVVQMLhas1PjeHMr1v5gimcOB7V+mfx2nSSsPg+3DRnwpunaOOLpBYujvlJtogQ7dFXU0AZnDQYIxn2NeDEifvvYsggDYzHou6PI689XN6d4MHtoGmSti6MNv4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752244; c=relaxed/simple;
	bh=N8lr4PhpdwnLHM3UOch1jueU2anoDcJwMvyA9m3ih0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YMfFc4Z1HsMS2XhJSzj8TGqYeA33wMr0IzDXRc3rWG0Q/iGbBvFH9hRfd8LOgvFucwjp6uEvGIHisf3xLuAAN+xi66e5uO3e6zxa3hmwLr/2Uph+rqkBOaNz2gcsXGwdcfqXiTXJbd/FwODuHIIZdbuwydrZ8ANn+EhN8ANyrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGyWlkD5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGyWlkD5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf52d15d88so25943135ad.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785752242; x=1786357042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hthDC2Kbdeq2qaz2x8s8OZb7AI2FDOI03M6IYBfIxS4=;
        b=KGyWlkD5K7I0xP5xY5TghinBA4RuMhbLOhloQzQPvW4dhoDU1URe9fs1iHLTIjmzyz
         kgzCvKZm2uJuI3ABYBPyCl+L1Zix6YSNIj9Fgu+85Rb/1pZYORuV27B5nyGk/rFetJnh
         3mZKMR+fSxebcl1NFNY+yWN1mJgC29oaTwLyNG/O287xFzVUpJ06EdhMxekYHInlBWAG
         vPDN7YlYEn8SfUMcATrd8Vf/31uegg4tNV0dN6IbEJfn4I4W71Ak9sR64fNScuKzEnHp
         fdZVe6B/+spnTly6Gi+iEBW9OzqcdXtkIvqPZor+kWzWw0AhsaxRWhGXyukPCd9JfWJ2
         4eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752242; x=1786357042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hthDC2Kbdeq2qaz2x8s8OZb7AI2FDOI03M6IYBfIxS4=;
        b=irZGlfU1/Q33sXAW/ZNnQndw5gt6mAFmE9NoyyQQ+Fl1c/ux9BDnebJ9b4tyBcqb1h
         a7wDLMLwYA5NgELqO3yWEl4nHqQhk5TlfmPF6ljCCsHHXMMx0EmJLY736XT3lxjc52Mu
         gaXM1Reij8hLPU9dCW0zf77fuGDezp2xDQ5BAvPKyvakC0us1eIy7Qt0x0rEvcWm3DMn
         vpPVofjIM3m1KPTBPoWYDrr9rJPeQoChLwDUzjes9ncdrqMWkR8re38pjVMiKJFcxAsA
         rZdMTnFMOMULHUnC+FCUcUa+cTlyaJYoQalubvp6SverhLXvmz+cnSoVe1I9j0BVGxk1
         9J1w==
X-Forwarded-Encrypted: i=1; AHgh+RrC0RTghe8tMk2GqhJlVFiSCLfx7sWjtIQWKAFqVQuOt0d3lwI+07ns2wbAX3bsYTSllsAtGZAX/24=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhEOVOoj8OIZ53S+HJJ384glM4rjpXmfSaFh4C8yTK7ZjJ7Ke
	x0+1JDjdneV088R09siMP/xwQhEsCQ9jFX0GIYxIyNIKDRQgYMrMlPPE
X-Gm-Gg: AR+sD12/iHKBD63Ly0VpCC67jEau5mzcoI22Dy+0fy5bvvhGMLt1coUyGOSJ+mF9QYo
	ObHuMacbv8f7Is8rV9Swb7eUdSFPAK4NaM1EtEnHJN1ZXysBZTHyojGC13VglrUBSJx2md0JeXM
	7LnvGrZuK9k1ddBxQQfcT0numtmqDdhV4OQvftyaHeCS8ftUYcdwheWv0+lbU2UMTWBmyanZja+
	LdGFvU8uZwQ2HvxO8CUU25W/PETMBSOfsh7akzKHOKJfUc6uVQ1Gn064gwBil+8JEoqNjSOJ3Cs
	4YlGeOaP+X2ya8yDmugja/5qCeuJdOV77WnWOQACYihU93r81vWBcNtaLCkfJy2uantH2p8Mq+I
	9fqdvxPM6VvMrNysCyJDG0odkgGncBVaqua1XARcNlp51WuwkJU6TaMRn+lknAFLOV+3K5F2zkY
	NeKDiPrFRyykBRzcRe4FSidZ2ft6M/m/A1KEoDiPU+QLC/bpQjVjoSzAVWSI6Xu28HFTAoa07Ms
	wTxCjAOz2wNcg==
X-Received: by 2002:a05:6a21:1fc3:b0:3c3:90de:60e2 with SMTP id adf61e73a8af0-3c92a951846mr8695669637.65.1785752241763;
        Mon, 03 Aug 2026 03:17:21 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29359598c88.2.2026.08.03.03.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:17:21 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: 3chas3@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	accessrunner-general@lists.sourceforge.net,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+24eb38c789655fc43663@syzkaller.appspotmail.com
Subject: [PATCH] usb: atm: cxacru: fix use-after-free in cxacru_poll_status
Date: Mon,  3 Aug 2026 18:17:16 +0800
Message-Id: <20260803101716.2592486-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cxacru_unbind(), cancel_delayed_work_sync() was conditionally skipped
when poll_state was CXPOLL_STOPPED. However, a work item previously
scheduled when poll_state was CXPOLL_POLLING may still be pending in the
workqueue at the time poll_state transitions to CXPOLL_STOPPED. Skipping
cancel_delayed_work_sync() in this case allows the work to fire after
cxacru_data is freed, causing a use-after-free when cxacru_poll_status()
attempts to acquire instance->poll_state_serialize.

Fix this by always calling cancel_delayed_work_sync() regardless of
poll_state, ensuring no pending or in-flight work can access the freed
instance.

Reported-by: syzbot+24eb38c789655fc43663@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=24eb38c789655fc43663
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/usb/atm/cxacru.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index f1900c567..fd644ae52 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -1231,8 +1231,6 @@ static void cxacru_unbind(struct usbatm_data *usbatm_instance,
 		struct usb_interface *intf)
 {
 	struct cxacru_data *instance = usbatm_instance->driver_data;
-	int is_polling = 1;
-
 	usb_dbg(usbatm_instance, "cxacru_unbind entered\n");
 
 	if (!instance) {
@@ -1243,17 +1241,11 @@ static void cxacru_unbind(struct usbatm_data *usbatm_instance,
 	mutex_lock(&instance->poll_state_serialize);
 	BUG_ON(instance->poll_state == CXPOLL_SHUTDOWN);
 
-	/* ensure that status polling continues unless
-	 * it has already stopped */
-	if (instance->poll_state == CXPOLL_STOPPED)
-		is_polling = 0;
-
 	/* stop polling from being stopped or started */
 	instance->poll_state = CXPOLL_SHUTDOWN;
 	mutex_unlock(&instance->poll_state_serialize);
 
-	if (is_polling)
-		cancel_delayed_work_sync(&instance->poll_work);
+	cancel_delayed_work_sync(&instance->poll_work);
 
 	usb_kill_urb(instance->snd_urb);
 	usb_kill_urb(instance->rcv_urb);
-- 
2.34.1

