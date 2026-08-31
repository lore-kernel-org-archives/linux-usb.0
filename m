Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35436EA8B
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203229; cv=none; b=BbAj4yTU08qMA20QNbqiFf+d3RV4W71gywp0YsoBrz84WZ2Sh9rVVdup3MJb8pLso1RHwuUIpK18lig5yexYOwQm2IJenphpmqa3ElZrNxxk9NdtpcLXxqtcR7l3ZD+0TioYCVAtyeJ+QH7He/8LjiqwMXN+IUmswMBNyJ1zT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203229; c=relaxed/simple;
	bh=9FDpS9NhatT0d1jYehrEM/mUCpteaEU5GPgN/Tt9iX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3L9FB4PmVBEfRKpEK1wZ69yflfb0LUj5w4a/WGFSCYjKPIqEV25pCkgGUW42+UqIZnQWxR1rm16v3WiDmBRzqPfLuN/gyVqcSdWL76WzKzXtBWMLzhLigiynyHOrLMrmwJO+4HTkYBxk3JvIizMh34cbf7FHDH8FTPJ7hnwnhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdtDu4R+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdtDu4R+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3976713a91.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203227; x=1788808027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02SBPmSvkE0WBy94vSJUxH61zT0eR0teqwzcm9hpKxQ=;
        b=XdtDu4R+Hj0scw/6o//qhCoUqpvLWwoBkzMuke3GwGALY4ePbPczZglZkER4HNprVy
         w/nkIW87bgR8Pxsoym1VZDKgOQGfU/MFMQA/w3xDgn3w1eEDrsNqhhVdAuZgDX9vzWDQ
         BAzv4cWmvqJZGrV3DsCLYNrYUY4kLCCx31Qxi+tvJWZTxVc3cvmwPkGp90hjd60NQk+F
         rZQq7jhYRIQjdDkzaIb7SiS0826AMSr+0iYmF1BMv/yUaXrtgm3muVeTqt0KagkYRR7x
         2jIpdvPBAA23y20qaZF6cePKJiXReIm5ajtgGw76JgsUOS7CocpwTitWNtoxYEi6tz3s
         6HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203227; x=1788808027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02SBPmSvkE0WBy94vSJUxH61zT0eR0teqwzcm9hpKxQ=;
        b=DcYVT8ipFGaHmXqryQUr5+5nFM8B59DuQmFote7EpF6sBloQ0MNV28W2QAmWBCXA+m
         7NmUT1mTk1nwiwR7J2jc9GvTtWqx5N/o54U/YccqAZRjdq8sH72Ae6G5J3I7hIUN1ij8
         35NY/o8m+PtlLKWkiXAvnhi8YJEQjDVzVWMkcWceWYdVnrRF+zr/6WTl3k6so5Yzz+7M
         KMuNdkhsAJdmBvauRUQvdmueIjM4S7TkaDyJhTdk52CqEgUiTSwCez0Wf37aYDPsJ1a1
         tdgSYwQhh7RCKmXXQ4/5kjWPvftQTTd0RjPj7qScBB87G2ilKZgdMdrNhxdPuXADyDpQ
         Q2Yg==
X-Gm-Message-State: AFuF++mHhJ4T6A8KYaa53TIfdfiUSAqvYf1RfcEUJbe5hSYxlC2G9dN+
	SU2P030McCcmjZqI2d9L7UFqzuFt8nHaW7y8VfORwUx34lroYJALgHwaZ5kGYQ==
X-Gm-Gg: AYBFou0uNe/pV4fysGc2QPFd3h3nvpl7Bfwf0FqMebb0KMc37QuXrezYK0WvLq8aeRe
	pvLtQ2eUWplWetX1phH1f7XjLzpLtmc5MB+dw69nK76hEji8ej6kB0EiQScX8pynCSHy1qXVdYu
	HJE3EJ1xMzOvDCoIGtu+ad2r2DFBRnh5FgYTm1mTt+T6KU4rt4FP3j+fnBI37BNeAeGromS9QES
	hppCxdZp/qkJ1t+w9CgiEOo9yooUylDVA/XWV4QeyiakuuIY//idjaC9w5dyGZrFsAuwS4+b15D
	NPVMAn6FaOjMCiqldg2qw/h3u2tHKXIak7rkzUbn+msoSklsjSF3KDCgeq45hHf6y5LLfCBPwOg
	nBVxVhW8ZJtVE+AyE4Qtf6qBb37ofO1KIsBUjWFTDDxSuFVAOqlkr/P0xNP3dSVbaNhX43LEy3m
	vAhQE1C1z+6v2Ukv0RdTV3KMw1y6Ge05zf4/aAZ+93JDOXxtr+aCjhXbp9y2chTq5syQ29mLa0p
	h+AS9ApD+1xNK7fhXtmdW5aE3mo
X-Received: by 2002:a17:90b:4b11:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39907e499f7mr3233657a91.19.1788203226753;
        Mon, 31 Aug 2026 12:07:06 -0700 (PDT)
Received: from localhost ([2409:40c4:13b:7a31:95ce:ef4b:57cf:6fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm36342147eec.14.2026.08.31.12.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:07:06 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathieu Fluhr <mathieu.fluhr@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH 1/2] usb: hub: use shorter 120ms post resume hold for SS root hubs
Date: Tue,  1 Sep 2026 00:33:48 +0530
Message-ID: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices
behind suspended hubs") holds a runtime PM reference for
USB_SS_PORT_U0_WAKE_TIME (200ms) after every SS hub resume, so
downstream links have time to finish trianing before the hub can
suspend again.

But 200ms is excessive for root hubs since a root hub has no upstream
suspended hub whose wake propagation needs to be accounted for.
The root hub still needs some time for USB3 link training to complete,
And root hubs also default to zero auto suspend delay and get
periodically resumed by userspace USB enumeration opening and
closing their usbfs nodes (adb, libusb).
This extra 200ms hold stretches this resume into a suspend/resume
cycle of roughly once per second, which on idle AMD systems have
been reported to cause system freezes.

Shorten the post resume hold to 120ms only for root hubs but
keep the 200ms for external hubs that the original commit is
intended for.

Reported-by: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Link: https://lore.kernel.org/all/CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com/
Cc: stable@vger.kernel.org
Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/usb/core/hub.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..e1415ad5f908 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -76,6 +76,12 @@
  */
 #define USB_SS_PORT_U0_WAKE_TIME	200  /* ms */
 
+/*
+ * Root hubs have no upstream hub whose wake propagation needs to be
+ * accounted for, but still needs time for USB3 link training to complete.
+ */
+#define USB_SS_ROOT_HUB_U0_WAKE_TIME 120 /* ms */
+
 /* Protect struct usb_device->state and ->children members
  * Note: Both are also protected by ->dev.sem, except that ->state can
  * change to USB_STATE_NOTATTACHED even when the semaphore isn't held. */
@@ -1358,7 +1364,9 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 		queue_delayed_work(system_power_efficient_wq,
 				   &hub->post_resume_work,
-				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
+				   msecs_to_jiffies(hdev->parent ?
+			USB_SS_PORT_U0_WAKE_TIME :
+			USB_SS_ROOT_HUB_U0_WAKE_TIME));
 		return;
 	}
 
-- 
2.55.0

