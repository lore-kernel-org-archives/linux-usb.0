Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1229C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 826E920821
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfDSTTo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:19:44 -0400
Received: from ns.iliad.fr ([212.27.33.1]:47054 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbfDSTTo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 15:19:44 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 60749207AE;
        Fri, 19 Apr 2019 14:12:24 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 47CB220720;
        Fri, 19 Apr 2019 14:12:24 +0200 (CEST)
Subject: Re: [PATCH] usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
References: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
 <20190419112423.GC14886@kroah.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <c8f9fd60-4320-5c07-de6d-7fdc212e9cc4@free.fr>
Date:   Fri, 19 Apr 2019 14:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190419112423.GC14886@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Apr 19 14:12:24 2019 +0200 (CEST)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/04/2019 13:24, Greg Kroah-Hartman wrote:

> On Fri, Apr 19, 2019 at 11:59:08AM +0200, Marc Gonzalez wrote:
>
>> Keep EXTCON support optional, since some platforms do not need it.
>>
>> Fixes: 3def4031b3e3 ("usb: dwc3: add EXTCON dependency for qcom")
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  drivers/usb/dwc3/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>> index 2b1494460d0c..6bd1a28c535f 100644
>> --- a/drivers/usb/dwc3/Kconfig
>> +++ b/drivers/usb/dwc3/Kconfig
>> @@ -115,7 +115,8 @@ config USB_DWC3_ST
>>  
>>  config USB_DWC3_QCOM
>>  	tristate "Qualcomm Platform"
>> -	depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on EXTCON || !EXTCON
> 
> Why is this last line needed?  Does it really do anything?

For the record, there are 42 instances of this unintuitive kconfig syntax:

$ git grep 'depends on [A-Z_]* || !' | wc
     42     342    2965

https://www.kernel.org/doc/Documentation/kbuild/kconfig-language.txt
An expression can have a value of 'n', 'm' or 'y' (0, 1, 2 respectively for calculations).


"BAR depends on FOO" means (FOO=m && BAR=m) || (FOO=y && BAR=m) || (FOO=y && BAR=y) || BAR=n

NB: (FOO=m && BAR=y) is explicitly forbidden by kconfig (special-cased?)
("This feature depends on another which has been configured as a module.
As a result, this feature will be built as a module.")


"BAR depends on !FOO" means (FOO=n && BAR=m) || (FOO=n && BAR=y)


Thus "BAR depends on FOO || !FOO" means ALL 9 combinations EXCEPT (FOO=m && BAR=y)

Regards.
