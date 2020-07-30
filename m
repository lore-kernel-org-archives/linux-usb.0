Return-Path: <SRS0=eqp3=BJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A96AC433E5
	for <linux-usb@archiver.kernel.org>; Thu, 30 Jul 2020 08:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C9D2075F
	for <linux-usb@archiver.kernel.org>; Thu, 30 Jul 2020 08:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=billauer.co.il header.i=@billauer.co.il header.b="cZPTIZsF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgG3Ih0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 30 Jul 2020 04:37:26 -0400
Received: from mx.xillybus.com ([193.29.56.92]:41568 "EHLO mx.xillybus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728646AbgG3IhZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 04:37:25 -0400
X-Greylist: delayed 544 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jul 2020 04:37:25 EDT
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
        by mx.xillybus.com (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 06U8S1je020062;
        Thu, 30 Jul 2020 08:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=billauer.co.il;
        s=choice2019; t=1596097682;
        bh=c1SHaf/jAtuxKE+uQjqTW3Hx7KGIDjbW40Eh5b1YFSY=;
        h=Date:From:CC:Subject:References:In-Reply-To:From;
        b=cZPTIZsFEjEn6mRJ6SZ9OuUpLyc7Avjg0JEP4rxh3nuAJ6EoLzk4p5R8wWNcVuzhb
         ISwVX7bIrGxgfDTzztJC9KKt+4/oYEKuzlazWbxWQm5Rq0nArF2oaYs375GvBSdwj5
         v9DJgaWfkINlugRp41n2mFMc5HXVoTVxI39Jx+aI=
Message-ID: <5F22847C.6000203@billauer.co.il>
Date:   Thu, 30 Jul 2020 11:27:40 +0300
From:   Eli Billauer <eli@billauer.co.il>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
CC:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de, stern@rowland.harvard.edu
Subject: Re: [PATCH v3] usb: core: Solve race condition in anchor cleanup
 functions
References: <20200730082338.23709-1-eli.billauer@gmail.com>
In-Reply-To: <20200730082338.23709-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Just to save you the effort: This patch v3 is exactly like v2, only 
without the unlikely() calls, which I dropped per Alan's advice.

Thanks,
    Eli
