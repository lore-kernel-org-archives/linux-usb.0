Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD8BC433EF
	for <linux-usb@archiver.kernel.org>; Tue, 21 Jun 2022 20:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354330AbiFUUXi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 Jun 2022 16:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354331AbiFUUXV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 16:23:21 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3F322B20
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 13:23:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id mf9so9536237ejb.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhJQcMlSnFoacV2KwcdFXpjtba+IaB/sZyuFW7tBT+c=;
        b=epbu3P3cY++CvsJWFX9rqxwKCIZ1HaftiAiLiPKOBX/SuNxREsfwYANixXlw73aJoD
         YeSiKTf/2tQl+U/ndTBwzMKwyRcfRbfGJQYyCGQheC+iSe7QGhr+yOInJxXAPDdgxMwn
         8azIXpbuQbkO2keBtOuDV5cOiHCaZ2eHLPSofuGcChQDzjNB37jSujXaFs/efxWfjhPa
         5ccm25uoo7LlIhqoL2UDRepNfaqqo2EQqIU2Sc/EGRhbcViiNdLTtWAr9ggYGWqdv6OH
         nEr/og2fbKcTY/8Uj3GZ6+T6IxWfFROA8Z0i5HxCY9NvKeXQcb7A6FR6NarbeSee6hC2
         ahmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhJQcMlSnFoacV2KwcdFXpjtba+IaB/sZyuFW7tBT+c=;
        b=gcLO2pvjBk3OPppcubd6wvmDGAuJeP+OGWN4cVEENwspSHZwF91jrI/prbUHyoiRy4
         Noe1uUBj5zHQ5LcRGCg79SKC9vJqnvaE2TjWrcjX11ZbBRZDCY1/Yp+AV1I96dXb4aU7
         571YiF8dMh7J/PRkDkVg6pg9JBArliA/2/9Fyd60Mxjbp5nXq0+z5HJ2DqZKMedrMzrC
         8cHwCjsm5dp3p6aB20cApewgVAiajfgBEHllv9trsOeBWLEE3V5vdWDfe7452y4cyJRg
         /3sDQ3cAGUXpPb6Tw4YCFG18q3rzlFDVs9Kej8FgVbDCmvjeNGqNqMT80BdRf8qQGYYF
         uPZg==
X-Gm-Message-State: AJIora/U3evwN76lx6aSN5VDYetZc3Kio19BKBVwUlz0OPWMG+C91Cbk
        7Lm6CBJxBRfCCGOTVXdNcmXI+0cFco1QEjRqoIBttQ==
X-Google-Smtp-Source: AGRyM1syldNCsF4yTG1CqNeyR+d//+kPIDUAn8FkfXpI6Ib8/JA3UGUsecd0zG+9GJgtedGAH6mxDaNCH8juW6fW3Jg=
X-Received: by 2002:a17:906:c193:b0:718:d076:df7 with SMTP id
 g19-20020a170906c19300b00718d0760df7mr28212396ejz.358.1655842996119; Tue, 21
 Jun 2022 13:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-4-davidgow@google.com>
In-Reply-To: <20220621085345.603820-4-davidgow@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 21 Jun 2022 13:23:04 -0700
Message-ID: <CAGS_qxpXkTZiebd=zqJTY8wvSs1TuBvBuDdxYkPEjwnkQ+ir2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] thunderbolt: test: Use kunit_test_suite() macro
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andra Paraschiv <andraprs@amazon.com>,
        Longpeng <longpeng2@huawei.com>, Paraschiv@google.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
        linux-mmc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Matt Johnston <matt@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 21, 2022 at 1:54 AM David Gow <davidgow@google.com> wrote:
>
> The new implementation of kunit_test_suite() for modules no longer
> conflicts with module_init, so can now be used by the thunderbolt tests.
>
> Also update the Kconfig entry to enable the test when KUNIT_ALL_TESTS is
> enabled.
>
> This means that kunit_tool can now successfully run and parse the test
> results with, for example:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_USB4=y \
>         'thunderbolt'

With this, we can maybe revive
https://lore.kernel.org/lkml/20220214184104.1710107-1-dlatypov@google.com
by tacking it onto this series if a v3 goes out.
There is the open question of whether we should put UML-specific
config options in the file, though.

If we decide we don't want that, then we can defer it until I send out
the patches for "repeatable --kunitconfig" and we can add the
uml_pci.config file.

>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Daniel Latypov <dlatypov@google.com>

LGTM.
