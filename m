Return-Path: <SRS0=8L6C=Y4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062D2CA9EB5
	for <linux-usb@archiver.kernel.org>; Mon,  4 Nov 2019 20:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0A2B20842
	for <linux-usb@archiver.kernel.org>; Mon,  4 Nov 2019 20:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572900844;
	bh=94VpGBso0EiMOXI5aL2nbQ7ZcrVPrd8v37rWOvx1z3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RvBm/K7bqQNjUrlCu9ff3i9uLfe1KTriILwYxhoXyUyqEBhiUNXoZtlyczwXVNxlX
	 5oRnMZQJMKBCljE9rCvD9D09xnnrE2POnXF7Ois5Qd2W4i5/KH6lzMZ75eV2q/3hrw
	 ZCh/L1hvHDJmXIWALfJI3hWUEdWR+Y5B9OFcTlbw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbfKDUyE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 Nov 2019 15:54:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:44476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728602AbfKDUyE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 15:54:04 -0500
Received: from localhost (6.204-14-84.ripe.coltfrance.com [84.14.204.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 786D120717;
        Mon,  4 Nov 2019 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572900843;
        bh=94VpGBso0EiMOXI5aL2nbQ7ZcrVPrd8v37rWOvx1z3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E5bA+ESHbb9VK4d8i8xb6OddEsTBLdxIuCwD5YUUlYSk/JcHZ/dhJki4un6NxbLL3
         ZS5Uxmtk5mCK6yYGdJ8j6do1upv6DSPGP10Yfc2bAnRStohS8mf63eHl+izPkm8qGJ
         W2Znrcbom9h89ItaX2iQAv2tzmsoy3GtkvrYMvac=
Date:   Mon, 4 Nov 2019 21:54:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 00/18] usb: typec: API improvements
Message-ID: <20191104205401.GB2409544@kroah.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104150524.GA2237300@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104150524.GA2237300@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 04:05:24PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 04, 2019 at 05:24:17PM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > I removed the extra error messages from ucsi_acpi.c and ucsi_ccg.c as
> > requested by Guenter.
> 
> I've applied the first 11 patches now, as it looks like Guenter wanted a
> better comment in patch 12 :(

Oh, and very nice work.  thanks for doing this.

greg k-h
