Return-Path: <SRS0=ob+s=WS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D488C3A59D
	for <linux-usb@archiver.kernel.org>; Thu, 22 Aug 2019 07:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E85F206BB
	for <linux-usb@archiver.kernel.org>; Thu, 22 Aug 2019 07:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566460442;
	bh=8Ur/xHe/hsC0S1ma12+kzlSSnQ+tXZshygTT7p+X+OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=CnS16gASjyEW0TtM/TMH9udw6VL0A3o5Qg8q7X73lbVQ8RSHW3xPA4SO8EAVfPwoh
	 D9/FH38xMymeCqgpMdAzRAXfXEXiVGVseAnglTkse3Te+uqW0t96be7al8//iahT9a
	 0SVmsgIf/e4GXOduyfzJuPKy2/EhHEYa6cKJmIzs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfHVHyB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Aug 2019 03:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfHVHyB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 03:54:01 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFD9B2339F;
        Thu, 22 Aug 2019 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566460440;
        bh=8Ur/xHe/hsC0S1ma12+kzlSSnQ+tXZshygTT7p+X+OE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=0HFJXK7SAodoWq29ztm1NgCl3UeILS2JxVki/vwyOY8NSEmoyD4l+73P5lu/uNfmq
         pI8ShEwx2+hHw4H00ENAhggP4TWQSf22OeEvx+9H+TJnfR3gS8oWckQVO+z59lfJqx
         ziwR0CSMPf2lVwtsCB7Tmkh5jB59Dy6xtDDvoKAw=
Date:   Thu, 22 Aug 2019 09:53:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     andreyknvl@google.com, gustavo@embeddedor.com, hdanton@sina.com,
        syzkaller-bugs@googlegroups.com, linux-input@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech
 driver
In-Reply-To: <Pine.LNX.4.44L0.1908201557220.1573-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1908220953330.27147@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1908201557220.1573-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 20 Aug 2019, Alan Stern wrote:

> The syzbot fuzzer found a general protection fault in the HID subsystem:

Applied, thanks a lot Alan.

-- 
Jiri Kosina
SUSE Labs

