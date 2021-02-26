Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D2C433E6
	for <linux-usb@archiver.kernel.org>; Fri, 26 Feb 2021 10:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F1D864EC4
	for <linux-usb@archiver.kernel.org>; Fri, 26 Feb 2021 10:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhBZKYp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Feb 2021 05:24:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:46010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229835AbhBZKYm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Feb 2021 05:24:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38EB064EE2;
        Fri, 26 Feb 2021 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614335041;
        bh=6hDqvaoslEfbtodCRg9gp+YGCT5e5C6sJ0hCdgAuTnA=;
        h=From:To:Cc:Subject:Date:From;
        b=1HoOtYn0mNPvPQ+y2xGbAFzfZLjejTgiahUlOgr1Gi/Mh4w1OlwOO4UMOZWRefwSR
         PvxUt73NVDszd4dp10+1SMt93x4qjJ6KADndPKyOsekXd0xY0I9ItZGK9zno66FJMO
         TvFjQz0jfXLEbUrlnrt2PJouibLrN/X3KtWL+fFk=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] USB: remove usb_bus_type from usb.h
Date:   Fri, 26 Feb 2021 11:23:56 +0100
Message-Id: <20210226102356.716746-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have 2 forward declarations of usb_bus_type, one in the system-wide
usb.h and the other in the "USB core only header file".  This variable
is not exported from the USB core, so remove the declaration from usb.h
as it does not need to be there.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/usb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 7d72c4e0713c..f15fd0fa95bd 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1257,8 +1257,6 @@ struct usb_device_driver {
 #define	to_usb_device_driver(d) container_of(d, struct usb_device_driver, \
 		drvwrap.driver)
 
-extern struct bus_type usb_bus_type;
-
 /**
  * struct usb_class_driver - identifies a USB driver that wants to use the USB major number
  * @name: the usb class device name for this driver.  Will show up in sysfs.
-- 
2.30.1

