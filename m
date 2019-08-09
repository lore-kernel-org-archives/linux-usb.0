Return-Path: <SRS0=eELU=WF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E932EC433FF
	for <linux-usb@archiver.kernel.org>; Fri,  9 Aug 2019 12:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA5FA21743
	for <linux-usb@archiver.kernel.org>; Fri,  9 Aug 2019 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565352358;
	bh=weWGdBLKgFkHgJY0mKr4g3qWhWohhedktTMqqoLrr80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=B5VNCa7Zv/mnfWHNaECfi+0G2iio3TqhQ/5Sg6cOh1UejT6iCPC/ALKwjFd4Qk1Sl
	 m0kZ1i/kZUnucc3YTBTQMvkZJiZtA8+3r3ZoRqBfAdIvMXbrsHmXkAD+SjWGkx5HfT
	 ti1eovIlOC/crJQxNNTBkQk0FihmMfcNB6D/szxg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406669AbfHIMF6 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Aug 2019 08:05:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:61963 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbfHIMF6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 08:05:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 05:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="175139225"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2019 05:05:56 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
In-Reply-To: <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl> <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
Date:   Fri, 09 Aug 2019 15:05:55 +0300
Message-ID: <87r25utufw.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Michał Mirosław <mirq-linux@rere.qmqm.pl> writes:
> Rewrite console support to fix a few shortcomings of the old code
> preventing its use with multiple ports. This removes some duplicated
> code and replaces a custom kthread with simpler workqueue item.
>
> Only port ttyGS0 gets to be a console for now.
>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Ladislav Michl <ladis@linux-mips.org>

checking file drivers/usb/gadget/function/u_serial.c
Hunk #7 FAILED at 1206.
Hunk #8 succeeded at 1302 (offset -2 lines).
Hunk #9 succeeded at 1334 (offset -2 lines).
Hunk #10 succeeded at 1363 (offset -2 lines).
1 out of 10 hunks FAILED

Could you rebase on my testing/next?

-- 
balbi
