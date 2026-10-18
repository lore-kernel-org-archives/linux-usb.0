Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542893EA97B
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341295; cv=none; b=KzQtOTuGJaslp8FU2DtIbf1T4BaJu5tgVQyiqEAHHEAmf5EfRvFqo0PQ5ayHglERGARK/RNcFTKVkf33vWxhwPtkgmi0LaL8bPzZnpiwwfGoOLgWTCHWKzxwjF7gW22rL3IHpUkYUuSN1zsGbmtsVRisfgdxf9LqfxeZAcK/fEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341295; c=relaxed/simple;
	bh=KsvbhHmrpPYdQnremxgLvolRQzFzNASHFLr8Ynq5MnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHrZx7Ql0OOUZb2eFXFzwZPA44Jv2AvmDdBfFWQHLF5mPPU5Im51bGfifsFemu8Td5CADWbyDfCjF6bMG2VBV3gm8dgNCwuw8wfx2YM3U/ayiUp0MAJG63DWzBDGzmPmtbrEqsdnJ5+S0Kq4WupiRNJdAva/9fscgwBlqEcbpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9WCeA0Y; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9WCeA0Y"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so1851529eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341282; x=1792946082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YpKPKplGyC1zv9vCrQd5tlK3JvlHI8Pmz+ZUDoFfyg0=;
        b=T9WCeA0YI514ZO3//AEJhYYo5OYAvjOweaDNxsLm5t5AahQey15DMAnKQIKHLfTW/C
         s6h4FzPx2AwAQyA9xxIdeiF8jWphwBUY+4W1SpmwW2sVzFAsGxDz7qi2T7Xq8I8KpXAN
         a4IbjiwnB8lU9R/cU7rFbqnArwyUQujJ4QVWthHLTUk+3bg6DsXusZMwH3s4lQPWcUxT
         T8BMI0pURZ1AXYaryr83ppZW7UNc0+KRP7Qm0AGS3br6lrDb+boUznKPqGREp/Urt4p6
         QQ6Y/4RoiO0HnuB1WglEnaVajDtjGXodyZrjFpvFdEjmiD4F19PREaaciXFbpInPSRAy
         rbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341282; x=1792946082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpKPKplGyC1zv9vCrQd5tlK3JvlHI8Pmz+ZUDoFfyg0=;
        b=wNX9gQz0YX9xqjeSWuJbv4TjrTK+B2Lrn0efNWKIEkcVUNLZedY4Lj0xTRrOcy0gyV
         f3hJoD+hWWOl5w4A7HBd8OHSOI11yuCgVx8evMHbGX1TDiMAqJOl8Cxzn8UzfNCH9XvS
         ilkfJxiCJo+SC/EW92bM4JCy3C5Gpumt7Ebq/a0zMYgjLgUh80vgpQoCgONwDjVHdrMO
         NMB9qYnyTUmxxG2yTIvZVkDwQLm0vU0wpUwSgZ61BFrgpbFxhjSdICPZpzYFtbW627hl
         FkMiGdEgCmE0l5Gxc7MGpwITEXRCwlLKAz5+l/ZsO8CDzsnps3Fca8IBx98snlyoNifT
         7Tvg==
X-Gm-Message-State: AFq9FYITH8/M7YWrUOkR9LULYQmMdi0QVhBRXJJU4NNlGrLEbmmYLCHB
	1rQ97AxQqmNhBHFpldl+O7CPlVhxV52/qNkoiR7Z3NI52m7pkolDVGqW
X-Gm-Gg: AYBFou0rQNntOjuhl5fxuiqow0V/jiHKdI/VXfvrD9BgNn7enLtUSyiPleOSoCez7Ks
	JG0qSuK7wfeDFtKE5qQH6KkPDYQO7CBIU5LHa8Zu1Dn6XlRWQZHW6KCH3JXfcT7BatLeoLJZP4d
	Jdv4MgTGMLobN2A5QCYe05FdmYlo74Du9MSq6YTfxOc9ng2hauXdLGoXddH10Bf3qy1gOqeMoV2
	Dy34j1k8lM3TlP05MjpaeO0PX4vRXXwYas3Qgscl2xp7PygOy3+0G4j7RLRTheP/ixOm7afZ6sA
	4ycmBCnUeeRQLPMhA4H5SvanHMc7TU1MUR0XfuuyfTSD6OgP6/jQrvp10COhF2uXVElt9FyC5sx
	nqmMjDaUKafGNM0KeYMdOHu0x1885iqwGpocMU1qlh1pMoYGX/Wng/1HBgA/CUWCOFwWmREt0Rr
	KNRgCuiRj5kue5dqcAwZYwnruhNTRS1aigOD7JQJcai/y+JaFfGs2EXIhCxr1gyqcK8o2cqxeyG
	uq4j2dMLgnQiSjh41qrM7s//kJIynjNeNupLMX6nBnXKlzhat01askBaxRqva76MdF81zumpWp4
	V7JKIA==
X-Received: by 2002:a05:7300:dd45:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-361a2b3a5cdmr7150254eec.37.1792341281979;
        Sun, 18 Oct 2026 09:34:41 -0700 (PDT)
Received: from codespaces-393231.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm26303667eec.7.2026.10.18.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:34:41 -0700 (PDT)
From: Eklavya Singh <eklavyasingh2106@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eklavya Singh <eklavyasingh2106@gmail.com>,
	syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadgetfs: fix use-after-free after a failed bind
Date: Sun, 18 Oct 2026 16:34:34 +0000
Message-ID: <20261018163434.129569-1-eklavyasingh2106@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadgetfs_bind() takes its reference on dev_data only right before it
returns success, but its error path calls gadgetfs_unbind(), which
always calls put_dev(). So when bind fails it drops a reference it
never took.

With ep0 open the count is 2, one for the superblock and one for the
open file. A failed bind takes it to 1, closing ep0 frees dev_data,
and the superblock still points at it. The next open of ep0 then takes
dev->lock on freed memory:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x3d/0x50
   gadget_dev_open+0x4b/0x1b0 drivers/usb/gadget/legacy/inode.c:1919

syzbot gets there by making an allocation in bind fail, which is the
"failed to start USB Gadget filesystem: -12" message right before the
report.

Take the reference before anything in bind can fail, so that
gadgetfs_unbind() always has one to drop.

I tested this on dummy_hcd by writing a config to ep0 with fail-nth
set and then closing and reopening ep0, for every fail-nth value the
write goes through. Without the patch KASAN reports the use-after-free
right after the first failed bind. With it, 122 failed binds give no
reports and the last bind works.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1459655b2bf1e798f9d0
Cc: stable@vger.kernel.org
Signed-off-by: Eklavya Singh <eklavyasingh2106@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 67c6ffaf4..f5b97dcd4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1688,6 +1688,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 		return -ENODEV;
 	}
 
+	get_dev(dev);
 	set_gadget_data (gadget, dev);
 	dev->gadget = gadget;
 	gadget->ep0->driver_data = dev;
@@ -1706,7 +1707,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	spin_lock_irq(&dev->lock);
 	dev->state = STATE_DEV_UNCONNECTED;
 	spin_unlock_irq(&dev->lock);
-	get_dev (dev);
 	return 0;
 
 enomem:
-- 
2.55.0

