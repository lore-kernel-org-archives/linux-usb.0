Return-Path: <SRS0=xrMi=7I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0822DC433E0
	for <linux-usb@archiver.kernel.org>; Tue, 26 May 2020 03:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED27207CB
	for <linux-usb@archiver.kernel.org>; Tue, 26 May 2020 03:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbhnlCMR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388606AbgEZDZg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 25 May 2020 23:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388523AbgEZDZg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 23:25:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3616C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 20:25:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c71so1759437wmd.5
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=buIxI8Dghu/RugFyN26MhBXjzFwVplnZUSLd72o/Yd8=;
        b=GbhnlCMREslfF4RXdo83zJpZ1LOexNG8FfmvexAyMK0G2IuRb5KxIHRvTmmJO9XWAb
         ucpfd6gdW7kH2LZWmUQlf/8zZnfjyNQpV29USaxCKESyMOBHGCxxbGEmwWLHBWZ1bpZM
         inNIM2RkQOGOR03fVnIen4XdV4DgZiJ/8VMOgjP6mrOSmJnxm89WIaOiHqH/X6gmzvUi
         eqnGWYkLP3Put+3ewCVYO5C0Fen46LmbymXJDfLeUQhV8U6qlh+QMHp/lUuLyjNh8CGA
         +VBOSBkJwYn0UL+72pC3H8S37LdqHXKW3jJgcNyYGw8fznNB8sb9hUFB89BNiRdHaMmN
         rWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=buIxI8Dghu/RugFyN26MhBXjzFwVplnZUSLd72o/Yd8=;
        b=TuRYkUQr/dUft0FxDgy8InO/hJ6iP7hIou1m2qMNE9e+4Lp+PH+6bHJGNY7MfDTKFL
         vTPVuusFgHHdXbp6DlVcptE2Ssu7ygPZrE7L1/xSG6TZSVaox5d5sXODO4N53nnW63jk
         j6815Y1xDsMebaLuKmxFjaleNXAyN/X5ZYKYZyjk9ff8KO8h4WXwbodeeJxTApiKHuF6
         zm5XPm5MW3LgvEHP+jVIiu99pokR6+H6ItRvLJhJ4JT5MAf5GJtstjbKQmkiZcmrSx89
         Q5b7n3M/cK3jNSbIifRqRjMYV4VyOGxU1NUzQ5QPoeLeHiTuGzu3tunTk3s2birmEGy1
         1FNg==
X-Gm-Message-State: AOAM532DkOxYn5y38vqaXMtsM+M8OzPWmtJvraIXb4zXCcqA4DEAMbwg
        Ghax3n/3OV94uHemMQV/ro2GQrdl7sK5SOePeY1hArX8
X-Google-Smtp-Source: ABdhPJw+mlKM0AH2WjdjT4+iXhJKTM7NdG2EMlH/DZQUAfkqtmC8ONZaGbkIKfEps/XSaj2NLgbxeSeHvE3L9x5noMo=
X-Received: by 2002:a1c:2bc2:: with SMTP id r185mr29588791wmr.49.1590463534470;
 Mon, 25 May 2020 20:25:34 -0700 (PDT)
MIME-Version: 1.0
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Mon, 25 May 2020 23:25:23 -0400
Message-ID: <CAJz5Opc0zDQxnNp2foPEeL0=hOZ0C9-xy3T4nEO2pRy-rQmpWQ@mail.gmail.com>
Subject: usb: dwc2: screaming interrupt after kexec reboot
To:     Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I get a screaming dwc2 interrupt after rebooting into a new kernel
with kexec.  I fixed it by modifying the dwc2_driver_shutdown function
in dwc2/platform.c so it does

dwc2_writel(hsotg, 0, GINTMSK);
dwc2_writel(hsotg, 0, HAINTMSK);
dwc2_writel(hsotg, 0, DAINTMSK);

rather than calling disable_irq().  Another reason to make this change
is disable_irq() affects other devices if the irq is shared.  I'd
really rather not submit a formal patch, hopefully the maintainer will
adopt this suggestion.

-- 
Frank
