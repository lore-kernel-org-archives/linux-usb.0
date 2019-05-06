Return-Path: <SRS0=wK4S=TG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB708C04AAA
	for <linux-usb@archiver.kernel.org>; Mon,  6 May 2019 09:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D677208CA
	for <linux-usb@archiver.kernel.org>; Mon,  6 May 2019 09:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oK8jRTb4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfEFJEC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 May 2019 05:04:02 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41783 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfEFJEB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id m4so14502229edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GyCtV2WD9BR/pjeRSFLmHoIkE393xki68/ZT5CEi8Ag=;
        b=oK8jRTb4bbCRtXjLRNGZkeeDvp/6kd12BZ7Jsj6AN12TRhoFqUIriEpqUyBA5YfvCE
         TLCv8uKiDVPTUiL9vw/g5tZZBI6QgPaOit1esv3S/oR7/zOPzBUyfXSpVYHmB23K2AC3
         lynN3D+AgnoItxprj/CkzSwkpWB45qLCd9FbFySpsscvuxcdsFl5K7iy4D/hd7OD2/2n
         UbC3wYim7z+zde1+oFhN9QHdAm61Sjl8Orxb2C4OPaebzP9N5DLhJmCtpbdv03gfAlfD
         LHFsVYjRrrZ2YOq48voQOih1hwZhE3SrSCWhhHDjF3cx9cUA0ZdhYOqpyp7V9XpYyTiJ
         q2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyCtV2WD9BR/pjeRSFLmHoIkE393xki68/ZT5CEi8Ag=;
        b=OC5zkyUOHO6XtOrDvFRXrj0rkxFeUrLKCJZ7FqjghGOttqOejGC8l9FaXE6mNTEkaT
         pk5QSiqy2SDEXpt/E4W/92dsRghl4YrPT0xUBmH1vWKr5dCQlASCIt1IG8c5L3bjGKBB
         KqitadYVmgRONr2Wgd9Hrr84V+aQ8jIHB8PA1o78dGiytxs5HnOx76C05sUtwMvdO/4r
         CfnOdqWS28aYP4k4ZjoNcfavRlb+TyeGYAuOEYpZOIORmdqWMqNMFkx2XgV9Na+BRE2D
         +SHXcUcQ5bgC+eLcHu9rDo91PYsyZKwF1qjk19XVUzhxGxr13pNPF5ll1uElfYNhMn5e
         uzvA==
X-Gm-Message-State: APjAAAXqi2QLSWclX+q4Qu00xjXAdBHehxkyOqQoZog+88+gtQov835W
        /F/IAc3av7nRGhP9k+2UpYXn8Gh/es4=
X-Google-Smtp-Source: APXvYqzxgiWnCvS5ZxzEk+hJWwNeHXuwBgUvu0rMezryb9t34nGABMdn7GkA0Yi1lXKiRLfjRYw+7g==
X-Received: by 2002:a50:8163:: with SMTP id 90mr25310576edc.208.1557133439289;
        Mon, 06 May 2019 02:03:59 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id f1sm53893edi.34.2019.05.06.02.03.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:58 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 26/34] lsusb.py: shorten find_usb_class()
Date:   Mon,  6 May 2019 12:02:33 +0300
Message-Id: <20190506090241.169665-27-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 47ed22b..eb00211 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -141,13 +141,9 @@ def find_usb_prod(vid, pid):
 def find_usb_class(cid, sid, pid):
 	"Return USB protocol from usbclasses list"
 	lnlst = len(usbclasses)
-	cls = usbclasses.get((cid, sid, pid))
-	if cls:
-		return str(cls)
-	cls = usbclasses.get((cid, sid, -1))
-	if cls:
-		return str(cls)
-	cls = usbclasses.get((cid, -1, -1))
+	cls = usbclasses.get((cid, sid, pid)) \
+		or usbclasses.get((cid, sid, -1)) \
+		or usbclasses.get((cid, -1, -1))
 	if cls:
 		return str(cls)
 	return ""
-- 
2.21.0

