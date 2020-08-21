Return-Path: <SRS0=Ypd4=B7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF05CC433DF
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 16:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8270320724
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 16:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4OT/gY3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHUQfY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Aug 2020 12:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgHUQfP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Aug 2020 12:35:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F029BC061573
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2020 09:35:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v15so1211669lfg.6
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2020 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YL+P6Pw/48SgTNLgXx/Nghqv1a7S0MhoyIifbQGSwuY=;
        b=c4OT/gY3P/zYqugTlra4Zwboi/ZayhHMj7V8zQlvQCF1nToMNsVNywnHoRmipkXl3f
         mrOqz1jEVu20nSVS6pTrENtqRz7Xu7Bqw8EJMd6Xn3A67/4ubJ5Y8UszVK5kuHOUH94N
         QyE3c0D7pX7ihWtiHnTnFQojtQOoTn1MgWHwZCN8Q1fXwdq8BMHW9Lpcy5+9nk6r2pwU
         GqF+P0mykLTe9kwR5rptK6EgC07siAasngR6k0pmFjJj7pd/jfmEjY5Zkbx66ceRpsi+
         jGhU6j21kaM6TCtoavLIpQsWoahkfbnWuseOvjj5aDZF3VMBuc/mH/j0c79Qffqq/P3m
         Do6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YL+P6Pw/48SgTNLgXx/Nghqv1a7S0MhoyIifbQGSwuY=;
        b=DP92WZhA1xlHtPuH/1XqtMmc4L2Qg0OWl4qBj0m/SkvLzVcpcixlNToWk2Zs1zOu39
         kt6pqxmdUaaLM4VND4BaigSWF2+OGIQ/CSFXjRPNkzlXs5lKpcUzi/m2L72vS5qrpFeL
         lPCx9MAtjXqBJrDGCY6eItjnXLWDzu/YV9x4mGo1WeZkr4nJm9BuSQTy2cJEWDPLti2S
         8xEYtavaMYnUnrfxobaU+2AWto7YnEXnpxw/vowhBm3uKJfw6y4F1BLS3jbrOyZcYwsx
         U+I7t3lyfdTbYhPFvEiiXV9mdtVsBa8D3u8/BjWibqmY8BXhVMdHrDOZ4ZjACqdO/d5Y
         GRKQ==
X-Gm-Message-State: AOAM5303CdnB81y/+WOUa3IaVmb/qQSYbgYDiDykwoUDQDwADvfETcd0
        /c+iRauQjTYjkpLahweV35V9eTVjGfFZYL+WJ/228C9pmZSqnw==
X-Google-Smtp-Source: ABdhPJwSoMrfOFOPAgqB1YSnL3HZi6oIw7Ib21OLiwOIHtpPcJSU5W9PMuzgCwRbz1tbjRoagSvcPCcW0lfMX9BytFg=
X-Received: by 2002:ac2:5335:: with SMTP id f21mr1787421lfh.114.1598027711509;
 Fri, 21 Aug 2020 09:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu>
In-Reply-To: <20200821160321.GA256196@rowland.harvard.edu>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Fri, 21 Aug 2020 18:34:55 +0200
Message-ID: <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I read the usb 2.0 specs and generally came to the same conclusion,
except I wasn't 100% sure because 9.1.1.5 talks about "configuring" in
the context of bringing a device into the "configured" state, which
one could argue isn't really the case if a "set configuration" message
is sent to a device that is already configured with the exact same
configuration.

> Together these should explain the correct behavior.

I'm not sure I understand what you're implying here. That the kernel's
behaviour is correct or not? (You're explicitly citing the usb *2.0*
specs, but that should also apply to a usb 2 device plugged into an
usb 3 port, right?)

Martin
