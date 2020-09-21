Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1C0C43463
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 08:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 256D3207BC
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 08:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="U8DG9z+D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgIUIn2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 04:43:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:51820 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgIUIn2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 04:43:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600677806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YRs6yQrUvyrhqBTzQuXc6opXj3znHr2gi3DSYZrIBfc=;
        b=U8DG9z+DKU+gt+GqeLUcpvnH2yKSraZvtoJxdkL5VG/k1yHIkLK0buuMxGeCf0MR0RzDnZ
        6Dq8gZrBN5BcuFF3odPOZzDUOUJGakZBNQhHEw43dE/J8TLjtp1PEOclLLuuqKoCvXY54z
        Wg3a19I7txM9+vO3fJxcTeJwz2b983Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 96E2EB511;
        Mon, 21 Sep 2020 08:44:02 +0000 (UTC)
Message-ID: <1600677792.2424.61.camel@suse.com>
Subject: Re: [PATCH v2] USB: cdc-acm: add Whistler radio scanners TRX series
 support
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        stable@vger.kernel.org
Date:   Mon, 21 Sep 2020 10:43:12 +0200
In-Reply-To: <20200921081022.6881-1-johan@kernel.org>
References: <20200921081022.6881-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 10:10 +0200 schrieb Johan Hovold:
> Add support for Whistler radio scanners TRX series, which have a union
> descriptor that designates a mass-storage interface as master. Handle
> that by generalising the NO_DATA_INTERFACE quirk to allow us to fall
> back to using the combined-interface detection.

Hi,

it amazes me what solutions people can come up with. Yet in this case
using a quirk looks like an inferior solution. If your master
is a storage interface, you will have a condition on the device you
can test for without the need for a quirk.

	Regards
		Oliver

