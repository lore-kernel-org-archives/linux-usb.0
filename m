Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147CCC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 12:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D80BA20811
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 12:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbfDXMan (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 08:30:43 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39259 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729498AbfDXMan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 08:30:43 -0400
Received: by mail-qk1-f194.google.com with SMTP id f125so5840162qke.6
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2019 05:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xG7Py+ICRfVeui+bA2qkTMIpG1PrU3Cs1ZkZHCAUBaY=;
        b=R8wdTJabX/diyI1qcAvpP/1qH/jPet+weQn1yxiTMtWjcexE2Raz7Tz+Y2XF60+X/X
         eLGB1nFSiQ1/bDy/EQ+tB8YWm/RQn8x72gGY40NViTLABUxugq2Kp7b1xuGhrcxIohZo
         nzWIaJmspKGBBJlQzY41Otp5xNtuXmGraeiKQdnPvAVxzoWdkLjjb7gI9Ir8WrvzO9wo
         GJdpw+UQz09N2vjGYQvNjIB5/8w+TlN6dGmy7zB8ZhYJstHPziDsVKVbU5Z5T3/0viRd
         X41EIgNuRBH6dISjWxYwVi/aP3u4KVDURAkPdvEmSGWJpGdsh74TOgVzEd5ofHHCA1B+
         Ej9w==
X-Gm-Message-State: APjAAAWT98+A4lBuFrI7+TpnxBT1KfESxNNnrzkLw0F4ClGURyALMUcM
        uv90fHyuQQctPOM6rL6sXPST8JKCa1K6/vvZwcte/ZRj
X-Google-Smtp-Source: APXvYqzzpResrZsZLBS6T+NxRCNdEfrywBd2udo67A3L+4JMA4jetOeDXfjI36neb7o3Wxz4CQKuVpZkekMy4yPo37o=
X-Received: by 2002:a05:620a:1088:: with SMTP id g8mr671938qkk.173.1556109042172;
 Wed, 24 Apr 2019 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
In-Reply-To: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Apr 2019 14:30:26 +0200
Message-ID:
 <CAK8P3a3_Gkv7bgpYCs9Xog1EB0uXXs=d89OojZ9TaASN-tvJsQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190424123026.HmdTChkgWbFjcrUvJJm_sVu_Y7pGFYivFi9dXxtvt_c@z>

On Fri, Apr 19, 2019 at 11:59 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> Keep EXTCON support optional, since some platforms do not need it.
>
> Fixes: 3def4031b3e3 ("usb: dwc3: add EXTCON dependency for qcom")
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

The patch looks good, but please keep this in sync with the TI driver
that does the same thing, so better convert them both in one patch.

> ---
>  drivers/usb/dwc3/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 2b1494460d0c..6bd1a28c535f 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -115,7 +115,8 @@ config USB_DWC3_ST
>
>  config USB_DWC3_QCOM
>         tristate "Qualcomm Platform"
> -       depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       depends on EXTCON || !EXTCON
>         depends on OF
>         default USB_DWC3
>         help
> --
> 2.17.1
