Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14915C4332F
	for <linux-usb@archiver.kernel.org>; Sat,  1 Oct 2022 07:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJAHkQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 1 Oct 2022 03:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJAHkO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Oct 2022 03:40:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEA248CA1
        for <linux-usb@vger.kernel.org>; Sat,  1 Oct 2022 00:40:09 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a80so6087075pfa.4
        for <linux-usb@vger.kernel.org>; Sat, 01 Oct 2022 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=apiWtnyGOMWCuS6Vht2xIlsRwnMXQe/x1uJaSrzYCPk=;
        b=XNIIC47PLCTKp+TDRqJn1k3QSfSANIzhylqUxJ8X6wTXIRxhQxY9SaLFt4Z+Meo9zH
         cDFBkHr9sT1uGwF6nAJn59G04xA5+E+z88y/LGSfL8/3lYCf93mVlR8XXhYYdZ+bqhyK
         ZtttihiqgmtNu5Es+sAnm/dYyfynSfPPKnZeB4Rc8zCtLnHkUkl/uiOUXscdA9/CQPaP
         zvJgVlSHf30QhM2F6eUCObI4qtONIzdB8hBWyml6wjQcIUHAfun6mJZWuqWqqVtcmOUW
         8WSVOkBd/yeyttS/chSiQrHY5cL0R/fQznN7pRodeDarzX+TkiDudO7ic3qiy2IeHFNx
         zIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=apiWtnyGOMWCuS6Vht2xIlsRwnMXQe/x1uJaSrzYCPk=;
        b=6W/Yjoxr4QKdCdno35XuKC8hIf08WM+FvDefhO1opkkuJf9QvgaEyps+qlAQ6wmfMX
         V2yr9A3c8RB6/M+bRoGoEJVjAA5ds5CZdvqKIfcd0FegVpX72zJlqFpVm0X8y1Y9iH6x
         T0c6/Rsrdo7078FQMdPe3ZSRp0RniBUEv4fmbJrdtxRKMN+ARNgk11N9TFK2oXGpS3KT
         GUIMvsU2Ci58TxcRuL2oBEtblmJXfCJpztsH1+L4dLOC5V8Uo+mi3sK1Po7sOQMB3PLY
         FJyoePqGJG0XjggOo8j/hp56m96l8CJY4XGs5nttKb7PhfPFSscNU/0M167dYFKK1G+v
         WHyQ==
X-Gm-Message-State: ACrzQf2tL/nnU+5+TjD1HGDsdar5QdRNMtJ3KHFJzPaV6kPXGRRw0+0m
        pEkmUhxr4T7V+WbvgsDDscCV2TLdr7o=
X-Google-Smtp-Source: AMsMyM5IAlktZ+g2EkITe1hMMDU+9SXG2hOH84mjNg4Yhp3W7Zd/bMdGZRHmvJgUqcQ3DVHLR33m2A==
X-Received: by 2002:a05:6a00:23d3:b0:548:45c:4f9f with SMTP id g19-20020a056a0023d300b00548045c4f9fmr12954651pfc.62.1664610009168;
        Sat, 01 Oct 2022 00:40:09 -0700 (PDT)
Received: from [192.168.1.5] ([110.77.216.177])
        by smtp.googlemail.com with ESMTPSA id u11-20020a170902714b00b00176a47e5840sm3158326plm.298.2022.10.01.00.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 00:40:08 -0700 (PDT)
Message-ID: <a08d72d9-f5c3-e43d-bd13-3d83fca41823@gmail.com>
Date:   Sat, 1 Oct 2022 14:40:04 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Content-Language: en-US
To:     Davide Tronchin <davide.tronchin.94@gmail.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <20220930152344.7877-1-davide.tronchin.94@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <20220930152344.7877-1-davide.tronchin.94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/30/2022 22:23, Davide Tronchin wrote:
> The LARA-R6 module has the following USB identifiers:
> Vendor  ID: 0x05c6
> Product ID: 0x908b
> 
> The USB composition exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions

The USB Id 05c6:908b belongs to Qualcomm and is not reserved for Ublox - 
it is used by other companies, Simtech is one of them.
The generic Windows driver from Qualcomm and the same driver from 
Simtech defines the interfaces as:

MI_00 Qualcomm HS-USB MSM Diagnostics 908B
MI_01 Qualcomm HS-USB NMEA 908B
MI_02 Qualcomm HS-USB Modem 908B-2
MI_03 Qualcomm HS-USB Modem 908B-3
MI_04 Qualcomm HS-USB WWAN Adapter 908B

MI_00 Simtech Wireless HS-USB MSM Diagnostics 908B
MI_01 Simtech Wireless HS-USB NMEA 908B
MI_02 Simtech Wireless HS-USB Modem 908B-2
MI_03 Simtech Wireless HS-USB Modem 908B-3
MI_04 Simtech Wireless HS-USB WWAN Adapter 908B

The net interface in both cases is a QMI interface
which has to be blacklisted in the option driver.
Please provide a v2 of your patch reflecting this.

thanks
Lars



