Return-Path: <SRS0=Q74q=EK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D9EC4741F
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 18:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CED020719
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 18:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6r7xcKt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731735AbgKDSjU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Nov 2020 13:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730821AbgKDSjT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 13:39:19 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C942C0613D3;
        Wed,  4 Nov 2020 10:39:19 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id o9so29123069ejg.1;
        Wed, 04 Nov 2020 10:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7GvwnxF+3L+IBATLZUczJUcZn4xfFfrWMPZWDJc3kOQ=;
        b=A6r7xcKtJjZ0Ib/vffDQn3ptPKfEoBeOhKdiD6dVtLOze62+9Ha93ggrxA8Rq64QpT
         AQAZEX2dsXalCoSxo/0HUBaWsPsd8blqbzaD2NrNrpjSxnYL62Jms/spVPxBy8dCu8fC
         YYMY7XeLSuW7X+4TtvVuA0caMDrAbhL+nZy94D0X6SuLbeF2ZS8FQpuri8lD7X3LwzX4
         /ALnoB8zNNPHc/y2dLfOOxJ0Ig8Rumm5q3Hr25kYWy0NUkOvQ9F4tj/4kBoesSZ/BLD7
         sg1co2SPZN+QZHpw+pC9mA8dKSsgfnwVlraLHQIQdAlEY4NKPuF40Fb8fM/2iuXiC9Ag
         drxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GvwnxF+3L+IBATLZUczJUcZn4xfFfrWMPZWDJc3kOQ=;
        b=VV/lytjuxovYCdMLESo/1atJPEWZB067w1Wq/Qjmn+n6691HKWjhvO2VgDKpzOUvUv
         eTL4H9WgwX6dv+rB0ABsVNYz4iRrX/Xn5t1PoXkdvhdTJ5RoEIDwjPADrn/fOFFh3yb8
         W5mDBvfJb9zHZvOvaVyMPJXaL9Q6OQlbYC1q48FpQQH62WcEzhnAEb7B8/rU+Kce327B
         wx2SzMAN7ChrLc2P9XtDcOuznCMp92WX0GSq10IzLA42c/kSYni0c4VS9WsvVKCx8Jur
         rcA3uMCMIxftWh3ZtxF+vAWXKSMeyS3i/bbcxN2Q0BiLiip80HXFnhJ2AxLFhmv8pInE
         YMvg==
X-Gm-Message-State: AOAM5300j8CXh9pjIzCc96CZtVgnwONIHBO4L9YGrBtpr79fjqoXs6tl
        MHI3pjS9TPXA6pnG7DvF3rkNbusunZoItlEei1A=
X-Google-Smtp-Source: ABdhPJwO37t4YPIyIChshs5b7TqIvKauwg+xet5VnLQGKOKg8ewvBbX9vj6LsvOjsqVGDYahw5/6UE6r5k8k2T+IZPk=
X-Received: by 2002:a17:906:4a4c:: with SMTP id a12mr25498683ejv.392.1604515158291;
 Wed, 04 Nov 2020 10:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20201104140030.6853-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20201104140030.6853-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Wed, 4 Nov 2020 20:39:01 +0200
Message-ID: <CA+CmpXtqdfJ_gWCUG6DABFabSzWv7m3cex3Aja9Nddp5u_tyNg@mail.gmail.com>
Subject: Re: [PATCH 00/10] thunderbolt: Add DMA traffic test driver
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 4, 2020 at 4:00 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi all,
>
> This series adds a new Thunderbolt service driver that can be used on
> manufacturing floor to test that each Thunderbolt/USB4 port is functional.
> It can be done either using a special loopback dongle that has RX and TX
> lanes crossed, or by connecting a cable back to the host (for those who
> don't have these dongles).
>
> This takes advantage of the existing XDomain protocol and creates XDomain
> devices for the loops back to the host where the DMA traffic test driver
> can bind to.
>
> The DMA traffic test driver creates a tunnel through the fabric and then
> sends and receives data frames over the tunnel checking for different
> errors.

For the whole series,

Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
