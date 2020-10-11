Return-Path: <SRS0=tQHF=DS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77021C433E7
	for <linux-usb@archiver.kernel.org>; Sun, 11 Oct 2020 18:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42A672078B
	for <linux-usb@archiver.kernel.org>; Sun, 11 Oct 2020 18:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJKSdF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 11 Oct 2020 14:33:05 -0400
Received: from smtprelay0166.hostedemail.com ([216.40.44.166]:60868 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725909AbgJKSdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Oct 2020 14:33:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 72AC518224D6B;
        Sun, 11 Oct 2020 18:33:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: smell48_4f01435271f4
X-Filterd-Recvd-Size: 4300
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Sun, 11 Oct 2020 18:33:01 +0000 (UTC)
Message-ID: <6307397bd43636fea2e7341d24417cbbc3aaf922.camel@perches.com>
Subject: Re: [PATCH v2] net: usb: rtl8150: don't incorrectly assign random
 MAC addresses
From:   Joe Perches <joe@perches.com>
To:     Jakub Kicinski <kuba@kernel.org>,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     petkan@nucleusys.com, davem@davemloft.net,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au
Date:   Sun, 11 Oct 2020 11:33:00 -0700
In-Reply-To: <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
         <20201011173030.141582-1-anant.thazhemadam@gmail.com>
         <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 2020-10-11 at 10:59 -0700, Jakub Kicinski wrote:
> On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam wrote:
> > In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
> > that was read must be copied over. Otherwise, a random ethernet address
> > must be assigned.
> > 
> > get_registers() returns 0 if successful, and negative error number
> > otherwise. However, in set_ethernet_addr(), this return value is
> > incorrectly checked.
> > 
> > Since this return value will never be equal to sizeof(node_id), a
> > random MAC address will always be generated and assigned to the
> > device; even in cases when get_registers() is successful.
> > 
> > Correctly modifying the condition that checks if get_registers() was
> > successful or not fixes this problem, and copies the ethernet address
> > appropriately.

There are many unchecked uses of set_registers and get_registers
 in this file.

If failures are really expected, then it might be better to fix
them up too.

$ git grep -w '[gs]et_registers' drivers/net/usb/rtl8150.c
drivers/net/usb/rtl8150.c:static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
drivers/net/usb/rtl8150.c:static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYDAT, 2, data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYADD, sizeof(data), data);
drivers/net/usb/rtl8150.c:      set_registers(dev, PHYCNT, 1, &tmp);
drivers/net/usb/rtl8150.c:              get_registers(dev, PHYCNT, 1, data);
drivers/net/usb/rtl8150.c:      ret = get_registers(dev, IDR, sizeof(node_id), node_id);
drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, netdev->addr_len, netdev->dev_addr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:              set_registers(dev, IDR_EEPROM + (i * 2), 2,
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &data);
drivers/net/usb/rtl8150.c:              get_registers(dev, CR, 1, &data);
drivers/net/usb/rtl8150.c:      set_registers(dev, RCR, 1, &rcr);
drivers/net/usb/rtl8150.c:      set_registers(dev, TCR, 1, &tcr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      get_registers(dev, MSR, 1, &msr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      set_registers(dev, CR, 1, &cr);
drivers/net/usb/rtl8150.c:      get_registers(dev, CSCR, 2, &tmp);
drivers/net/usb/rtl8150.c:      set_registers(dev, IDR, 6, netdev->dev_addr);
drivers/net/usb/rtl8150.c:      get_registers(dev, BMCR, 2, &bmcr);
drivers/net/usb/rtl8150.c:      get_registers(dev, ANLP, 2, &lpa);


