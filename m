Return-Path: <SRS0=8+e4=US=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942ADC31E49
	for <linux-usb@archiver.kernel.org>; Wed, 19 Jun 2019 14:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D05C21855
	for <linux-usb@archiver.kernel.org>; Wed, 19 Jun 2019 14:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cOiq5jfY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfFSOaO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Jun 2019 10:30:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33324 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFSOaO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 10:30:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so7331375plo.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wbSy2s8b06uYzvj3ndAKYZAduDYOArcZnaIvxvyQgo0=;
        b=cOiq5jfYeEGcgPX22TOVA4gcm3kYgfJ7cH2GXUsJe/DJvO5PzONBTuRUY7rEQ46AIu
         WehGhnrygYSzah/rah+b42PU/kyAp1+moLsufPnxN7nOanZPfksq6271SRXH4IjfZbzM
         FTP6SZ0Pap1GqfpmMF935NYkAmAPC+LZacioNcxjgsidZyQpUyH/t3nqzX8a9vKrTdUE
         Y24NUSuvWj79OjZRLdvR4bwILgw1yUvSPAvrLdewIcUqOcpyqIBOllHqcIqC1fh5WKQU
         S4ZZOS8sbDZnmyAugflSvukT350q0w7Z6goOJUhVYOdtP2B8CMVmrTi9ow1UznBZITrz
         QMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wbSy2s8b06uYzvj3ndAKYZAduDYOArcZnaIvxvyQgo0=;
        b=pk33o1LNH51iNqNZhOSUEMJmYGz1CyEDn5xpgzTNugrkGP+PAVW1EPfX86ymPZQyck
         puWyno7TEnT+l+/NH9O73oVzmO+AqDfBuxr2hM623ROlEYONiV39FhFVVZ/w7N06keuM
         vjUpM5hUvmVJvcbbMVINNSyZgaawL46W8kheSgHxBd3kgc+T9eRZQ/eqAELYXobehiba
         A7Ol8V/NBDYbMHrULkZGbRD7PeGsxkRXVfL507Yf6jb5gub1URhN1E/B5OS8e79u8LgG
         K0sA1CbUWBEsqklr9aDPxmLhN/iIUcyV75YgqP4e25BlvnnWlYol70NzQNzpl+oMFt16
         vIVg==
X-Gm-Message-State: APjAAAU8IAbHJE44uUeOlW5t454/X9VR1R0wUZVTchYntsiurQfHgvu9
        thFzYBNyTtaDx9mWHd3SSvblyZu+WFo9oiMO2hYR8g==
X-Google-Smtp-Source: APXvYqxJeKxi+JFTcCbZxYUAMWmmpAcV2XApTu5wfpBcn7Gp7GAJhuHOE1pOGX85L/aTMVNbl1lpN4W2j/DdlCP3mw4=
X-Received: by 2002:a17:902:8609:: with SMTP id f9mr111024389plo.252.1560954613254;
 Wed, 19 Jun 2019 07:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
 <20190502163907.GA14995@kroah.com>
In-Reply-To: <20190502163907.GA14995@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 19 Jun 2019 16:30:01 +0200
Message-ID: <CAAeHK+w9xGtaQ5oSCq-=1YNk_11T2Tz9LKehkL7ZsAz-XwKajw@mail.gmail.com>
Subject: Re: [PATCH] media: pvrusb2: use a different format for warnings
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>, linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>,
        syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 2, 2019 at 6:39 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 02, 2019 at 06:09:26PM +0200, Andrey Konovalov wrote:
> > When the pvrusb2 driver detects that there's something wrong with the
> > device, it prints a warning message. Right now those message are
> > printed in two different formats:
> >
> > 1. ***WARNING*** message here
> > 2. WARNING: message here
> >
> > There's an issue with the second format. Syzkaller recognizes it as a
> > message produced by a WARN_ON(), which is used to indicate a bug in the
> > kernel. However pvrusb2 prints those warnings to indicate an issue with
> > the device, not the bug in the kernel.
> >
> > This patch changes the pvrusb2 driver to consistently use the first
> > warning message format. This will unblock syzkaller testing of this
> > driver.
> >
> > Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> > Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't think I see this patch picked up anywhere. Should this fix go
through the USB or some media tree?
