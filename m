Return-Path: <SRS0=/djJ=6A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F03C2BA2B
	for <linux-usb@archiver.kernel.org>; Thu, 16 Apr 2020 23:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C120E2078B
	for <linux-usb@archiver.kernel.org>; Thu, 16 Apr 2020 23:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c80SbM2a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgDPXRn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Apr 2020 19:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgDPXRn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 19:17:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA69AC061A0F
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 16:17:41 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id e25so216941ljg.5
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 16:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JC7D88QOw4Bs6yyETfbWvE0jts1FtmFkCIKCKwF147E=;
        b=c80SbM2aPucury6aK6zHE9MqdtWGwG8E0pJX303/m4NoFKfUxDv8+6kLUvrDD7qOv1
         dD01tEQgmAJ1CyVyg+OoZahUteq0YbBkGAWSV78CrM5poX03xwFt8wy2BiadMo6UJU/1
         zyM88JvIGxlXTycjNxNdt20f61T1NvpCWuOsXibanr0UhmISMSye5gnELJbk3dRoT/kM
         HdvrIZh3TYYHzY1PxJlWjAo8Febw4CHGZO+SRPiXsutVrA7Rlx84ZWJ95akxuf6x7/Mf
         ltlsm9uFWZKGuRVOyy5V4LU6xT1gy94UFiYPnjaOlye1H//L2n2NwqVgf2G/CdwYM9p6
         aCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JC7D88QOw4Bs6yyETfbWvE0jts1FtmFkCIKCKwF147E=;
        b=sDRY8iwSRiXTEIcfhzqDtx2AK/GBHyiSZp5zSWwzyIwTBxb5Lk1B9k9j9CsZiqdmOU
         Kjye6FEWTxv7QQATSHsnW/3u3jdCLfUVYKhUcY+jh0APMe5RJtcwswLdFFWvBKu76bky
         zz8swKGb1wKC8kn3lmKoqNpvMPIde5BK+TpvfuaZGqUE3KyfwLi4ZsN0DZNzXvKdYoDu
         XDaWwso4aBv07/BXuo/RxqPbUzl7XAE8senCbk2PCy90ovYF1Kzv+6mLfgwtutAy6IAr
         USlJ90STzR6Y7/eSTCeYvEw0jUm+uTccMZi4ak8fjJefgwxWcnZqsMKSAdkmyX/d1vnj
         +6Fw==
X-Gm-Message-State: AGi0PuYlEr6/7CQJnyepxVHdGAamDqwwDH3yVy4Go1ydHbVJQCWaNllZ
        SBXlBZpr+vwFs7Ptji7KdKOKSj/1K8273gRZdeU=
X-Google-Smtp-Source: APiQypJ2fdw7Ixp6KnEhAtI9U4czHUCANiSG2R7knLg+nkKRE9Hm5boKJf5c6W74Qt+AHHHVX9LzOZO/Oy7f1G0UB0E=
X-Received: by 2002:a2e:a40d:: with SMTP id p13mr268192ljn.264.1587079059975;
 Thu, 16 Apr 2020 16:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200416120825.65013-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200416120825.65013-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Fri, 17 Apr 2020 02:17:23 +0300
Message-ID: <CA+CmpXtRZBt26E7rMNtZyNZdjjcqLuc84YfUNS0WgoWzQZhyBw@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Tiger Lake
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 16, 2020 at 3:08 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Tiger Lake integrated Thunderbolt/USB4 controller is quite close to
> Intel Ice Lake. By default it is still using firmware based connection
> manager so we can use most of the Ice Lake flows in Tiger Lake as well.
> We check if the firmware connection manager is running and in that case
> use it, otherwise use the software based connection manager.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Yehezkel Bernat <yehezkelshb@gmail.com>
