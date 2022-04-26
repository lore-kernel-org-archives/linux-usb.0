Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41666C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 26 Apr 2022 12:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345854AbiDZMk5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Apr 2022 08:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiDZMko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 08:40:44 -0400
Received: from pnkfpffh.outbound-mail.sendgrid.net (pnkfpffh.outbound-mail.sendgrid.net [50.31.63.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E9E614E
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=0QdbzT14rUw1aPmVm+rnuJcDQeRGQ8UuebgKN+ZPZj0=;
        b=YVt4VwLT9Xmcm6W1BA8pDD7hrzfb1VTfJlJVUna9xvb333Sz7+0nhpusn8wv/NCUehaA
        ieO94hFP8TJUieI8RyZ2dLdVakUx2ukWe7NbP243OX9ERMV+ttGSI11Ocyhbs6nUG3aHAU
        8jayzAG39aHey3ImBUeCvzQ5qmEWl+NtXaw9BXowhDyZXBzzyYsY7+DrpUhjYwV9n535HK
        jATqSVy5c213Sgp3dVVFUkx3wPE0TggYO7XkOn5QNn6pSiqcy9HXHMb2Y0Ds37carSTB3e
        n+dWZRHKtMv2gsuCVzeiwsIydDRsUtn7XDieWgFZa9v8poBGSN367tnX1CkBPn2w==
Received: by filterdrecv-67b64bbffd-6fpwk with SMTP id filterdrecv-67b64bbffd-6fpwk-1-6267E78F-1F
        2022-04-26 12:37:35.472183663 +0000 UTC m=+1695131.847996084
Received: from midgard.internal.axentia.se (unknown)
        by geopod-ismtpd-1-1 (SG) with ESMTP
        id gWW7ogiDSK2MS5NsKshxaw
        Tue, 26 Apr 2022 12:37:35.026 +0000 (UTC)
From:   Daniels Umanovskis <du@axentia.se>
Subject: [PATCH] USB: serial: ftdi_sio: fix format specifier
Date:   Tue, 26 Apr 2022 12:37:35 +0000 (UTC)
Message-Id: <20220426123714.2000-1-du@axentia.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?Q0J120W4ZU2dvxvzBhStZcyp23eAYLPzAz2fSUg6MjfeWGicT4FGxyT7O14zxp?=
 =?us-ascii?Q?kiRPCLaCzZjS7wquF0+OL7Xq3GVckQi=2Fg7U+gaa?=
 =?us-ascii?Q?uxclZWs5QLuG5BB+XHQRz9wfH30wK95aV62=2FctT?=
 =?us-ascii?Q?7AljcwnAYWqoxx9=2Feodzrc6fkaKodwBnVMdXsmx?=
 =?us-ascii?Q?zJMvoBRIcKtfyxzd0Kb2ZCAX7MAx38VvOflqznA?=
 =?us-ascii?Q?gceujFR0Gqme44LNs2++H=2FT0BZJfFzZ+dAxR2a?=
To:     johan@kernel.org, linux-usb@vger.kernel.org
Cc:     Daniels Umanovskis <du@axentia.se>
X-Entity-ID: eEMfc9IaaDEroFpbtZJ/HA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The latency is an unsigned int and should be printed as such

Signed-off-by: Daniels Umanovskis <du@axentia.se>
---
 drivers/usb/serial/ftdi_sio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 49c08f07c969..b440d338a895 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1671,7 +1671,7 @@ static ssize_t latency_timer_show(struct device *dev,
 	if (priv->flags & ASYNC_LOW_LATENCY)
 		return sprintf(buf, "1\n");
 	else
-		return sprintf(buf, "%i\n", priv->latency);
+		return sprintf(buf, "%u\n", priv->latency);
 }
 
 /* Write a new value of the latency timer, in units of milliseconds. */
-- 
2.30.2

