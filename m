Return-Path: <SRS0=IeTI=3L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8840CC3F68F
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 01:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 524142467B
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 01:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579657474;
	bh=In8/rc3BW+oOPpSmXQWQIOiZ6Glo53qCqKnUMJrC+04=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=b79oE4NQEgWtsLJSjxpTki3uYHoYNCyURL3FXn/5LcP+dcPlCCfNP0rHbOPD+W2dy
	 sX0XaHRhPhYvTO8n2ReVjmMokEQeC/OABvlAXpud7w6nKhoGp6ZE104IZyauZCeKq9
	 RLstWfXitmxkulNkZDYB+1a5Tv6FOC6XxymtEo4Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgAVBod (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 Jan 2020 20:44:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:43776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728901AbgAVBod (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 20:44:33 -0500
Received: from [192.168.1.20] (cpe-24-28-70-126.austin.res.rr.com [24.28.70.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC5E024676;
        Wed, 22 Jan 2020 01:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579657473;
        bh=In8/rc3BW+oOPpSmXQWQIOiZ6Glo53qCqKnUMJrC+04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pVwCjsz32Hf9VlPxq9M6KLUxSbFwDoncOkdneA71CzJhASpLos+/L7gAohQN9Thtg
         LCp4zSUqZR9nXbMD8JkFlDmQoPB/wo/LsaQEOyq0OONntnTGrtqyswsK+qHrAmNhKU
         zssg9x0GRRKwQNdWtxKqZDhP5gm2fDpSqi+TX8eM=
Subject: Re: [PATCH v2 net-next] net: convert suitable drivers to use
 phy_do_ioctl_running
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Miller <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Doug Berger <opendmb@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Steve Glendinning <steve.glendinning@shawell.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list@broadcom.com,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
From:   Timur Tabi <timur@kernel.org>
Message-ID: <fc53f36b-9365-c8c6-0be5-cffbf403356a@kernel.org>
Date:   Tue, 21 Jan 2020 19:44:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/21/20 3:09 PM, Heiner Kallweit wrote:
>   drivers/net/ethernet/qualcomm/emac/emac.c      | 14 +-------------

Acked-by: Timur Tabi <timur@kernel.org>

