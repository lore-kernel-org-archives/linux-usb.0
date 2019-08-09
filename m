Return-Path: <SRS0=eELU=WF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F23C433FF
	for <linux-usb@archiver.kernel.org>; Fri,  9 Aug 2019 05:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D63B32171F
	for <linux-usb@archiver.kernel.org>; Fri,  9 Aug 2019 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565328685;
	bh=9992HpsHy4ORbpbxRDPz9CMArBXpRegjV9cFPB7maGo=;
	h=From:To:Subject:In-Reply-To:References:Date:List-ID:From;
	b=hPz0Tixn6oees9tjSZny1k5UZgNholh4W06PlKMM1nV7Pib2rYzF6QcC8rv73ia6z
	 VhDbwYaXxfxo+6uPHh59L9RtBZD9OPtbKr4+YbNtJ8s1x93Z6kAiG2Ha7DHFKWY/3l
	 jECfVsiGsXviYf3aUbx7qqsXuNiBuhlfapBZ3AyI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfHIFbZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Aug 2019 01:31:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:24328 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfHIFbZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 01:31:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 22:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="193315187"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2019 22:31:22 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
In-Reply-To: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org>
References: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org>
Date:   Fri, 09 Aug 2019 08:31:22 +0300
Message-ID: <8736iagb11.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> Some host drivers really do not like keyboards having an OUT endpoint.
>
> For example, most UEFI forked from EDK2 before 2006 (or was it 2008 ?)
> have a bug, they'll try to use the *last* interrupt EP in the
> descriptor list and just assume it's an IN endpoint. Newer UEFIs
> use the *first* interrupt endpoint instead. None of them checks the
> direction :-(
>
> This adds a "single_ep" option to f_hid which allows to specify that
> only the IN path should be created. This should be used for keyboards
> if they are ever to be used with such systems as host.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Could you come up with a slightly more descriptive name? single_ep
doesn't give me any hint of which endpoint will be left around.

Perhaps call it 'disable_output_report'?

-- 
balbi
