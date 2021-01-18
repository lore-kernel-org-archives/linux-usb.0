Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B69AC433E0
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 06:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3FF2229C6
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 06:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbhARGcw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Jan 2021 01:32:52 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21190 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732441AbhARGcu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 01:32:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610951549; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FvvEhUCfCsPdOZ5IqVfNiwN/9PpX9OC08L+DYKz9fAw=;
 b=OAse5MERRkI6gojcccC4SE+NP37Z6SPBHuaO/W96beMacrn1ZtlnVtV4B+VZiA2SXpJfFAbL
 Wt6os8qSMnrD7EJWvXghn13tt2I/vmvsWm4E0b+z4lHC5xAuGbzRfLB8xpRv6E1W+OQKuOVN
 w2DxURlnzFwRJVvvh8tfc54mthI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60052b63ba7f868506fe6376 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 06:32:03
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE935C43463; Mon, 18 Jan 2021 06:32:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C78E9C433CA;
        Mon, 18 Jan 2021 06:32:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 18 Jan 2021 12:02:01 +0530
From:   sanm@codeaurora.org
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown callback for dwc3
In-Reply-To: <87sg7544da.fsf@kernel.org>
References: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
 <87sg7544da.fsf@kernel.org>
Message-ID: <1a9050a56805b4d95482ccb45edcbb97@codeaurora.org>
X-Sender: sanm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-01-13 14:10, Felipe Balbi wrote:
> Hi,
> 
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> This patch adds a shutdown callback to USB DWC QCOM driver to ensure 
>> that
>> it is properly shutdown in reboot/shutdown path. This is required
>> where SMMU address translation is enabled like on SC7180
>> SoC and few others. If the hardware is still accessing memory after
>> SMMU translation is disabled as part of SMMU shutdown callback in
>> system reboot or shutdown path, then IOVAs(I/O virtual address)
>> which it was using will go on the bus as the physical addresses which
>> might result in unknown crashes (NoC/interconnect errors).
>> 
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> 
> sounds like this is fixing a bug. Do you have a Fixes tag for it? 
> Should
> this go to stable?
> 
Didn't encounter any bug till now but made this change to prevent issue.

>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c 
>> b/drivers/usb/dwc3/dwc3-qcom.c
>> index c703d55..a930e06 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -790,13 +790,11 @@ static int dwc3_qcom_probe(struct 
>> platform_device *pdev)
>>  	return ret;
>>  }
>> 
>> -static int dwc3_qcom_remove(struct platform_device *pdev)
>> +static void __dwc3_qcom_teardown(struct dwc3_qcom *qcom)
>>  {
>> -	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>> -	struct device *dev = &pdev->dev;
>>  	int i;
>> 
>> -	of_platform_depopulate(dev);
>> +	of_platform_depopulate(qcom->dev);
>> 
>>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>>  		clk_disable_unprepare(qcom->clks[i]);
>> @@ -807,12 +805,27 @@ static int dwc3_qcom_remove(struct 
>> platform_device *pdev)
>>  	dwc3_qcom_interconnect_exit(qcom);
>>  	reset_control_assert(qcom->resets);
>> 
>> -	pm_runtime_allow(dev);
>> -	pm_runtime_disable(dev);
>> +	pm_runtime_allow(qcom->dev);
>> +	pm_runtime_disable(qcom->dev);
>> +}
> 
> you can make the changes smaller by adding:
> 
> 	struct device *dev = qcom->dev;
> 
> The nothing else needs to change in this function ;-)

I will do this in next version
