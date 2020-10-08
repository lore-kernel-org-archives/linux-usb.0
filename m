Return-Path: <SRS0=gWik=DP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E06C433DF
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 17:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D1F222200
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 17:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHXJxnRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgJHRzU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Oct 2020 13:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgJHRzS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 13:55:18 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6FFC0613D3
        for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2020 10:55:17 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j21so2152032uak.5
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2020 10:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNQQ8Pzu8RQQ0ORGYkymPkG1Mv2Qdb50Y107jo7+z4k=;
        b=UHXJxnRrqcCyUKjKCYUzXTkrzHXeon0tY5OSJKwEjDrS+2TMWgRDZOizlJqVv6DmVB
         otgnTfPmmXND64V4bQgxJWF149sPI+O86ToB8bEX8xZ3Z4jIyHRDqTb+vTaO8Mrknn3V
         Wkg662TuZZGrga+S4PLlOCEGEh0/Au+I9I/KihvPbOkev+lbVw0JTFZMlDpcsNhveD02
         VEf224Pz+NPz4I6y2ZcheKdTdAjfqyX44YzIScZsAVx6o9wEAo5lX/MwQV8LD5GYCXaX
         K6oqghjFssc1H/uytsE6b1bLptK29lxwI4LuGhEbTlVC0Iscnhpip0J8xyDeIt75QBoD
         FhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNQQ8Pzu8RQQ0ORGYkymPkG1Mv2Qdb50Y107jo7+z4k=;
        b=KttDXYZkoEhlvJTgPAWOHKPUl/VHLIFg367akcb4sFOgAm1fPTef42+FNov87+GK4s
         9qLIkEGRn/cuBfaNmLYw0QKM3Sg+eVX0cyq51rVTCzVScgNTtpaH/3KYQsd4K421uW2s
         0LDsof2xh9nbEzqg0QlCoqfoctxn77DfPxiDo1/1StvB+1mTmAVWe45NfWcl+HmEK6dq
         4sRnBTdgplIfmB0JNNjpw4OfrVB3WfkzYKNx0t2muh8KxJ39OhcGu3uBY6WN/QdGuXDt
         +05MhNb+CZlKlDqT/QXA+SXI6JWqOR04gg/9coXG8hSaZ2lTcIm/yKFX1J641DcoxlKr
         lcTw==
X-Gm-Message-State: AOAM531zYy2DsudjmDB5/J4kRLgT5Yxz1RizzVVERWdSOcl93EWL/Q+6
        ZfM6Rbmh5jngQDP1Trvla3RIxG89QcuxkXd5KXDiaQ==
X-Google-Smtp-Source: ABdhPJzHy4oNsragukowLXjjDBDA85BFdePhpnj4m1jPHyYF9KCFeJ9AIvHl8MqHlPc5VxnQL2lFhzmC075sEGzdz4c=
X-Received: by 2002:ab0:768:: with SMTP id h95mr5325071uah.23.1602179716700;
 Thu, 08 Oct 2020 10:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201008061556.1402293-1-badhri@google.com> <20201008074600.GA247486@kroah.com>
In-Reply-To: <20201008074600.GA247486@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 8 Oct 2020 10:54:40 -0700
Message-ID: <CAPTae5KtMfXoOmqB-gRtLn4DqMHpqwesfR6OvE90akyv3irnjg@mail.gmail.com>
Subject: Re: [PATCH v10 00/15] TCPM support for FRS and AutoDischarge Disconnect
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Greg !

On Thu, Oct 8, 2020 at 12:45 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 07, 2020 at 11:15:41PM -0700, Badhri Jagan Sridharan wrote:
> > Hi,
> >
> > Made two changes:
> >
> > 1. Added "additionalProperties: false" as suggested by Rob Herring in
> > https://lore.kernel.org/linux-usb/20201005144618.GA154206@bogus/
> >
> > 2. Removed FRS dts binding constants to address Rob Herring's comment in
> > https://lore.kernel.org/linux-usb/20201006182940.GA2574941@bogus/
>
> That worked better.  I've applied the patches that Heikki had reviewed
> to my usb-testing branch now.
>
> thanks,
>
> greg k-h
