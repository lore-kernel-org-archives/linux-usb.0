Return-Path: <SRS0=02k9=EB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD4FC4363A
	for <linux-usb@archiver.kernel.org>; Mon, 26 Oct 2020 12:13:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7279F22284
	for <linux-usb@archiver.kernel.org>; Mon, 26 Oct 2020 12:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4rqaZXU4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jGsY1Swe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774814AbgJZMNZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Oct 2020 08:13:25 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:39554 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1774804AbgJZMNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 08:13:22 -0400
Date:   Mon, 26 Oct 2020 13:13:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603714399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1EwMJJrJoq9M72TuxMBVkcuO2bqjZo2iMyJDC0rzzx4=;
        b=4rqaZXU4BBSEieae/fD/UGWny5Um/PgmeSsKtbbvd3XwaRSFEvkXCQUYylCa3X9FXwzPUe
        6F5IyWwp3nTmg7kVE4yO5bgJgMyy6d7nNjyy8x+eyMrtFtIAw5zfK9FbzxmiLLJZP4DXWX
        zd/cEIchm5x0eJz9JpWlj72h2J4IXYU3aCn331T9gdoUO754LVHCpv4WOvo1j9MY3QxGRw
        gfW3nwHFMiIpIOSZMheth+36grrmG5NtUdF4VxhRlqctvMvtTgMmTpsDnK1JV/lAEI3q0w
        1z0Qde68NzXTR8KD4wiilKoCdmECf5/jK0SyTqofpKD7PypK/BNzrEH1pt8Z/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603714399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1EwMJJrJoq9M72TuxMBVkcuO2bqjZo2iMyJDC0rzzx4=;
        b=jGsY1SweRtkh/BsUgjkXv2LNWyvLH3vVRVOWKbeSYvleZzXbN1974NtEJ6CbLbCg9zmDi1
        xN33/mCoWSv/o6CA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        "Ahmed S . Darwish" <a.darwish@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] USB: serial: keyspan_pda: fix up write
 implementation
Message-ID: <20201026121318.4mqwkkhahnsujngw@linutronix.de>
References: <20201025174600.27896-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201025174600.27896-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-25 18:45:46 [+0100], Johan Hovold wrote:
> This series fixes a number of long-standing issues with the keyspan_pda
> driver and reworks its write implementation so that it can be used with
> any line discipline or for a system console.
> 
> The last few patches cleans up the xircom device support and some style
> issues.

Thank you Johan. This series fixes quite some issues including the
in_interrupt() part. I added the buffer part because it hurt to see an
allocation for one byte. There is no loss without it :)

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Johan

Sebastian
