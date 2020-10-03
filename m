Return-Path: <SRS0=HmPd=DK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4682CC4363C
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 01:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 108D920719
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 01:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgJCB03 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 2 Oct 2020 21:26:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50127 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725601AbgJCB02 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 21:26:28 -0400
Received: (qmail 307614 invoked by uid 1000); 2 Oct 2020 21:26:26 -0400
Date:   Fri, 2 Oct 2020 21:26:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
Message-ID: <20201003012626.GA306891@rowland.harvard.edu>
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
 <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
 <20200910154109.GC849569@rowland.harvard.edu>
 <495851d0-0ae0-e01b-bbd0-7c41c7e3f620@redhat.com>
 <20200917200949.GC1099735@rowland.harvard.edu>
 <db64c49e-6e1a-c12d-7340-e88edb06c30e@redhat.com>
 <c021bb2b-47d9-c3b2-807b-342bdb71064c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c021bb2b-47d9-c3b2-807b-342bdb71064c@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 02, 2020 at 10:12:33PM +0200, Hans de Goede wrote:
> I guess that this means that it is best to just learn to live
> with the somewhat long enumeration time with the new scheme in
> this somewhat specific case, that is fine with me.

There may be a way around it.  For instance, a shell script (invoked by 
udev when the hub is registered) that checks in sysfs to see whether the 
hub is of the appropriate kind, and if it is, sets the OLD_SCHEME quirk 
for the right port.

Alan Stern
