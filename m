Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108016;
	b=U/18Q0J/CGAd5HommwPe3uNjWTcOQJK+sylfuA8laX05Mzw+AHCCUJwtGp0YvTf6iPt/
	 NL2S47r3/MSMcrDj++5R6GZkJA+6FF2kHA6PfIOFfxSA26WHnJuOd79Ng3YsXVz2lVv8u
	 qt3Coc5Vc3tOBdHlLi+mZei3GpzC1ItwDl84WHkGX7ZTqZDsAtICCdm65XxunEbGgafRa
	 GK2XsNsM4ioL4XoYvWE4NUsq9Y5/D0WDEQgDra05zw0P1ilf4OhXt1c9Z8eJ3gqW+1wAI
	 fCusETyrm/mQaaM89c9g/PGR2hb8gZygjFhRkuLpEjkDmz02YhGrhaVlJIHV4tlUkXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
	b=lxJHl1QcPbOWlBG5g4HyKNZMY+9G0N+6wbZN+fGJF225YKdCxwOl14oKTbQMZG9TLgHH
	 ppL3yyGH81cj1ib0Seav2HNMLW7GUUdIZXpiEtk3bBPAWg8tYox49W1L5Zz9af1pg8To3
	 DlMgysRtSwScGLXB79wd1+Eg4eXtGe6dUqDsDm+9pejzQOifZm5hUONOcz1WF65xSgt2m
	 Rs9GlPABMlf6MatpQupsGJLX3KEFZbmAiu4vSza4MmfucmR8TRC2f/dzoETWfuphmdpzY
	 NX/yEN5hISclVrNy/ussVWfk5rnghdiAZq4BoFztkMs3lmm4mImtT5AfdY2TcgbD1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D69kqJaO;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D1606A32F
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D69kqJaO
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5735cd94235so46611b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108015; x=1795712815; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
        b=D69kqJaOFj/xMnmgzAbYtexvFpnd7Xv3eslGt0CiaVa9tWqs8Z6KOwSCi1VVdu39lE
         Tpo+a2CAi0VkQYErv7WRHUxM6sT6QuXSr6qWUmvjU2758V6juvta/fMmrPU1b0e3pBgx
         xqOHL5ib4IvFgc0Ufcv7v8KNvav+4gWIDQQerhBIykGRZc4wu3lfkoAsHXEszw2cahLP
         +9OCNzkMygaGy1CWPEecy/Z7RBecKvFvJsfSVTMDP1LlTv8pNtZNhw0tuKycnedoHSdm
         QyiMxI1bMTy2l2JUkCKiOvcuTjYpDbSCf2nJwF4McQq6XJx5l/3fur5B0kzBPh3O5z5S
         Qo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108015; x=1795712815;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
        b=yqeFZb1SIinwTkL4sY0oPjNjAgKtAMRFsswJQ4drNAE9xDk1FS8ewuwC9itK1ykyv+
         ejxzL+PIRlzlOsRNFz7DuGdo2+ZV/MDAsBCo9D35DKKd9oz0o9IpySYOu2S8NSfsAdK0
         loxFCD8AcSzydIJ3wTDwHpYbuoi9DFIIil8gJS8Ntfe97ZPJVKhW7caGWQLffjLl+P/Q
         YFaiqEdqVqPXPhT9fpr6L12fSo1ofzAKttMaMtPbXR5DGN7Zm5yGR8w3SE5pE+FoqdzA
         T3NK5mn6kKnCSoERvzN2RQ0TjYOkoOgUHi2hUKvLymZG8CGGeri9v7n+920SpIeHUO2g
         RR8A==
X-Gm-Message-State: APuU4Z9fgjuSl8Iy/TKJak64GdRY6+kyYmy78rQScejicUiTkwjm9Vnd
	4CZYANCe6EqSImq3P5p1ZPciJFdZV75wQbURsScIiwPQHZW3P57kLbhOVcFTxo/53KHQWpHpoy7
	X8ze7inU+4w==
X-Received: from oackg12.prod.google.com ([2002:a05:6871:bc0c:b0:4a8:57aa:3e44])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1394:b0:510:7dc8:5ff7
 with SMTP id 5614622812f47-57a0a40536cmr542360b6e.19.1795108014416; Thu, 19
 Nov 2026 09:06:54 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:49 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170650.1521609-1-irogers@google.com>
Subject: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors from
 attached-state check
From: Ian Rogers <irogers@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
unsigned enum) yet returns negative regmap_read() error codes directly.
Neither hd3ss3220_set_role() nor output_poll_execute() checks for errors;
on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role()
and disables VBUS power. On role-switch providers without a .get callback
(where sw->role caches the value passed to usb_role_switch_set_role()),
reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
out-of-bounds.

Return an int status from hd3ss3220_get_attached_state(), pass the
resolved enum usb_role via an output pointer, and leave the current role
and VBUS state unchanged on I2C read errors.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 60d6de9ba339..212c3624961c 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_rol
 				  src_pref);
 }
 
-static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
+					enum usb_role *attached_state)
 {
 	unsigned int reg_val;
-	enum usb_role attached_state;
 	int ret;
 
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
@@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
 
 	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
-		attached_state = USB_ROLE_HOST;
+		*attached_state = USB_ROLE_HOST;
 		break;
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
-		attached_state = USB_ROLE_DEVICE;
+		*attached_state = USB_ROLE_DEVICE;
 		break;
 	default:
-		attached_state = USB_ROLE_NONE;
+		*attached_state = USB_ROLE_NONE;
 		break;
 	}
 
-	return attached_state;
+	return 0;
 }
 
 static int hd3ss3220_try_role(struct typec_port *port, int role)
@@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
+
+	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
+		return;
 
 	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
 
@@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct *work)
 	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
 						   struct hd3ss3220,
 						   output_poll_work);
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
 
-	if (hd3ss3220->role_state != role_state)
+	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) == 0 &&
+	    hd3ss3220->role_state != role_state)
 		hd3ss3220_set_role(hd3ss3220);
 
 	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
-- 
2.56.1.708.g77570a6a1d-goog

