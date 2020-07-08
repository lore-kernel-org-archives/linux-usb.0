Return-Path: <SRS0=NA4g=AT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B4BC433DF
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 07:11:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D2E920760
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594192300;
	bh=xtTt1fCGAG9u3opMAAzSB3MbjWDFJ2s6qmvPoR4xOHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PRGi3QQKaUEug9Y39B9b1pKP0qeGlBWCOb9cZj3v92jMuRpU8dggwYf1zN1YH2OHL
	 lIih2kEq3glJriQmkWP6xHv7i6ttaVtCoG/mkJETTnaaEk9ataCy6VD3iuoPOhQXvu
	 kV1nDSjrTdR7Ac+GL5ZlpvYAC9Bj2qT++41y+kDQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgGHHLk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 8 Jul 2020 03:11:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgGHHLj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 03:11:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 212B7206DF;
        Wed,  8 Jul 2020 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594192299;
        bh=xtTt1fCGAG9u3opMAAzSB3MbjWDFJ2s6qmvPoR4xOHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wgYgruaeNXlSdjjrdOEe3WqY0JurTSNlthMC2wluYq85Wt1QhBzoK+kDjXr9PE8Z/
         4BF3ux65I83sijGl6TihQTmlgLfeq/Wf94m74S+M2IIdhsBCtTGxNUa3YHt2rx1HUl
         r7pY+6EEyKpDaF3wLzNdu1kBNrVwuonpLOviBB/c=
Date:   Wed, 8 Jul 2020 09:11:36 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "andrzej.p@samsung.com" <andrzej.p@samsung.com>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHVzYjog?= =?utf-8?Q?gadget?=
 =?utf-8?Q?=3A?= function: printer: Interface is disabled and returns error
Message-ID: <20200708071136.GA351604@kroah.com>
References: <20200630052331.33020-1-qiang.zhang@windriver.com>
 <BYAPR11MB26321795232DA6C583866F82FF690@BYAPR11MB2632.namprd11.prod.outlook.com>
 <BYAPR11MB263201D84DF870F9D65836BBFF670@BYAPR11MB2632.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB263201D84DF870F9D65836BBFF670@BYAPR11MB2632.namprd11.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 02:22:58AM +0000, Zhang, Qiang wrote:
> 
> Hi Felipe
> Please review this change.

Please give maintainers a chance, you sent this 1 day ago.

Also, do not top-post.

greg k-h
