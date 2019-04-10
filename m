Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4D8C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 10:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20F7B2133D
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 10:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfDJKIy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:08:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:46212 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728543AbfDJKIy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 06:08:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 34F62AECE;
        Wed, 10 Apr 2019 10:08:53 +0000 (UTC)
Message-ID: <1554890928.21725.6.camel@suse.com>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
From:   Oliver Neukum <oneukum@suse.com>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 10 Apr 2019 12:08:48 +0200
In-Reply-To: <20190410172917.23cb7d0e@xhacker.debian>
References: <20190408143443.335f7e93@xhacker.debian>
         <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
         <20190408160551.03911b27@xhacker.debian>
         <20190409144655.753d3bd9@xhacker.debian>
         <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com>
         <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
         <20190410172917.23cb7d0e@xhacker.debian>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mi, 2019-04-10 at 09:37 +0000, Jisheng Zhang wrote:
> On Tue, 9 Apr 2019 09:28:16 +0000 Minas Harutyunyan wrote:

Hi,

> > dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> > So, 8000 interrupts per second is expectant behavior.
> 
> Makes sense. 8 microframes each 1ms, so 8*1000 = 8000 interrupts/s

The remedy for that would be using autosuspend. That just tells us that
support for autosuspend is not optional.

	Regards
		Oliver

