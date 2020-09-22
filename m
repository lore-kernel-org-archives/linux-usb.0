Return-Path: <SRS0=MsX+=C7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7C2C2D0E2
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 10:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57E18239CF
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 10:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oK1jN/x4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgIVKlB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:41:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:40064 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgIVKlB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:41:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600771260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NkkQRSBZBVj4ZlT0aIgKa5DeN+e78UQ0qW14JhCUtmQ=;
        b=oK1jN/x4mwbeg1CUcFcyNWOQlKM6j7cD6HLcMeV9qUfdiBXjrNdqJKG8SqxfpJXnQHRjgH
        wwKlSOONi6DrDnuxilEIpRO4dA6AOuYkngNcomikbxWjE+Fls9RyNVURe+hzM2H9PJYoim
        eto7FoNNgBTJUY1voToM4c2WIU8l4R8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DAB6EADAD;
        Tue, 22 Sep 2020 10:41:36 +0000 (UTC)
Message-ID: <1600771242.6926.16.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Tue, 22 Sep 2020 12:40:42 +0200
In-Reply-To: <20200922070506.GZ24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
         <1600697816.2424.102.camel@suse.com> <20200921142806.GX24441@localhost>
         <1600700674.2424.105.camel@suse.com> <20200921151605.GY24441@localhost>
         <1600708657.2942.2.camel@suse.com> <20200922070506.GZ24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 22.09.2020, 09:05 +0200 schrieb Johan Hovold:

> The relevant commits are
> 
>   a2bfb4a346d2 ("USB: support for cdc-acm of single interface devices")      (2009)
>   fd5054c169d2 ("USB: cdc_acm: Fix oops when Droids MuIn LCD is connected")  (2011)
>   403dff4e2c94 ("USB: cdc-acm: check for valid interfaces")                  (2014) 
> 
> Before Greg added the sanity checks in that last commit, a broken
> call-management descriptor referring to a non-existent interface would
> cause a NULL-pointer dereference.

Yes.

> The second commit, adding support for a specific device, didn't fix that
> problem generally

Yes

>  and only worked around it for one device by hardcoding
> the data interface to match the control interface,

How do you know. It hardcoded the data interface. That it matches
the control interface is a guess.

>  thereby falling back
> to the "combined-interface" probing you added in that first commit.

How do you know? They may or may not match. 

	Regards
		Oliver


