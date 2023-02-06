Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D00C61DA4
	for <linux-usb@archiver.kernel.org>; Mon,  6 Feb 2023 09:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBFJ65 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 Feb 2023 04:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjBFJ6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 04:58:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315B47AB5;
        Mon,  6 Feb 2023 01:58:34 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F7784DA;
        Mon,  6 Feb 2023 10:58:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675677511;
        bh=ELQlTYvextJsnYnN7QgJWT6mEU7BqmneDvwXiNa1qOk=;
        h=From:To:Cc:Subject:Date:From;
        b=HriiRkdCIwubtvv5lWAYK/nJ7ptfWlSigitS6hGHMoPhfPLKLQqOmfl5n3Rdb9kKL
         MOwr+C5FZ26hebJqTvz9Vw/h0ZhIpQVNSv8GUyIzMJw14QxX6zTrbkWCr317HLjk31
         Eg41MCZIt4rDIdwCUatIyMBjqoLjQy/bLlk8sziA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] usb: gadget: uvc: Correct documentation formatting
Date:   Mon,  6 Feb 2023 09:58:22 +0000
Message-Id: <20230206095822.743784-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The documentation table added in a36afe780461 ("usb: gadget: uvc: Add
new enable_interrupt_ep attribute") was incorrect, resulting in a new
warning when compiling the documentation.

Correct the formatting to resolve the warning.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index eb13cc5d363a..a2d5c648aa2b 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -17,12 +17,12 @@ Description:	Control descriptors
 
 		All attributes read only except enable_interrupt_ep:
 
-		================	=============================
+		===================	=============================
 		bInterfaceNumber	USB interface number for this
 					streaming interface
 		enable_interrupt_ep	flag to enable the interrupt
 					endpoint for the VC interface
-		================	=============================
+		===================	=============================
 
 What:		/config/usb-gadget/gadget/functions/uvc.name/control/class
 Date:		Dec 2014
-- 
2.34.1

