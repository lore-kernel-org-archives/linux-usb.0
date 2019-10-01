Return-Path: <SRS0=EQXy=X2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5677ECE587
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 12:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9669521872
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569933746;
	bh=pSkMpm9s9s1x//p/Xrcv+CAX9qBFD5KnYugqHGJyNDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aqlFpifSPf4qve2oEVI1yo+5/diGjcQCFgnpNSjo8iLIp+DQVLFOegwPAZt+lnQEg
	 /udVxMa1TFYUIKqJ0y41DvF7EfH+z8SRYaz0BeELqqu5nYIKk6Xpy1Y9h04IcQQr0P
	 MD5aAo+qnOXsv9eQFIi9U8KWL9C69NdDvq3I5mt0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388018AbfJAMmW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Oct 2019 08:42:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfJAMmR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:42:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2B8020842;
        Tue,  1 Oct 2019 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569933737;
        bh=pSkMpm9s9s1x//p/Xrcv+CAX9qBFD5KnYugqHGJyNDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwixsgCpVZ8cc6eqyAZX2gvh3aCkU04HIqqY7NP5KZvVDlnRiPF2YYjIVYXCGuOK3
         m2nGQhkIQe4v/sQ+RpV9iqaNwTVLQ9iEd+IuF24muhkoUHr8/tPG5UQhfO3GbYG11h
         agN+B0irg2ymLPuDcB4WQiqrgmiBDV8CGaTdJESo=
Date:   Tue, 1 Oct 2019 14:42:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 11/22] thunderbolt: Convert DP adapter register names
 to follow the USB4 spec
Message-ID: <20191001124215.GF2954373@kroah.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-12-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001113830.13028-12-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 02:38:19PM +0300, Mika Westerberg wrote:
> Now that USB4 spec has names for these DP adapter registers we can use
> them instead. This makes it easier to match certain register to the spec.
> 
> No functional changes.

And here  :)
