Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69F233D9E
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459545; cv=none; b=FcjvA1xtF9dt6aDdmNWLB9ik7Ln/9L2RvUtTgAG9ShBw8LzNyuWZGSB8/djk5DYA/hVciLkDstw8UclXMqjDeZmyhKM6omQ53LcUqgdrSwyLQd1eAUeRGiBf/N5G34jnBsnKrzEonCJRagUO0dqNe9MqzeQlS3bcNlCp+ePF9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459545; c=relaxed/simple;
	bh=0J0IlVmdSnNWZ2eIhmkHI8hUC3O1sBWaLuj1YYHVOPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEMkcKHkSVmKLCbyXBO17zvmHSySHNLcEwZN+A4E17vjW13PhFJho+f7HvHasztKSdoj6ErnggJK9hbbHOvwmTKj1V1s7LG33l5EK4syiqiqtMtFPOo3VuHupbe1ilUiTDk6Lrq7kwjcPwjw1RqTjU9943spYzHyCz4HGQFZazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=anOU3dqn; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=HGLUCPIC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="anOU3dqn";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="HGLUCPIC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F6B55BD2E;
	Wed, 29 Apr 2026 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777459538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRISTUwEy9GIyeBqCxTws38Rwk1UfvQWnnycrVV7Krs=;
	b=anOU3dqnP+a9Ft7GuqUxMzv+usT+/qIQQLWRMhl74vGJZn6hesAmo76vY4gDkmJh1YK30i
	YmSP5bX9oyebEeu4o3HGK7mWu0DSZMel831oBO1h/d7VbCMfWYZzlWyNixU856WRPTwHQB
	pf8U5zHnt53qFYNveaPlG/YKgPBAagI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=HGLUCPIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777459534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRISTUwEy9GIyeBqCxTws38Rwk1UfvQWnnycrVV7Krs=;
	b=HGLUCPICxBUtlGvjv+9uMgXrqtbNDs+vx4XDyz1oQCaJGOi18JacMgkwYL5ijgkbCfRlw0
	iBu8tIvJc+GyO1pX7z3c05HCOevR6XkIvuOC3gi3phchkdFECUcwwUNvr6QyXUlQjZqrEN
	G70LuH/UzOuNzn4tgujliLQyq1vg15U=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F0FB593B0;
	Wed, 29 Apr 2026 10:45:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AjdfBk7h8WmmAwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 29 Apr 2026 10:45:34 +0000
From: Oliver Neukum <oneukum@suse.com>
To: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Cc: linux-usb@vger.kernel.org,
	tiwai@suse.com,
	Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] sound: usb: caiaq: fix reference leak in probe error
Date: Wed, 29 Apr 2026 12:45:24 +0200
Message-ID: <20260429104527.19927-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <69ec231a.a00a0220.7773.000c.GAE@google.com>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TAGGED_RCPT(0.00)[2afd7e71155c7e241560];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3F6B55BD2E

If probing a device fails early a reference to a device
is leaked.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 sound/usb/caiaq/device.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 8af0c04041ee..1a9ddbdc2cd1 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -442,7 +442,8 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 
 	if (usb_set_interface(usb_dev, 0, 1) != 0) {
 		dev_err(dev, "can't set alt interface.\n");
-		return -EIO;
+		err = -EIO;
+		goto dev_err_put;
 	}
 
 	usb_init_urb(&cdev->ep1_in_urb);
@@ -462,14 +463,18 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
 	    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
 		dev_err(dev, "invalid EPs\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto dev_err_put;
 	}
 
 	init_waitqueue_head(&cdev->ep1_wait_queue);
 	init_waitqueue_head(&cdev->prepare_wait_queue);
 
-	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0)
-		return -EIO;
+	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0) {
+		err = -EIO;
+		goto dev_err_put;
+	}
+
 
 	err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
 	if (err)
@@ -520,6 +525,14 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 
  err_kill_urb:
 	usb_kill_urb(&cdev->ep1_in_urb);
+
+	/*
+ 	 * private_free has not been set.
+	 * Undoing the usb_get_dev() from
+	 * create_card()
+	 */
+ err_dev_put:
+	usb_put_dev(usb_dev);
 	return err;
 }
 
-- 
2.54.0

