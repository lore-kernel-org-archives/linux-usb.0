Return-Path: <SRS0=WBK0=DA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96F3C2D0E2
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 13:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A17521D92
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 13:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="OlVrevRP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIWNoS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Sep 2020 09:44:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:33262 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726613AbgIWNoR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=1hqk9ObDxCKsKp4GqrA4+fwCY6EqqtELv1CP5bt9GuI=;
        b=OlVrevRPIzuTFIUqjHS9GecVbCyCBDyX9tiqRSocy27HxAx9ClrHd9ZQ1DSUYCJo27hz9a
        pn5br/CeSXCPSQik5XUih+tjLOFgKU1n+8z/RGPcW1RIiMjxLpzbFTUoDerI98NjVH05uk
        WFB4y/oSeLIdIVGCC4WtalQJNjynYBw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6CBA9AD57;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 03/14] Revert "sound: hiface: move to use usb_control_msg_send()"
Date:   Wed, 23 Sep 2020 15:43:37 +0200
Message-Id: <20200923134348.23862-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 119ae38a5cdfbefdf926b34fbf65cd60dc82c95e.
The API has to be changed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 sound/usb/hiface/pcm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index f9c924e3964e..a148caa5f48e 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -156,14 +156,16 @@ static int hiface_pcm_set_rate(struct pcm_runtime *rt, unsigned int rate)
 	 * This control message doesn't have any ack from the
 	 * other side
 	 */
-	ret = usb_control_msg_send(device, 0,
-				   HIFACE_SET_RATE_REQUEST,
-				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-				   rate_value, 0, NULL, 0, 100);
-	if (ret)
+	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0),
+			      HIFACE_SET_RATE_REQUEST,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+			      rate_value, 0, NULL, 0, 100);
+	if (ret < 0) {
 		dev_err(&device->dev, "Error setting samplerate %d.\n", rate);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static struct pcm_substream *hiface_pcm_get_substream(struct snd_pcm_substream
-- 
2.16.4

