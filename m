Return-Path: <SRS0=WfwZ=D2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE4DC433E7
	for <linux-usb@archiver.kernel.org>; Mon, 19 Oct 2020 12:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA040223BF
	for <linux-usb@archiver.kernel.org>; Mon, 19 Oct 2020 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603111454;
	bh=mwXRr/dsrt07NV/QlJr+XfsSDZ8odzQZs9CqDwr0mNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HpnW7DpVE7UcV3l8J5SXF1WdAmS/AWvsEI03rJj+6ykGbpMUMRQkRhzo9IdETZo5L
	 ouC2JtMqxn029p/uxLdWHwz5l77u9szWpR855xv+D9IPCYlOchtMOjSsg1JRvlk117
	 rQ0FrcJeXG9pGqfQi0p+gyMF6MV4vpHAmR2D5/vU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbgJSMoN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 19 Oct 2020 08:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgJSMoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 08:44:12 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AFDC0613D1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 05:44:10 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f21so7651308qko.5
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U0iCpQNwqpSNPPRI9KoxiIuonBNgpl46UoKSj0g5eCw=;
        b=WplzkcXjFJSdzyNMT6YGg4GDATRIoWV/Px743H88+/I4xnxNUKPqYo73CGAfrSwqwx
         bn6EPmXtUXwrSOcHUgWxpQA7VjrV0StccunFk6Cv0ItrsJHBMBMnpBjZjnlAjGIEN0EQ
         QaT+bG+hd2gEQ57jW8VQWYZZ3Ns29YrzwClQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U0iCpQNwqpSNPPRI9KoxiIuonBNgpl46UoKSj0g5eCw=;
        b=BIUOYKOWscd73llMKwp/RO+V8j7X5q8lBl1N++JS1MaXxMhv9tBkQar4wZwHjf9DZp
         sdrHoAyGfLCzRtKOpySZ5BFhNFPNUCkX2d7gSU83jB0IfM0C0epi0DkA/xG4KHK9WB9O
         imEOWzWnk75hwSKSnv3MWQYEDSN2du9uxobAVpJWvSX++eXi0XjP4tvp66z/b0tus/PY
         s4Yx8Ln8OU7oB/KIkEtqrxTblRbfsl7Zaj9I/tHk5vSejdUoG1UiR2LkblIfcUUeZ7ru
         g475Pd/k6cTK8UOoYygCa2VPz2/VEuf0PmV9GakbKPKMMiJfo0VX+JdSZC6bu17bWPGB
         /LrA==
X-Gm-Message-State: AOAM530/HQgPcq/UQ3lyB0mtnLlp18A1i5N+vQIKgxTpQonn5oJCqcsW
        KaAv5IhH3sWKRVRwkUwVOCsXxw==
X-Google-Smtp-Source: ABdhPJx65NVSCiF6by9xGpPBI7fwYW3qfhwTIA6s7OGFp4+uzS33H0LowngI2W+y61B3yKaZWjW/VA==
X-Received: by 2002:ae9:efc7:: with SMTP id d190mr16372347qkg.12.1603111449747;
        Mon, 19 Oct 2020 05:44:09 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id n57sm4233145qtf.52.2020.10.19.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 05:44:09 -0700 (PDT)
Date:   Mon, 19 Oct 2020 08:44:07 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Sasha Levin <sashal@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.9 054/111] USB: cdc-acm: handle broken union
 descriptors
Message-ID: <20201019124407.kgvxqtfl7zqkwca3@chatter.i7.local>
References: <20201018191807.4052726-1-sashal@kernel.org>
 <20201018191807.4052726-54-sashal@kernel.org>
 <20201019070218.GO26280@localhost>
 <20201019071034.GP26280@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201019071034.GP26280@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 09:10:34AM +0200, Johan Hovold wrote:
> Hmm. Apparently the Link-tag that I had added to keep a record of the
> descriptors provided in the original report also fell out. Another b4
> bug?
> 
> Adding Konstantin just in case.

Correct, looks like this was broken in the devel branch -- the latest 
commit fixes it.

Thanks for the report.

-K
