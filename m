Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C1C433E0
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 20:14:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC98208FE
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 20:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgGCUOQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 16:14:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41525 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726147AbgGCUOQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 16:14:16 -0400
Received: (qmail 632670 invoked by uid 1000); 3 Jul 2020 16:14:15 -0400
Date:   Fri, 3 Jul 2020 16:14:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, johan@kernel.org, oneukum@suse.com
Subject: Re: [PATCH v4] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200703201415.GA632596@rowland.harvard.edu>
References: <20200703045811.28154-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703045811.28154-1-rrobgill@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 04:58:55AM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.

Did you notice that this sentence has no relation to the purpose or 
contents of the patch?

Instead of talking about a user tool, the description should explain the 
reason for the patch and why it is important.

Alan Stern
