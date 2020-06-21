Return-Path: <SRS0=VqZY=AC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64B8C433DF
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 15:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 798AF20757
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592752823;
	bh=hDewx7x+ARnmKQZfs/RGeP6jJ4cC/irjq4o3NIH3mkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=haViRRZ4LhOOZmqM4lD5UZyVsBnaw+XvwUooIcrOq4AXR+94YTjHf17mHsmE3EIC/
	 lZMg0uEFXvdmpJauqSOwd5gYie2W8CIw1AhybWo3c6moUvUrF1VmYu/TXat7Mstfq0
	 FUukXVQB/fqVLnheApXPCjYoma6jJD1S6XeCyg5I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbgFUPUW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Jun 2020 11:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730269AbgFUPUW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Jun 2020 11:20:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7468E206E2;
        Sun, 21 Jun 2020 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592752822;
        bh=hDewx7x+ARnmKQZfs/RGeP6jJ4cC/irjq4o3NIH3mkc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gSHuCSEyu0u6X4+TGUC6xaqL1+G4Uz/Cl57i7rkyasZoB8/PWTTtrv16xl1fniME8
         djqiNrKPqrWTvZ89EAQuWjIqZVaUmjByRg4bGpEEgBCbHgRKo5fis5TFX8fd77ZJlp
         Kw/89G8fX2eDUjgJfvicSGsetyE7c08L7D29sXUQ=
Date:   Sun, 21 Jun 2020 17:20:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208267] usbip broken with latest kernels?
Message-ID: <20200621152018.GA128789@kroah.com>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
 <bug-208267-208809-jGsxEMTLTR@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208267-208809-jGsxEMTLTR@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 02:52:33PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> --- Comment #1 from DocMAX (forum@docmax.my.to) ---
> Just found out: The problem begins with kernel 5.7!

Does 5.6 work?  Any chance you can use 'git bisect' to find the
offending commit?

thanks,

greg k-h
