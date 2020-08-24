Return-Path: <SRS0=p1xS=CC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A946C433DF
	for <linux-usb@archiver.kernel.org>; Mon, 24 Aug 2020 10:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 303AC2071E
	for <linux-usb@archiver.kernel.org>; Mon, 24 Aug 2020 10:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgHXKEo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 24 Aug 2020 06:04:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:33938 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgHXKEn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 06:04:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 47F95AF77;
        Mon, 24 Aug 2020 10:05:12 +0000 (UTC)
Message-ID: <1598263476.6851.1.camel@suse.com>
Subject: Re: [PATCH] usb: uas: Add quirk for PNY Pro Elite
From:   Oliver Neukum <oneukum@suse.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        usb-storage@lists.one-eyed-alien.net
Cc:     stable@vger.kernel.org
Date:   Mon, 24 Aug 2020 12:04:36 +0200
In-Reply-To: <2b0585228b003eedcc82db84697b31477df152e0.1597803605.git.thinhn@synopsys.com>
References: <2b0585228b003eedcc82db84697b31477df152e0.1597803605.git.thinhn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 18.08.2020, 19:27 -0700 schrieb Thinh Nguyen:
> PNY Pro Elite USB 3.1 Gen 2 device (SSD) doesn't respond to ATA_12
> pass-through command (i.e. it just hangs). If it doesn't support this
> command, it should respond properly to the host. Let's just add a quirk
> to be able to move forward with other operations.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
