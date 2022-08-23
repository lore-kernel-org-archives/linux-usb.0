Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8D7C32772
	for <linux-usb@archiver.kernel.org>; Tue, 23 Aug 2022 15:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242996AbiHWPTS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Aug 2022 11:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242484AbiHWPS6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 11:18:58 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B150B86055
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 03:41:52 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 897CE84600;
        Tue, 23 Aug 2022 12:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661251235;
        bh=DGXAuy+8rT+Th3u0T2i6pRviDym/zwfuOLdKxe3jsJY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Yoc7gdRFdF5KJCYl4D9uS3a18vlF1qxaOXCDr12bkmCHtZw3piQsx+XdINPET2t4q
         wsvC4zGiiPUP64BW9LYIZOYG9I/cyzbNOX1W2Xs6zNxEOhV4vwWpmB1SuUA2Y2Whx4
         xh9O+KsLxiBoPgcFzu5lDDAF6qLE4i/2yj9rfQfOfowEpNYoSeC2kXrg3WRYhUHFQG
         vBlQ4qucJpas8oPbbBpEqNvDgLZUqwqtVdNYBYhLhPxtK2qgKWoAxK08HSO1FFH9Ph
         9sfI1svYzeFqHkd2T0PEc4CPfvNIZX2FsN5gq6t+lP410Dnk0+PjyWl3GIBsIv8IZm
         XqVNd3EWWyBFQ==
Message-ID: <d2bef50b-5261-94e1-0e54-8af8f5f06c8c@denx.de>
Date:   Tue, 23 Aug 2022 12:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>
Cc:     linux-usb@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de> <YujU1Nnert6h/691@kuha.fi.intel.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YujU1Nnert6h/691@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/2/22 09:40, Heikki Krogerus wrote:
> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>> which can expose details collected by the TUSB320 in a far more
>> precise way than extcon. Since there are existing users in the
>> kernel and in DT which depend on the extcon interface, keep it
>> for now.
>>
>> Add TYPE-C interface and expose the supported supply current,
>> direction and connector polarity via the TYPE-C interface.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

I wonder, can this now be applied ?

The LKP robot is picking up on macro name, i.e. the report seems bogus ?
