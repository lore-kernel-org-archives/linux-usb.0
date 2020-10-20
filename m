Return-Path: <SRS0=jKIj=D3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09D5C4363A
	for <linux-usb@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C4912225D
	for <linux-usb@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gn81M0+D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409014AbgJTTjM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Oct 2020 15:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409009AbgJTTjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 15:39:11 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A25C0613CE;
        Tue, 20 Oct 2020 12:39:09 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a3so4449408ejy.11;
        Tue, 20 Oct 2020 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGa0T8OkLLMmgfjB4YAzLF5Kxm/033tJDwKOPiI7Ego=;
        b=gn81M0+DMt7jNCodc+D0l8rZMWwOuAkOeZgL5AAMXnUsvFj4999pDx0QSER6EFRJfL
         UQmleD7H107xY7LciGX6OiNXJdac+BYUD2/Wl6V01q71xL7fu7v1osGOgxK2MB0yOipY
         rau9NDUvUI+UNbQiSEwA4UUygdjeK18y4G/XLLQMQERPTJZDNoNeRoTWoSfW7jb17hUt
         G7tMOrvKnqDLY2W75Qb1C9mmI9xvyyPVth6okgyZCPXfus7K4W7nnMRKQuAWKvbX9Kqt
         3AguBFnkWQqfAUPkuLHY/J60jp/LVBuVcsXxU0lWnArrHW9uxM8/H7t7BabyQ8zRGxcc
         nRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGa0T8OkLLMmgfjB4YAzLF5Kxm/033tJDwKOPiI7Ego=;
        b=acj0MVqsn88VdNeMy6oZanW6YMHQfoDWq+2jQIDSGtOS1S+Kju+9waBT21QHdvfoHy
         Tvm+JP64+mFXjGYQmTaz1My3yi+4+hllC1FPM1owi+VQmLKSOeTIBt8zqIW4YZhvOSms
         WtyDzkka9uys+MXTgJFsWXZSP9eUQCbiUCEQhdQtGLBPazJSiZzMdAVzAsJyI4fLxv5c
         qpQKn63vXbELp/KZL9VOQTykJSrexdPomDlwfh1YkfftWPhyHlru7FjtzOwbcJhz63C5
         eevUk5hxCL9RkcstGxsCuiGGmutVhOlZAW+l/LUdwei3Cvd/KsB1vyiT+mzhKnNJ62Vw
         /JxA==
X-Gm-Message-State: AOAM5319lJtL3hkEwBz03D6Qf35qEI6ShzJcUF526IQsIpYgvhHoJzgo
        y5N50oJF0NPICmKgXRy02gwoZ6cfWsvhvEn+nWU=
X-Google-Smtp-Source: ABdhPJy+NlD78wLx9VHzH32hEHLAj60GshDRrO8+OvYaj+GURm05w76Xt9z4xnQGQySbl056x6n4imZShIST8fP9P9k=
X-Received: by 2002:a17:906:2cc5:: with SMTP id r5mr4891487ejr.328.1603222748692;
 Tue, 20 Oct 2020 12:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru> <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 20 Oct 2020 21:38:57 +0200
Message-ID: <CAFBinCAQkia9HCGVUZ_hD7p82h40NsNoSNmH5X7ihnOf3CBMjw@mail.gmail.com>
Subject: Re: [PATCH 05/29] arm64: dts: amlogic: meson-g12: Set FL-adj property value
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 2:00 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the property is supposed to have
> uint32 type. It's erroneous from the DT schema and driver points of view
> to declare it as boolean. As Neil suggested set it to 0x20 so not break
> the platform and to make the dtbs checker happy.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
