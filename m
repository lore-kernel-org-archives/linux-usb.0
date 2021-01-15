Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CF9C433E0
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 12:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0123C23128
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 12:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbhAOMC0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Jan 2021 07:02:26 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:44505 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbhAOMC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 07:02:26 -0500
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Jan 2021 07:02:25 EST
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 362E33EBB7;
        Fri, 15 Jan 2021 12:54:28 +0100 (CET)
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
To:     Jack Pham <jackp@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210115104047.3460-1-jackp@codeaurora.org>
 <20210115104047.3460-2-jackp@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2c5481fe-f5be-5d6a-f62f-c93d04b9210e@somainline.org>
Date:   Fri, 15 Jan 2021 12:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115104047.3460-2-jackp@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


I might be wrong but it looks as if you forgot to add a compatible for the "sm8350_usb3_uniphy_cfg" configuration.


Konrad

