Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16033C4708D
	for <linux-usb@archiver.kernel.org>; Sun, 25 Dec 2022 21:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiLYVCB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 25 Dec 2022 16:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiLYVCA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Dec 2022 16:02:00 -0500
X-Greylist: delayed 552 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Dec 2022 13:01:55 PST
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4185F2DF1;
        Sun, 25 Dec 2022 13:01:54 -0800 (PST)
Received: from x2100.. (unknown [IPv6:2607:f598:b99a:480:2da1:ebcf:44f5:35ad])
        by cavan.codon.org.uk (Postfix) with ESMTPSA id A1A3040918;
        Sun, 25 Dec 2022 20:52:37 +0000 (GMT)
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     johan@kernel.org, bjorn@mork.no
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Add some USB hotspot IDs
Date:   Sun, 25 Dec 2022 12:52:21 -0800
Message-Id: <20221225205224.270787-1-mjg59@srcf.ucam.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a few additional IDs to support a couple of hotspots I had lying around.


