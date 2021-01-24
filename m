Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91D7C433DB
	for <linux-usb@archiver.kernel.org>; Sun, 24 Jan 2021 00:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA3C225AC
	for <linux-usb@archiver.kernel.org>; Sun, 24 Jan 2021 00:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbhAXAW3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 23 Jan 2021 19:22:29 -0500
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21354 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbhAXAW2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jan 2021 19:22:28 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611447700; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=a1lEF8i8arpFPvQ/zu5SqUeLfiKMfwTJT+PJbQLnD0NjsfcY0F2AS3FlV4C5wZKgdyOsBKZv1HNf7DrhaN7e3u/uT13yJrOSC0eAJv0WAokfQI5mMhsmn1MBEBXQOIYBVvT2T3thnhLXRHJgodpFvTurPfL2CXNBYuAP/RsSNgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1611447700; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=XcMH2Ny66m7Kbn41p5/5n9zui7vrj7HcB4U6PlXOG2o=; 
        b=QMnzIg0CUl0B6jlMHBTezQF4fa2V7zbbVPh2P+ydpwP9RDso5oaAmj3SUTro8yVZ0urwIiR7NVdNzIYA7YaFGzRvXA0zhziOEtAlGg1kjBsk+coE8V1ChT4lOESx1zgn15JO7cVKIcJQyscdy5MMo7KamTnsQQkSv7eSLKuSowU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=jeremyfiggins.com;
        spf=pass  smtp.mailfrom=jeremy@jeremyfiggins.com;
        dmarc=pass header.from=<kernel@jeremyfiggins.com> header.from=<kernel@jeremyfiggins.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611447700;
        s=zoho; d=jeremyfiggins.com; i=kernel@jeremyfiggins.com;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        bh=XcMH2Ny66m7Kbn41p5/5n9zui7vrj7HcB4U6PlXOG2o=;
        b=VZrGqO7GE6P9CpzY6M0lXmueaiHCtTxuh0OANq63ixQdzM5asdxR+rZBn9QE3KTM
        uubRVx0b7Xz625hSEge9aT36XIK1DKVlaM3KdLlVudTRjYcLLoSOoW2qwaxkw8xygLF
        KFDVvypS2rBlKyS5qdWxVZVItciUBEDLjbLvhIgQ=
Received: from watson (cpe-173-174-84-94.austin.res.rr.com [173.174.84.94]) by mx.zohomail.com
        with SMTPS id 1611447699061331.70404183235314; Sat, 23 Jan 2021 16:21:39 -0800 (PST)
Date:   Sat, 23 Jan 2021 18:21:36 -0600
From:   Jeremy Figgins <kernel@jeremyfiggins.com>
To:     zaitcev@redhat.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: [PATCH] USB: usblp: don't call usb_set_interface if there's a single
 alt
Message-ID: <YAy9kJhM/rG8EQXC@watson>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some devices, such as the Winbond Electronics Corp. Virtual Com Port
(Vendor=0416, ProdId=5011), lockup when usb_set_interface() or
usb_clear_halt() are called. This device has only a single
altsetting, so it should not be necessary to call usb_set_interface().

Signed-off-by: Jeremy Figgins <kernel@jeremyfiggins.com>
---
An alternative fix was submitted previously as:

USB: usblp: add USBLP_QUIRK_NO_SETF_INTF flag

and this superscedes that patch. This is a different approach, so
I submitted it as a new patch, rather than adding a v2 to the first
one; I hope that was the correct thing to do in this case.

 drivers/usb/class/usblp.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 134dc2005ce9..c9f6e9758288 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1329,14 +1329,17 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
 	if (protocol < USBLP_FIRST_PROTOCOL || protocol > USBLP_LAST_PROTOCOL)
 		return -EINVAL;
 
-	alts = usblp->protocol[protocol].alt_setting;
-	if (alts < 0)
-		return -EINVAL;
-	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
-	if (r < 0) {
-		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
-			alts, usblp->ifnum);
-		return r;
+	/* Don't unnecessarily set the interface if there's a single alt. */
+	if (usblp->intf->num_altsetting > 1) {
+		alts = usblp->protocol[protocol].alt_setting;
+		if (alts < 0)
+			return -EINVAL;
+		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
+		if (r < 0) {
+			printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
+				alts, usblp->ifnum);
+			return r;
+		}
 	}
 
 	usblp->bidir = (usblp->protocol[protocol].epread != NULL);
-- 
2.29.0

