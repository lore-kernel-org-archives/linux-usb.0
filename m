Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AF2C05027
	for <linux-usb@archiver.kernel.org>; Thu, 26 Jan 2023 20:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjAZUAw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Jan 2023 15:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjAZUAv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 15:00:51 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1176B58299
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:00:50 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4fd37a1551cso38049067b3.13
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oItix3jG4qCPecp5WUeVdn8MFWUmFNzwQudW0f6qh8o=;
        b=EQZ7DzFH0xhBjiLV9wEk+bxFk/eBaVummsYyA5ZQ8e+7cHf03o6qAFCQBC35aY7Szn
         Ev+RLMMXvYmaJeC6+/JCAoW7gj45zfCGvQHXfAjzx4zHLJWKGjN3LXlCEvG39IzpEm65
         0OZ7NdIKtJz7M7FmKN8ZqGQ48sZOG/s+Du1qWMDMVYsRpzsUnTaQt4OVuaDwn4Z4K0bD
         vWiSIGUXjkCVxNIlbAvXQ8Xq9221946A5Mh2TOOKiucUwly4TeYLcgrcWHy01xocaUMF
         ty6M2st2+oat7xVB3AXj1Bpf3B/zwcxE/w0puRz8GoCoCxFSTlaTvL4bkMibx8HXaW6w
         EXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oItix3jG4qCPecp5WUeVdn8MFWUmFNzwQudW0f6qh8o=;
        b=bXZCQ5BdGkDrjm8WFYCuZeYolGsSmNng6EkLQOmmQ4I7fZo7BlHRDx9AK7/hPHLcpX
         KP7kecf077GYKfw1OsSQr5dpfumqb54MHKz4WIsRcUvtSFX9eK+sD787cyUYUQo46gny
         4xBmfnyfHaD6xP08ukOJiHzkkANmLO6Cupmt0YqbbStLvcIzneOmuMHXMi6VY0yybPPQ
         HhHRwiJHMMfbNCzecToX8ox+tQI+OrYVkt+WHL7vosZ/3wB3lX/DOjv8GwSVbJsZbpEv
         snEMeWMwQXQ/vtxj/2/vq8rV7wjvhD1q+eeBjobrMdHhJ6uQr1VzPVK7A1gU2Z6vZ9ye
         Ryyg==
X-Gm-Message-State: AO0yUKUk/J6xEbUOsMsWauVBxVP64BrmUyN8isq3shuzvdNSKv0c6VPB
        thdyR60Wc1FE69amdhzwBoJF+zuZHJQf/UkWe8QWyA==
X-Google-Smtp-Source: AK7set+cYfPJvzfOrPX+KxOBk1zIzkGiZ1A0/eFulPJuzaRj5ebpgTZD6igyhHYqZ2h3ez1oAIFj1RTfj0VnS56RLbQ=
X-Received: by 2002:a81:784f:0:b0:506:651b:cd0 with SMTP id
 t76-20020a81784f000000b00506651b0cd0mr1103812ywc.273.1674763249263; Thu, 26
 Jan 2023 12:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com> <20230120154437.22025-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230120154437.22025-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 21:00:38 +0100
Message-ID: <CACRpkdb+UPuWsWz7+cHTpES0Uogx_o1G5m8zqwvO=kG7c1oDcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] usb: fotg210-hcd: Don't shadow error codes in store()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> kstrtox() along with regmap API can return different error codes based on
> circumstances.
>
> Don't shadow them when returning to the caller.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
