Return-Path: <SRS0=gdTw=7J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3913AC433DF
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 15:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FE9720776
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 15:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbgE0Pl7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 May 2020 11:41:59 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44447 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgE0Pl7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 11:41:59 -0400
X-Originating-IP: 81.6.44.16
Received: from [172.22.0.20] (unknown [81.6.44.16])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 708831BF206;
        Wed, 27 May 2020 15:41:56 +0000 (UTC)
Subject: Re: [PATCH v2 3/6] USB: serial: ch341: Limit prescaler on quirky
 chips
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1585697281.git.public@hansmi.ch>
 <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
 <20200514141743.GE25962@localhost> <20200527131658.GJ5276@localhost>
From:   Michael Hanselmann <public@hansmi.ch>
X-Hello-World:  This header intentionally left blank
Message-ID: <d8d0aabe-0ea2-dac9-e2ba-38306567610b@msgid.hansmi.ch>
Date:   Wed, 27 May 2020 17:41:56 +0200
MIME-Version: 1.0
In-Reply-To: <20200527131658.GJ5276@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.05.20 15:16, Johan Hovold wrote:
> I've applied the above fix on top of your quirk-detection patch so that
> we can get this into 5.8 and backported to stable.

I tested ch341 on usb-next at c432df15591958. The adapter kept working
for all tested baud rates from 75 to 200000 in 75bd intervals.

Will reply to your comments on the other patches in this series soon.
Didn't get around to it yet.

Michael
