Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A10C433ED
	for <linux-usb@archiver.kernel.org>; Mon, 19 Apr 2021 14:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C25861245
	for <linux-usb@archiver.kernel.org>; Mon, 19 Apr 2021 14:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhDSOT4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 19 Apr 2021 10:19:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44799 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238337AbhDSOTz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 10:19:55 -0400
Received: (qmail 134732 invoked by uid 1000); 19 Apr 2021 10:19:21 -0400
Date:   Mon, 19 Apr 2021 10:19:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Chris Chiu <chris.chiu@canonical.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's
 Realtek Hub
Message-ID: <20210419141921.GA133494@rowland.harvard.edu>
References: <20210415114856.4555-1-chris.chiu@canonical.com>
 <YHgyP8tGNM1Wi5dJ@kroah.com>
 <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
 <20210415184637.GA15445@rowland.harvard.edu>
 <CABTNMG3aweq43eQcONif2_M4JF3ARmBgOKE18v7vzHvaJnjrtA@mail.gmail.com>
 <20210416153932.GD42403@rowland.harvard.edu>
 <CABTNMG25qPvVu7+EsvEgaUsU_v6jKkSKCaU5VR8CiX3oLQ4VFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABTNMG25qPvVu7+EsvEgaUsU_v6jKkSKCaU5VR8CiX3oLQ4VFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 19, 2021 at 01:11:38AM -0400, Chris Chiu wrote:
> Sorry that I didn't make myself clear. I found that if I applied RESET_RESUME
> quirk on the problematic hub, the Set-Port-Feature(suspend) timeout error
> disappeared. SInce the timeout is not happening for each suspend by default,
> I suspect maybe reset-resume take everything back to clean state for the hub
> and the Set-Port-Feature(suspend) can be taken care of w/o problems.

Okay, that's a good solution for system	suspend.

> I didn't like RESET_RESUME because runtime PM would not work on the quirked
> device.

A more interesting question is whether it will work for	devices	plugged	
into the hub.  Even though the hub won't be runtime suspended, the 
things attached	to it might be.

>  But if the Set-Port-Feature(suspend) can't be handled and
> skipped, I can't
> expect the runtime PM to work for all devices connected to the hub either.
> Is that right? If what I proposed in the patch can not get better
> result than existing
> quirk, I think using the RESET_RESUME would be a better option. Any suggestions?

Try the RESET_RESUME quirk and see how well it works with runtime 
suspend.

Alan Stern
