Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B0FC352A3
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 14:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58C08206D7
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 14:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgBKOen (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 09:34:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:38508 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728589AbgBKOen (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 09:34:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E9244C156;
        Tue, 11 Feb 2020 14:34:41 +0000 (UTC)
Message-ID: <1581431677.1580.7.camel@suse.de>
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
From:   Oliver Neukum <oneukum@suse.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 11 Feb 2020 15:34:37 +0100
In-Reply-To: <20200211142855.GC1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
         <20200211135920.GB1498@kuha.fi.intel.com> <1581430450.1580.5.camel@suse.de>
         <20200211142855.GC1498@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 11.02.2020, 16:28 +0200 schrieb Heikki Krogerus:
> On Tue, Feb 11, 2020 at 03:14:10PM +0100, Oliver Neukum wrote:
> > Am Dienstag, den 11.02.2020, 15:59 +0200 schrieb Heikki Krogerus:
> > > cat /sys/bus/acpi/devices/USBC000\:00/status
> > 
> > Technically -ENODEV. It does not exist, even in a listing.
> > But this thing definitely has a type C port. It is connected
> > to a docking station which supplies the whole system with power.
> > Ethernet also works.
> 
> There is still no requirement for the BIOS or the EC firmware to
> expose UCSI to the operating system. If the ACPI node is not there,
> then there is no UCSI on that system. The USB Type-C connectors
> function autonomously in any case on a system that exposes them to the
> operating system with UCSI. UCSI is more like an optional status
> interface that allows limited control over some specific things like
> role swapping.
> 
> UCSI is usually supported when the USB Power Delivery (USB PD)
> controllers are connected to the Embedded Controller on the system,
> but on some of our platforms they are directly connected to the SOC
> instead. So on those platforms we can directly communicate with the
> USB PD controller from the operating system, which is actually much
> better situation compared to UCSI IMO.
> 
> Do you have this ACPI node: INT3515 ?
> 
> It's for the TI TPS6598x USB PD controllers.

Hi,

yes I got that one. Thanks for the tip.

	Regards
		Oliver

