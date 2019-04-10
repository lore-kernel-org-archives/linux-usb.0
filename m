Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CB9C10F14
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A22C620820
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 19:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bla3+yde"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbfDJTvJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 15:51:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46973 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfDJTvI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 15:51:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id q1so2149768pgv.13
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2019 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SeXAJL0wpPo6+BBBW52vsqXvxUEPnhyNdehrTQR7HyM=;
        b=Bla3+yde1gz5Fj2kAB7VyjqNzwlsHiL+SZC0PdhEHjs/0gQWfcJpeqFpVVVZ5+P9lY
         i9TDAz+HF2gzHI17+56SjGOFv1fE5wO7+gknWVM1YvaGXy3O1mi00VxcbR5btUm1cTuR
         fu4nhtBmk41wMj9SfZNa7brz8Fx/sjMNSmYM9xQlbyKjeA14uJIPOCM9zWSQDIAtZbh/
         vRfqmmYXku1XKrplHQ//PSTbZdkP35lNAFqeMORt3f8tUFPCPW4aqvvmswdgRxKtM6uA
         PgBLuF750tgrLTM4dsMbUd4MeKGDjFeYqPr3ielc1blhpYk+eqVDAghJ6uE2PSXNns56
         gf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SeXAJL0wpPo6+BBBW52vsqXvxUEPnhyNdehrTQR7HyM=;
        b=WHZbNrq6cOUFRvOsEdRUC/HGFSnd6goNXMAzQv4hYLpTLRS7SuMjnwL0iJHQaCt4Sf
         gJlVTkBb88PdSeEzVQO+mYVf0yyDMp+pMoTYb/2nshpgpIat2cpdJbRn7yjETlY+W1bz
         Ulc4mMEm5iUKPFdwMu2924nq2FoSH6HSBpO6btJU/M9bXu6tsf6mdqhVfXwiqxvjSxMa
         w1FWUR0iPDcMS7A5pM0WiDVhxSxcn09IdNBEpOfHG0MVmPo4A4ArNM9MiBOnX90QkBgB
         uEq/bMgMBafDrLX+owksOiIhqbv/kL3nDIBOv4Pcqx+vfZo8O0VmwXxu+uIGq7Z9H9CK
         M83g==
X-Gm-Message-State: APjAAAVwr5Rpb6ISlJWdGhCB1Sysf85Pb44RMIET0N0OVNxprA+pccRF
        ctObFWOYRw2dPtLfRbymf+I=
X-Google-Smtp-Source: APXvYqxydAGqLgk5ThOA+HZFq4jmKH26AIHWqWGSSF+v7211sYBtPFYd4Dzt1NbqxrNXcWuAHrEqfg==
X-Received: by 2002:a62:a513:: with SMTP id v19mr45076470pfm.212.1554925867794;
        Wed, 10 Apr 2019 12:51:07 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id g4sm4485786pfc.75.2019.04.10.12.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 12:51:07 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 1/2] usb: typec: displayport: Export probe and remove functions
Date:   Wed, 10 Apr 2019 12:50:57 -0700
Message-Id: <20190410195058.9996-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190410195058.9996-1-ajayg@nvidia.com>
References: <20190410195058.9996-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190410195057.RnKCtC_Rm-wBGtvUobQefIxNb3MwFtdyOPt_wvw1jrk@z>

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

VirtualLink standard extends the DisplayPort Alt Mode by
utilizing also the USB 2 pins on the USB Type-C connector.
It uses the same messages as DisplayPort, but not the DP
SVID. At the time of writing, USB IF has not assigned a
Standard ID (SID) for VirtualLink, so the manufacturers of
VirtualLink adapters use their Vendor IDs as the SVID.

Since the SVID specific communication is exactly the same as
with DisplayPort alternate mode, there is no need to
implement separate driver for VirtualLink. We'll handle the
current VirtualLink adapters with probe drivers, and once
there is SVID assigned for it, we add it to the displayport
alt mode driver.

To support probing drivers, exporting the probe and remove
functions, and also changing the DP_HEADER helper macro to
use the SVID of the alternate mode device instead of the
DisplayPort alt mode SVID.

[Fixed two warnings from checkpatch.pl script  -Ajay]
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Tested-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/altmodes/displayport.c | 12 +++++++-----
 drivers/usb/typec/altmodes/displayport.h |  8 ++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/altmodes/displayport.h

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 610d790bc9be..bbf317c838d3 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -14,7 +14,7 @@
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
 
-#define DP_HEADER(cmd)			(VDO(USB_TYPEC_DP_SID, 1, cmd) | \
+#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, cmd) | \
 					 VDO_OPOS(USB_TYPEC_DP_MODE))
 
 enum {
@@ -155,7 +155,7 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 {
-	u32 header = DP_HEADER(DP_CMD_CONFIGURE);
+	u32 header = DP_HEADER(dp, DP_CMD_CONFIGURE);
 	int ret;
 
 	ret = typec_altmode_notify(dp->alt, TYPEC_STATE_SAFE, &dp->data);
@@ -193,7 +193,7 @@ static void dp_altmode_work(struct work_struct *work)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
 	case DP_STATE_UPDATE:
-		header = DP_HEADER(DP_CMD_STATUS_UPDATE);
+		header = DP_HEADER(dp, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
 		if (ret)
@@ -507,7 +507,7 @@ static const struct attribute_group dp_altmode_group = {
 	.attrs = dp_altmode_attrs,
 };
 
-static int dp_altmode_probe(struct typec_altmode *alt)
+int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
 	struct dp_altmode *dp;
@@ -545,14 +545,16 @@ static int dp_altmode_probe(struct typec_altmode *alt)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dp_altmode_probe);
 
-static void dp_altmode_remove(struct typec_altmode *alt)
+void dp_altmode_remove(struct typec_altmode *alt)
 {
 	struct dp_altmode *dp = typec_altmode_get_drvdata(alt);
 
 	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
 	cancel_work_sync(&dp->work);
 }
+EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
 static const struct typec_device_id dp_typec_id[] = {
 	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
diff --git a/drivers/usb/typec/altmodes/displayport.h b/drivers/usb/typec/altmodes/displayport.h
new file mode 100644
index 000000000000..e120364da9fd
--- /dev/null
+++ b/drivers/usb/typec/altmodes/displayport.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
+int dp_altmode_probe(struct typec_altmode *alt);
+void dp_altmode_remove(struct typec_altmode *alt);
+#else
+int dp_altmode_probe(struct typec_altmode *alt) { return -ENOTSUPP; }
+void dp_altmode_remove(struct typec_altmode *alt) { }
+#endif /* CONFIG_TYPEC_DP_ALTMODE */
-- 
2.17.1

