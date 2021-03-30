Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DAAC433DB
	for <linux-usb@archiver.kernel.org>; Tue, 30 Mar 2021 14:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7C5619CE
	for <linux-usb@archiver.kernel.org>; Tue, 30 Mar 2021 14:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhC3OpM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:45:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:36602 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232007AbhC3Oom (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Mar 2021 10:44:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1617115481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bILaBoOyVxi3UWs4eH5J2+nIGuA3mIox5xXhJ94iCtk=;
        b=pVNJvZnNMo+C9VN309WdrJmGu7eUTRW5pcWARu7OgXL9fZf0lKIsPwL6SxGr9uU4dDYitL
        E+uQcC/60XaG1POlfJ5DZe95uTh8XEf3cMHUUv0frLkoD5Cm5tZV7X+WM5Gx4zEcEIDfMg
        pYOGR9kUvxso+yEfsSyeb7do867FzYc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 36427B315;
        Tue, 30 Mar 2021 14:44:41 +0000 (UTC)
Message-ID: <e0b2984e7de0287c5811a10faaac4d5d6d7d91ef.camel@suse.com>
Subject: Re: [PATCH 3/4] USB: serial: add support for multi-interface
 functions
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 30 Mar 2021 16:44:32 +0200
In-Reply-To: <20210330143820.9103-4-johan@kernel.org>
References: <20210330143820.9103-1-johan@kernel.org>
         <20210330143820.9103-4-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 30.03.2021, 16:38 +0200 schrieb Johan Hovold:
> @@ -1115,6 +1161,8 @@ static void usb_serial_disconnect(struct usb_interface *interface)
>         if (serial->type->disconnect)
>                 serial->type->disconnect(serial);
>  
> +       release_sibling(serial, interface);
> +
>         /* let the last holder of this object cause it to be cleaned up */
>         usb_serial_put(serial);
>         dev_info(dev, "device disconnected\n");

Hi,

does this assume you are called for the original interface first?
I am afraid that is an assumption you cannot make. In fact, if somebody
is doing odd things with sysfs you cannot even assume both will see a
disconnect()

	Regards
		Oliver


