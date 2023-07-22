Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC0AC001B0
	for <linux-usb@archiver.kernel.org>; Sat, 22 Jul 2023 19:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjGVT3j (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 22 Jul 2023 15:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjGVT3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Jul 2023 15:29:38 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D3BD71717
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 12:29:35 -0700 (PDT)
Received: (qmail 1794931 invoked by uid 1000); 22 Jul 2023 15:29:35 -0400
Date:   Sat, 22 Jul 2023 15:29:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Kernel support for wireless USB
Message-ID: <2a21cefa-99a7-497c-901f-3ea097361a80@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg:

To what extent does the kernel still support Wireless USB?  Is it 
supposed to be completely gone?

I ask because there's still a bunch of code in the hub.c for it, and the 
logic doesn't all look right.  Removing it would be easier than trying 
to fix it.

Alan Stern
