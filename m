Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE22C4332F
	for <linux-usb@archiver.kernel.org>; Mon, 26 Dec 2022 23:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbiLZXvL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Dec 2022 18:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbiLZXvK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Dec 2022 18:51:10 -0500
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78880DD7;
        Mon, 26 Dec 2022 15:51:04 -0800 (PST)
Received: from x2100.. (52-119-115-32.PUBLIC.monkeybrains.net [52.119.115.32])
        by cavan.codon.org.uk (Postfix) with ESMTPSA id 43D04424A0;
        Mon, 26 Dec 2022 23:51:01 +0000 (GMT)
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     johan@kernel.org, bjorn@mork.no
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH V2] Add some USB hotspot IDs
Date:   Mon, 26 Dec 2022 15:47:48 -0800
Message-Id: <20221226234751.444917-1-mjg59@srcf.ucam.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a few additional IDs to support a couple of hotspots I had lying 
around. V2 avoids reserving the PPP modem endpoint for the MDM9207 
devices.


