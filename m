Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128E9C4321E
	for <linux-usb@archiver.kernel.org>; Tue,  8 Feb 2022 11:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357627AbiBHLb7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Feb 2022 06:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349055AbiBHKey (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 05:34:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED055C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 02:34:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CEF361562
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 10:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6D1C004E1;
        Tue,  8 Feb 2022 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644316487;
        bh=tpnD5ProEcoCxpcedaIL/JDOI9oCt3z6+CGq3zlZPw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItL5R4sDnGoUjQCjsyaHPW1Vh9xJKb6yH6YLmbDXk/yO6cmF7daNDFZQ+xmzaTtlX
         RdQDqxJru8qjjaEiC4Uxo4W/zGXViheB5/Fcon849mbyl+QOzkwNKQ4xx8tmPcq63c
         Vx72hhzeAI7Bo2fZilIN0TO5i3SixIoFTdr+6c2k=
Date:   Tue, 8 Feb 2022 11:34:44 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        Dmytro Bagrii <dimich.dmb@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YgJHRKQHQheKTwjU@kroah.com>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207000822.697343-1-dimich.dmb@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 07, 2022 at 02:08:23AM +0200, Dmytro Bagrii wrote:
> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.

You forgot to cc: the author of that commit, why?

Also forgot to cc: the maintainer of the driver/subsytem?

> CH341A has three different modes of operation selectable either by
> hardware pin connections or by external EEPROM configuration. Each
> mode is represented by corresponding product ID:
> 
> 0x5523: Asyncronous Serial Interface
> 0x5584: Parallel Printer Interface
> 0x5512: EPP/MEM Interface

That does not corrispond with what Jan-Niklas said in the original
commit.

> 
> (See "5.3.Function configuration" in datasheet at wch-ic.com/downloads/CH341DS1_PDF.html)
> 
> When CH341A is configured as EPP/MEM Interface it appears as 1a86:5512 and being mistakenly
> handled by ch341 USB serial driver.
> 
> It is possible to use CH341A in EPP/MEM mode only if ch341 module is blacklisted, but it must be
> unblacklisted every time to use CH341A as a serial converter. Also obviously it is impossible
> to use two CH341A boards in different modes simoultaneously.

Please wrap your lines at 72 columns.

thanks,

greg k-h
