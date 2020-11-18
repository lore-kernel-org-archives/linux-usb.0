Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB85C56202
	for <linux-usb@archiver.kernel.org>; Wed, 18 Nov 2020 00:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0021B24199
	for <linux-usb@archiver.kernel.org>; Wed, 18 Nov 2020 00:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Er5jrtRz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgKRAoj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 17 Nov 2020 19:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgKRAoj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 19:44:39 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0CEC061A4D
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 16:44:39 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id 199so180203qkg.9
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 16:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jvMBZnCEU5HoaKmEz2zC68vpae0VCPnCFkIIwIpMjCk=;
        b=Er5jrtRz40N9KHFqK3cRPXgMF0i3IBbwmRk6dSn01KOUDUMfMTesxKstZ/Dt5cFXna
         1ZODWfd4S/lLnDugAhoeyPGWx9DNNOmwlkugIsswm2gaqJQdKTFkIQHf8slWLj2I/3l4
         KlgtE1QD1Td96KeLNBs3ojUC9Ch/qfH1Dd3wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvMBZnCEU5HoaKmEz2zC68vpae0VCPnCFkIIwIpMjCk=;
        b=hhxM8tua5DgZlAlHuAPEDPTPAL7noGFgWBl7ONgM6KQCh/6/nvKE6TYootE04xTUlF
         CoZUtibDRPynfnmlNM8SvQjOQ7ctqUSxM1C7Vytq/8oU3fK+TUs51Z0XopRYQnX+Zdyu
         2hnNfHNIJg28XCRZuFFUfZ1fz8OLZj9NI99JA+LQhy2Xan/32Ni1wpvSHDwwgVjCwGvJ
         9c7r9xw2z73sxG7bjPSGJjUVUnJKJHeQISnhP0VFVYCfZ+mLM/WscbLKMvTRCb6bb+JO
         3eA8dMJI0/k2t8/dyPH2yQpc/hEpw/JDEqkcq17W1tXxu43WDG+WPBZipTGSN5BvGs8K
         f5jg==
X-Gm-Message-State: AOAM530L79JPiqgNKeXiAd8GTDhb6f6C8JTqET1l5Yr37zCxJC8Zeimp
        +41v7c7nzi94uMzXuURppgE1tFIVRRqnNDciZrJwWQ==
X-Google-Smtp-Source: ABdhPJwdlObKSjwaCKGeUXkqhAFPM3jkFlTSb1KkSlXnuE9weNacpVZAv3k/Wz1OebvdaRrbgz0pjZ92COdoUXuvGzc=
X-Received: by 2002:a05:620a:6d4:: with SMTP id 20mr2477398qky.4.1605660278520;
 Tue, 17 Nov 2020 16:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113202503.6559-1-utkarsh.h.patel@intel.com>
 <20201113202503.6559-6-utkarsh.h.patel@intel.com> <20201117211619.GD1819103@google.com>
In-Reply-To: <20201117211619.GD1819103@google.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 17 Nov 2020 16:44:27 -0800
Message-ID: <CACeCKaf6ErEdzcWAXU_1ES63za8GunFgWfOnhiJOowY3iYA6UQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] usb: typec: Use Thunderbolt 3 cable discover mode
 VDO in Enter_USB message
To:     Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 17, 2020 at 1:16 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Utkarsh,
>
> On Fri, Nov 13, 2020 at 12:25:00PM -0800, Utkarsh Patel wrote:
> > USB4 also uses same cable properties as Thunderbolt 3 so use Thunderbolt 3
> > cable discover mode VDO to fill details such as active cable plug link
> > training and cable rounded support.

On digging into the Cros EC code further, sounds like active cable
link training and cable rounded are necessarily only part of
cables that have a TBT cable VDO, so sounds like the approach in the
patch is fine.

Sorry for the noise.

Best regards,

-Prashant
