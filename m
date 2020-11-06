Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D1FC55178
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 10:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29BF720704
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604659377;
	bh=lzG1XHFrcM3QcQARAEI6Uz4IHlH2u0wbrmSoCt6+fVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V2qAhKbmPeP6zaHWBJI9KO3NvVlLlUTWMzb15sdoAt4dKsmCZpJ1rpStLiGpl0pWE
	 TngRsIa4K/v9xZqnr+OJHgqNAGBhJxV/70duKhY4GqMYmcM9uRd+U1zOEH+XZrW7MZ
	 O77UOiVZRcOnFMSW5wDY3glIuCj2o1YK42chCG1w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgKFKmy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:42:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:35176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgKFKmy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 05:42:54 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92D4920702;
        Fri,  6 Nov 2020 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604659372;
        bh=lzG1XHFrcM3QcQARAEI6Uz4IHlH2u0wbrmSoCt6+fVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w8amJD6DJbnv+b4uA5X2WJVuUIHmrNo8TXyf8qmXiBGRyNRfwLNP2YgS92BHXN4ig
         n8YQSXUJUGGzCsnYM01r4AvHhG0A40bj/ex9fC89A94WrflT1H4ZpM7TULF+R9ytti
         VJrpSdppG58R+px+5NfxeyTgTmPFdSECl+ZMe2uQ=
Date:   Fri, 6 Nov 2020 11:43:38 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 00/15] usb: serial: avoid using usb_control_msg() directly
Message-ID: <20201106104338.GA2785199@kroah.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 04, 2020 at 12:16:48PM +0530, Himadri Pandya wrote:
> There are many usages of usb_control_msg() that can use the new wrapper
> functions usb_contro_msg_send() & usb_control_msg_recv() for better
> error checks on short reads and writes. Hence use them whenever possible
> and avoid using usb_control_msg() directly.
> 
> Himadri Pandya (15):
>   usb: serial: ark3116: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: belkin_sa: use usb_control_msg_send()
>   usb: serial: ch314: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cp210x: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cypress_m8: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81232: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81534: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ftdi_sio: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_edgeport: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_ti: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ipaq: use usb_control_msg_send()
>   usb: serial: ipw: use usb_control_msg_send()
>   usb: serial: iuu_phoenix: use usb_control_msg_send()
>   usb: serial: keyspan_pda: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: kl5kusb105: use usb_control_msg_recv() and
>     usb_control_msg_send()

For the whole series:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
