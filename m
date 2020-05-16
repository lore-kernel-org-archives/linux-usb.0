Return-Path: <SRS0=Ebyp=66=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E249C433DF
	for <linux-usb@archiver.kernel.org>; Sat, 16 May 2020 11:34:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8B2A20728
	for <linux-usb@archiver.kernel.org>; Sat, 16 May 2020 11:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuTQQw84"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgEPLef (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 16 May 2020 07:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726202AbgEPLee (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 May 2020 07:34:34 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742CCC061A0C
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2020 04:34:34 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id f18so4923508lja.13
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2020 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2QKIb7tCZNXGAt7a6kfjs6Ld8K7RbQinyCn1SMdfrHE=;
        b=SuTQQw844xyIimQAaSZ8ojXrsHTJw2l7slkLTwcINuhNVhGzIJVUR2syjWGEYCg3x5
         +a2Dp0VVG8OtmqNuQBw0m0Yke2Y4j0ObrRJNWCvWZEt+IdketfFLfQyvHHYm0mYLtdyC
         ev0MVB7AOhmg1P/ZZe/MWSF6oKxmMwyrBCCOSze9dSc6imhzLPWKws9sQ9goM++IwXxv
         UUklsQQ6TnzVlhnfvD4GA1JqN/a/AC8kk+uCFyD/+kn1nCMkoreXly+cTPoAGoyG4hiH
         2lsya2OuqJBa9HLvZKh2sGqv10BthZEq8aCrfVsSqvpuiiXsQhnO5Y2cwt39kRVL5t0m
         WkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2QKIb7tCZNXGAt7a6kfjs6Ld8K7RbQinyCn1SMdfrHE=;
        b=jU2kZh+j60/xsRkNZ3LnlVnjt7320MUa4kqVMvqxOpvdrPOGB9Ia6RLfTxn8e4REhu
         Dg+ARGS/JOKMNfjBKQ9Wi6YW8bb1sFSGHMjMSlnW/oz53WQYSwgWSCq/if+ZdORa0J1J
         V5QxkpE6g9C5Kamv7ShyN/sATN6ohZYQ5O8lrf0z0WRVpVH2rNPb+wQHNtK2UECwoCN6
         r7oLS9pDSi/Cjtbl8lHCie3UwHDjhc7kP0EOqacHbg52l/iEhtHq4822RSjLNghJyaTv
         KGETAtw5Y+4jCt8YAXo8Y2E/MFCXWThcjbWrysqezw3bnbvHf5cs0qDdHYvH2IsMU7GY
         wknQ==
X-Gm-Message-State: AOAM533fbedj9+/9xJ9yC++Z0x2B2Wd1IWDRnwWOwYY+0hGu/boEq2+Z
        fZt4Lps6TeHNxF2swwfRdQvQeyObWd/ARptSAjw=
X-Google-Smtp-Source: ABdhPJx+idCZ2QHSyXs+C81cXNl5p4AKttGDhs7L1EHt5gmXMHW8Z56Ur71l719DZOvoFh5y/+mCfcVROQHEHyD5SYo=
X-Received: by 2002:a2e:5753:: with SMTP id r19mr4724707ljd.195.1589628870941;
 Sat, 16 May 2020 04:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
 <VE1PR04MB6528C12091A5B0BD2DA0E51A89BA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528C12091A5B0BD2DA0E51A89BA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 16 May 2020 08:35:46 -0300
Message-ID: <CAOMZO5DzV6Kcxtd=UUL6iYW82rArviB7SA_y2eOzkKa3YjWe8g@mail.gmail.com>
Subject: Re: usbmisc_imx: charger detection errors
To:     Jun Li <jun.li@nxp.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Li Jun,

On Sat, May 16, 2020 at 3:33 AM Jun Li <jun.li@nxp.com> wrote:

> This indicates the voltage of VBUS pad is below VBUS valid threshold(defaut
> is 4.75v), how is vbus connected on your imx7s-warp board? is the vbus connected
> from USB connector to vbus pad of imx7s SoC?

I have sent you the schematics off-list.

Thanks
