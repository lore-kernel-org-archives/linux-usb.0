Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C4DC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 09:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E94DB20848
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 09:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8obgJu3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfDOJid (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 05:38:33 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46041 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfDOJid (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 05:38:33 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so8033200lfl.12
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PS+LhOR1oYrTQs4Q7InKSq4JRw6FZb4tsMaqR6yao5Y=;
        b=a8obgJu3CPNOcqdHdgbsxlN0/zpAJhWWhtjO4mjiKFoiUh/kxeC5G1KixawVtR6AT/
         zkYIiwloxcNSLF1bDDIJqpx/AD2H6O77o8eRMdBM+t44r1VCpHWv6s/J9p+qcYKtDdtc
         ZhSO8N5CkSZBI3u2HRi3ZwxO/8PcvHcZtjTquebvoMPWfWtA731RidLDiU5adH9zCZHu
         kCtC6aWYHh9aPKPn9zRuiTMs/SD+D39YV4CNOl5G4592J38SwqKaWA9RZh+aTD2PFkCy
         oCM02p/js/qC5gesRe+KscIUDPO2YeGdRsdKCy8DP/JO/w5TkBVk0s9MbDd61E22Ik1t
         EY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PS+LhOR1oYrTQs4Q7InKSq4JRw6FZb4tsMaqR6yao5Y=;
        b=ppYBMq4p1beRfE0zF2cARHrZ7ymqbT1dHVIViLvanNrmmtvDo1pUunXPyGOwV5dVkB
         OEYkELXcD8AShxaAzwvDkmhvg+pgo7sI7r7SgIndoxTyp0cKNumf42V87/sDoy8lW6TI
         bXL6+ZdPO9ukFYfgS2zXbw9Qfg2Ufn9ITp6FiyESdgPSgqMvfd9kGy2r8XQRoTIrjA59
         YauKZb9szwngVwyeUhgwdboz5j3vA1MTqvTDS8jVkg5uYQYkmy9Tc3xxeXx714rUYPb5
         3+YgS78xHfOLbgie4Soyx8PydUmjxBVPx05NQuLnJlQQwDosDBSZxelGHYr51xCJn9HU
         LRQA==
X-Gm-Message-State: APjAAAWShrVQfVjeqypARG53ylRDGJNdvPltIJy6dnvGbhjF9RRNGW13
        30o0WCvxsbzRnicZY9eP1YXQcGmlL+A=
X-Google-Smtp-Source: APXvYqyOnDdwj0Et12L5myehe5fhhFd8tbGB5mWTOlb1gpqka6eaWzGp7YtUmunFsSLDnmQ91h7vrA==
X-Received: by 2002:a19:6619:: with SMTP id a25mr40056535lfc.21.1555321110775;
        Mon, 15 Apr 2019 02:38:30 -0700 (PDT)
Received: from [192.168.0.140] (rev-10.ethnet.com.pl. [87.204.29.10])
        by smtp.gmail.com with ESMTPSA id 77sm9931335ljc.69.2019.04.15.02.38.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 02:38:29 -0700 (PDT)
Subject: Re: [EXT] Re: Why there is a refcnt check when we change configfs
 property
To:     Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <VI1PR04MB5327CD7017881B1F0D70730A8B560@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87tvfghh5u.fsf@linux.intel.com>
 <VI1PR04MB5327F6BA759FD5B0FDADC71C8B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com>
 <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <17c2afd6-0390-d3e7-eae1-718234aeca6f@gmail.com>
 <VI1PR04MB53278B8F18FBCC3544C04A4B8B2F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <f1b63809-8a67-29d4-f2b5-ddb6f3f99034@gmail.com>
Date:   Mon, 15 Apr 2019 11:38:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB53278B8F18FBCC3544C04A4B8B2F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

<snip>

>>
>> Can you please describe your use case?
>>
>> Andrzej
> 
> I would like to change parameters for function driver through configfs, below is the example for ncm and f_sourcesink cases,
> thanks.
> 
> if [ "$FUNC" == "ncm" ]; then
> mkdir functions/$FUNC".0"
> ln -s functions/$FUNC".0" configs/c.1
> echo 10 > functions/ncm.0/qmult
> echo "12:a5:cf:42:92:fd" > functions/ncm.0/host_addr
> echo "5e:bc:ca:27:92:b1" > functions/ncm.0/dev_addr
> fi
> 
> if [ "$FUNC" == "ss" ]; then
> cd /sys/kernel/config/usb_gadget
> cd g1
> echo "0x0525" > idVendor
> echo "0xa4a0" > idProduct
> export FUNC="SourceSink"
> mkdir functions/$FUNC".0"
> ln -s functions/$FUNC".0" configs/c.1
> cd functions/$FUNC".0"
> echo 1 > pattern
> echo 1 > isoc_interval
> echo 1024 > isoc_maxpacket
> echo 2 > isoc_mult
> #isoc_maxburst
> echo 1024 > bulk_buflen
> echo 16 > bulk_qlen
> echo 16 > iso_qlen
> fi
> 
> Peter
> 


I think I don't quite understand the problem: just postpone issuing
ln -s until after echo <something> > <configfs attribute>.

Andrzej
