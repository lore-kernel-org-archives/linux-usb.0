Return-Path: <SRS0=AEFe=UA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80E8C28CC1
	for <linux-usb@archiver.kernel.org>; Sat,  1 Jun 2019 09:33:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A609D271B4
	for <linux-usb@archiver.kernel.org>; Sat,  1 Jun 2019 09:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="z64K0Ing"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfFAJdL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 1 Jun 2019 05:33:11 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36242 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfFAJdL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jun 2019 05:33:11 -0400
Received: by mail-ed1-f66.google.com with SMTP id a8so18624498edx.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Jun 2019 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Nv4hZyz+0MvJm7lVxK7rxIH8vfe3tOTDoAcBFT0O2G4=;
        b=z64K0InggM+DjNPlH4XcrZ60sg1osb8g90+ui5cL68bnkcb2WP/1wNCBQ1IA/6IwZi
         gL116qbX54TNb3nmnh6PIVxDrROuFrijJmataYcD904oFyjFOqcdYZojs9ISR5PlMpao
         o2CJ6U8HVQflR0ZgIJkpElbh5clPPBE1D59j3KaJV2IsmzeVuACo4I3VPdcp2oWZOBFQ
         RgskGcaZiRpwD9C+ubLYsoH4UVeoykmU67YQbM+f+Abquy6ifYyWWPGZdlqwtJdoycr4
         fjWzIZQ7RNmbh1DbSCxZSVyuc0S0KOABpvvu5OL5lma1ZtmpYsRbEfpsW9qi8LoS5oKn
         +Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nv4hZyz+0MvJm7lVxK7rxIH8vfe3tOTDoAcBFT0O2G4=;
        b=mmU6ES0gbpExoXz3yMQqp7WFJtZ327SEMnfKUNq1z3lEW7D6YeGRjjCMD5fyxn2H7z
         PFSBh/AbgZCEc50abXpHXn/E4O8gn9AlbAD4K/8u5pIJ8cxwv5F/p07FitK48+lgig+H
         zOO2cc36NpaVkewTWR2vNHMC8bNxCB39PQuUVdaQOHbhqrzFVQ7SxBMI/VosMXPA2I5W
         sTPyIEl34zBIr9ARsYZj6Is2R7pZhQBzkbrKh/CODmtXRgIDnOIcuguADmOEGgv8z9T8
         Qpxw6hPeyhvDBZ48SaSxVAyZ3qdvLW4dJ7vOZ2AgZT/U0SMhygqEZgjBqomlyxxrCnlM
         zOlw==
X-Gm-Message-State: APjAAAW5FnRe7NF/LZXjhx/VatC7b3ktiaQXRYld9RUa4WOrzEaI1V0+
        WCdcVLELOqasGeowqeImnt+2blUpdEzgOZQA0fU=
X-Google-Smtp-Source: APXvYqxAgFZYCSDa7f5erpezt+pfXGfmzRrY/bqvNjjjGmN+Uq3I/kjDGubHEQUv+nrcBLogYgl22Q==
X-Received: by 2002:a50:87d4:: with SMTP id 20mr17090898edz.100.1559381589638;
        Sat, 01 Jun 2019 02:33:09 -0700 (PDT)
Received: from [10.104.24.142] ([78.31.204.6])
        by smtp.gmail.com with ESMTPSA id l19sm2281945edc.84.2019.06.01.02.33.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 02:33:08 -0700 (PDT)
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
To:     Marco Zatta <marco@zatta.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20190601075257.GA24550@jimmy.localdomain>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e77aaee7-ddcb-58ff-2dcf-d1fff21a9e07@cogentembedded.com>
Date:   Sat, 1 Jun 2019 12:33:06 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190601075257.GA24550@jimmy.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 01.06.2019 10:52, Marco Zatta wrote:

> This patch fixes the chipmunk-like voice that manifets randomly when
> using the integrated mic of the Logitech Webcam HD C270.
> 
> The issue was solved initially for this device by commit
> 2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
> e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix

    It's not how you should cite the commits, see below:

<12-digit SHA1> ("<summary>")

> back.
> 
> Signed-off-by: Marco Zatta <marco@zatta.me>
[...]

MBR, Sergei
